#!/bin/bash

GCC_VERSION=6.3.0
TRIPLE=nanomips-elf
CLANG_VERSION=13.0.0
BUILD_DIR=build
CMAKE="/mtkoss/cmake/cmake-3.19.5-Linux-x86_64/bin/cmake"
LLVM_PROJ=$PWD/llvm-project
REPOSITORY="https://gerrit.mediatek.inc/MD-SHAOLIN/llvm-project"
BRANCH="mtk/nanomips-nongnu"
NEWLIB_SRC="$PWD/newlib"
NEWLIB_REPOSITORY="https://gerrit.mediatek.inc/MD-SHAOLIN/MIPS/newlib"
NEWLIB_BRANCH=mtk/newlib250
HOST_GCC="/mtkoss/Thor/gcc-host/x86_64-pc-linux-gnu/10.2.0-centos6"
JOBS=8

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOST_GCC/lib64
export LD_LIBRARY_PATH
PATH=$HOST_GCC/bin:$PATH

help() {
    cat << EOF
Syntax: $0 [options] --gcc-toolchain seed_toolchain --version release_version
  options:
  --build-dir path_build_dir
  --llvm-project path_to_llvm_project
  --branch branch
  --repo repository
  --gcc-toolchain base-gcc-toolchain
  --cmake cmake_binary
  --jobs parallel_job_count
  --newlib-src path_to_newlib
  --newlib-branch newlib_branch
EOF
}

while [ $# -gt 1 ]; do
    case "$1" in
	--build-dir)
	    BUILD_DIR="$2"; shift ;;
        --repo|-r|--repository)
            REPOSITORY="$2"; shift ;;
	--llvm-project)
	    LLVM_PROJ="$2"; shift ;;
        --branch)
            BRANCH="$2"; shift ;;
        --gcc-toolchain)
            BASE_TOOLCHAIN="$2"; shift ;;
        --cmake)
            CMAKE="$2"; shift ;;
        --jobs)
            JOBS="$2"; shift ;;
        --version)
            VERSION="$2"; shift ;;
	--newlib-src)
            NEWLIB_SRC="$2"; shift ;;
	--newlib-branch)
	    NEWLIB_BRANCH="$2"; shift ;;
    esac
    shift;
done

if [ -z $BASE_TOOLCHAIN ]; then
    echo "Must specify nanomips GCC toolchain with --gcc-toolchain"
    help
    exit
fi
if [ ! -d $BASE_TOOLCHAIN ]; then
    echo "Can't find nanomips gcc toolchain in $BASE_TOOLCHAIN"
    exit
fi
if [ -z $CMAKE ]; then
    echo "Can't find cmake (you can specify one with --cmake path)"
    help
    exit
fi
if [ -z $VERSION ]; then
    echo "Must specify release version to build with --version"
    exit
fi

INSTALL_PATH=$PWD/gcc-elf/$VERSION
TARBALL="MediaTek.GNU.Tools.$VERSION.for.nanoMIPS.Bare.Metal.CentOS-6.x86_64.tar.gz"
PATH=$INSTALL_PATH/bin:$PATH
LIB_CFLAGS="-Os -mno-gpopt -ffunction-sections -fdata-sections -msoft-float -EL -U__mips__"

setup_base_toolchain() {
    if [ ! -d gcc-elf ]; then
	mkdir gcc-elf
    fi
    rsync -a $BASE_TOOLCHAIN/ $INSTALL_PATH || exit
    pushd $INSTALL_PATH
    rm -f linux
    ln -s ../$VERSION linux
    mv `basename $BASE_TOOLCHAIN` $VERSION
    popd
}

build_includes() {
    if [ ! -d $BUILD_DIR/include ]; then
	mkdir $BUILD_DIR/include
    fi
    $CMAKE -S $LLVM_PROJ/clang/lib/Headers \
	-B $BUILD_DIR/include \
	-DCMAKE_C_COMPILER=`which gcc`  \
	-DCMAKE_CXX_COMPILER=`which g++`  \
	-DLLVM_LIBRARY_OUTPUT_INTDIR=$INSTALL_PATH \
	-DCMAKE_MODULE_PATH=$LLVM_PROJ/llvm/cmake/modules \
	-DCLANG_VERSION=$CLANG_VERSION || exit
    pushd $BUILD_DIR/include
    make -j $JOBS install V=1 VERBOSE=3  || exit
    popd

    pushd ${INSTALL_PATH}/lib/gcc/$TRIPLE/$GCC_VERSION
    rm -Rf include include-fixed
    ln -s ../../../clang/${CLANG_VERSION}/include include
    popd
}

clone() {
    if [ ! -d $LLVM_PROJ ]; then
	echo "### Cloning"
	git clone  --branch="$BRANCH" "$REPOSITORY" $LLVM_PROJ || exit
    else
	pushd $LLVM_PROJ
	git checkout $BRANCH  || exit
	popd
    fi
}

build_llvm_config() {
    $CMAKE -S $LLVM_PROJ/llvm		\
	-B $BUILD_DIR			\
	-DCMAKE_C_COMPILER=`which gcc`  \
	-DCMAKE_CXX_COMPILER=`which g++`  \
        -DLLVM_ENABLE_TERMINFO=OFF \
        -DLLVM_TARGETS_TO_BUILD="Mips"  \
        -DLLVM_TARGET_ARCH=mips         \
        -DLLVM_ENABLE_PROJECTS=llvm  || exit
    make -j $JOBS -C $BUILD_DIR/tools/llvm-config  || exit
}

get_newlib_src() {
    if [ ! -d "$NEWLIB_SRC" ]; then
	echo "### Cloning newlib repository $NEWLIB_REPOSITORY into $NEWLIB_SRC"
	git clone --branch "$NEWLIB_BRANCH" "$NEWLIB_REPOSITORY" \
	    "$NEWLIB_SRC" || exit
    else
	pushd $NEWLIB_SRC
	git checkout $NEWLIB_BRANCH  || exit
	popd
    fi
    NEWLIB_SRC=$( cd "$NEWLIB_SRC"; pwd )
}

build_newlib() {
    echo "### Re-build standard C library with GCC toolchain"
    if [ ! -d $BUILD_DIR/newlib ]; then
	mkdir $BUILD_DIR/newlib
    fi
    pushd $BUILD_DIR/newlib
    echo "nanomips-r6-soft-newlib/lib
nanomips-r6-soft-time64-newlib/lib" > ml-nano-elf
    PATH=$INSTALL_PATH/bin:$PATH                                \
    CC_FOR_TARGET=nanomips-elf-gcc                              \
    CFLAGS_FOR_TARGET="$LIB_CFLAGS"                             \
    $NEWLIB_SRC/configure --srcdir=$NEWLIB_SRC                  \
	--with-newlib --with-cross-host=x86_64-pc-linux-gnu     \
	--prefix=$INSTALL_PATH                                  \
	--with-sysroot=$INSTALL_PATH/nanomips-elf               \
	--with-build-sysroot=$INSTALL_PATH/nanomips-elf         \
	--enable-newlib-io-c99-formats                          \
	--enable-newlib-long-time_t                             \
	--with-pkgversion="$VERSION"                            \
	--with-target-subdir=nanomips-r6-soft-newlib            \
	--build=x86_64-pc-linux-gnu                             \
	--host=nanomips-elf --target=nanomips-elf               \
	--enable-multlib                                        \
	--with-multi-buildlist=$PWD/ml-nano-elf  || exit
    PATH=$INSTALL_PATH/bin:$PATH make -j $JOBS || exit
    PATH=$INSTALL_PATH/bin:$PATH make install || exit
    popd
}

build_libcxx() {
    MBUILD="$1"
    MFLAGS="$2"
    MPATH=$3
    if [ ! -d $BUILD_DIR/$MBUILD ]; then
	mkdir $BUILD_DIR/$MBUILD
    fi

    $CMAKE -G Ninja -S $LLVM_PROJ/runtimes \
        -B $BUILD_DIR/$MBUILD                           \
	-DCMAKE_C_COMPILER=$INSTALL_PATH/bin/$TRIPLE-gcc \
	-DCMAKE_CXX_COMPILER=$INSTALL_PATH/bin/$TRIPLE-g++ \
	-DCMAKE_C_FLAGS="-march=i7200 -D__SOFTFP__ -fno-exceptions -isystem ${INSTALL_PATH}/lib/clang/$CLANG_VERSION/include -isystem ${INSTALL_PATH}/$TRIPLE/include -Tuhi32.ld -Wl,--defsym,__memory_size=256M ${LIB_CFLAGS} $MFLAGS" \
	-DCMAKE_CXX_FLAGS="-march=i7200 -D__SOFTFP__ -fno-exceptions -isystem ${INSTALL_PATH}/lib/clang/$CLANG_VERSION/include -isystem ${INSTALL_PATH}/$TRIPLE/include -Tuhi32.ld -Wl,--defsym,__memory_size=256M ${LIB_CFLAGS} -fno-use-cxa-atexit $MFLAGS" \
	-DLLVM_CONFIG_PATH=$BUILD_DIR/bin/llvm-config \
	-DCOMPILER_RT_INCLUDE_TESTS=ON \
	-DCOMPILER_RT_BUILTINS_ENABLE_PIC=OFF \
	-DCMAKE_C_COMPILER_TARGET="$TRIPLE" \
	-DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
	-DCOMPILER_RT_BAREMETAL_BUILD=ON \
	-DCOMPILER_RT_EMULATOR="$TRIPLE-run" \
	-DCOMPILER_RT_BUILD_CRT=ON \
	-DCOMPILER_RT_INSTALL_PATH=$INSTALL_PATH/lib/gcc/${TRIPLE}/${GCC_VERSION}/`dirname $MPATH` \
	-DCOMPILER_RT_OS_DIR="" \
	-DGNU_LD_EXECUTABLE=${INSTALL_PATH}/bin/nanomips-elf-ld \
	-DGOLD_EXECUTABLE=${INSTALL_PATH}/bin/nanomips-elf-ld \
	-DCOMPILER_RT_TEST_COMPILER_CFLAGS="-Tmti32.ld" \
	-DLIBCXX_ENABLE_EXCEPTIONS=OFF \
	-DLIBCXXABI_ENABLE_EXCEPTIONS=OFF \
	-DLIBCXX_ENABLE_SHARED=OFF \
	-DLIBCXXABI_ENABLE_SHARED=OFF \
	-DLIBCXX_ENABLE_THREADS=OFF \
	-DLIBCXXABI_ENABLE_THREADS=OFF \
	-DLIBCXXABI_ENABLE_PIC=OFF \
	-DLIBCXX_ENABLE_FILESYSTEM=OFF \
	-DLIBCXX_ENABLE_MONOTONIC_CLOCK=ON \
	-DLIBCXXABI_INCLUDE_TESTS=ON \
	-DLIBCXX_INCLUDE_TESTS=ON \
	-DLLVM_ENABLE_RUNTIMES="compiler-rt;libcxx;libcxxabi" \
	-DCMAKE_BUILD_TYPE=MinSizeRel \
	-DLIBCXX_ENABLE_EXPERIMENTAL_LIBRARY=OFF \
	-DLIBCXX_ENABLE_INCOMPLETE_FEATURES=OFF \
	-DCMAKE_POSITION_INDEPENDENT_CODE=OFF \
	-DCMAKE_INSTALL_PREFIX=${INSTALL_PATH}/$TRIPLE \
	-DCMAKE_INSTALL_PATH=${INSTALL_PATH}/$TRIPLE/lib/$MPATH \
	-DLIBCXX_INSTALL_LIBRARY_DIR=${INSTALL_PATH}/$TRIPLE/lib/$MPATH \
	-DLIBCXX_INSTALL_INCLUDE_DIR=${INSTALL_PATH}/$TRIPLE/include/c++-clang/$CLANG_VERSION/ \
	-DLIBCXX_INSTALL_INCLUDE_TARGET_DIR=${INSTALL_PATH}/$TRIPLE/include/c++-clang/$CLANG_VERSION \
	-DLIBCXXABI_INSTALL_LIBRARY_DIR=${INSTALL_PATH}/$TRIPLE/lib/$MPATH \
	-DLIBCXX_EXECUTOR="python3 ${LLVM_PROJ}/libcxx/test/../utils/run_qemu.py --path_to_qemu ${INSTALL_PATH}/bin/qemu-system-nanomips"  || exit

    ninja -C $BUILD_DIR/$MBUILD -v -v -v || exit
    ninja -C $BUILD_DIR/$MBUILD install || exit
}

cleanup_gnulibs() {
    pushd ${INSTALL_PATH}/$TRIPLE/lib/$MPATH
    rm -f libstdc++.a
    ${INSTALL_PATH}/bin/nanomips-elf-ar -rcT libstdc++.a libc++.a libc++abi.a
    rm -f nortti/libstdc++.a
    ${INSTALL_PATH}/bin/nanomips-elf-ar -rcT nortti/libstdc++.a libc++.a libc++abi.a
    popd

    for CLIB in `find $INSTALL_PATH -name libgcc.a | grep -e $MPATH`; do
	pushd `dirname $CLIB`
	rm -f libgcc.a crtbegin.o crtend.o
	ln -s ../../$MPATH/libclang_rt.builtins-nanomips.a libgcc.a
	ln -s ../../$MPATH/clang_rt.crtbegin-nanomips.o crtbegin.o
	ln -s ../../$MPATH/clang_rt.crtend-nanomips.o crtend.o
	popd
    done
}

test_compiler_rt() {
  # Proceed with the script past test failures
  ninja -C $BUILD_DIR/$1 check-compiler-rt | tee /dev/tty | grep -e "Testing Time:" -A 4 > $BUILD_DIR/$1/comprt.sum
}

test_libcxx()  {
    # Continue past test failures
    python3 $LLVM_PROJ/llvm/utils/lit/lit.py -v -v -v $BUILD_DIR/$1/libcxx/test --param=target_triple=$TRIPLE --param=builtins_library=-lgcc \
	| tee /dev/tty | grep -e "Testing Time:" -A 4 > $BUILD_DIR/$1/libcxx.sum
}

test_libcxx_interface() {
    if [ -d $BUILD_DIR/libcxx_interface ]; then
	rm -Rf $BUILD_DIR/libcxx_interface
    fi
    mkdir $BUILD_DIR/libcxx_interface
    pushd $BUILD_DIR/libcxx_interface
    PATH=$INSTALL_PATH/bin:$PATH $LLVM_PROJ/cross-project-tests/libcxx-interface-tests/build_run_libcxx_tests.sh $INSTALL_PATH | tee test.sum
    popd
}

print_test_summary() {
    echo "Compiler-RT Results:"
    tail -n +2 $BUILD_DIR/$1/comprt.sum
    echo "LibCXX Results:"
    tail -n +2 $BUILD_DIR/$1/libcxx.sum
    echo "libcxx_interface Results:"
    echo "TESTS: " `grep -c -e '>>>>.*:' $BUILD_DIR/libcxx_interface/test.sum`
    echo "FAIL: " `grep -c FAILED: $BUILD_DIR/libcxx_interface/test.sum`
    echo "PASS: " `grep -c PASSED: $BUILD_DIR/libcxx_interface/test.sum`
}

setup_base_toolchain
clone
build_llvm_config
build_includes
get_newlib_src
build_newlib

MULTI_OPTS=("" "-muse-64bit-time_t")
index=0
for opt in "${MULTI_OPTS[@]}"; do
    multidir=`$INSTALL_PATH/bin/$TRIPLE-gcc -print-multi-directory $opt`
    if [ $? -eq 0 ]; then
	build_libcxx runtimes-multi$index " $opt" $multidir || exit 1
	cleanup_gnulibs $multidir || exit 1
	index=$((index+1))
    else
	echo "Skipping unsupported $opt"
    fi
done

# Clean-up GNU headers
pushd ${INSTALL_PATH}/$TRIPLE/include/c++
rm -Rf ${GCC_VERSION}
ln -s ../c++-clang/${CLANG_VERSION} ${GCC_VERSION}
popd

echo "Writing ${TARBALL}"
tar --owner=0 --group=0 -pczf $TARBALL gcc-elf/$VERSION

# FIXME: multi-lib testing
test_compiler_rt runtimes-multi0
test_libcxx runtimes-multi0
test_libcxx_interface

print_test_summary runtimes-multi0
