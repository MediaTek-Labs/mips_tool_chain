#!/bin/bash -x
# -----------------------------------------------------------------------------
# Copyright (c) 2022-2026 MediaTek Inc. All Rights Reserved.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#   * Redistributions of source code must retain the above copyright
#     notice, this list of conditions, and the following disclaimer.
#   * Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions, and the following disclaimer in the
#     documentation and/or other materials provided with the distribution.
#   * Neither the name of MediaTek Inc. nor the names of its
#     contributors may be used to endorse or promote products derived
#     from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL MEDIATEK INC. BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES, LOSS OF USE, DATA, OR PROFITS, OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# -----------------------------------------------------------------------------

# Load site configuration
source ${0/.sh/.cfg}

ENABLE_ASSERTIONS=On
PREFIX="nanomips-elf-"
LLVM_TARGETS="Mips"
OBS=$(nproc || echo 8)
BUILD_MINGW=false
BUILD_DARWIN_AARCH64=false
BUILD_DARWIN_X86=false
SCRIPT_DIR=`dirname $0`
CHECK=true
BUILD_DIR=build
LLVM_PROJ=$PWD/llvm-project
ENABLE_THREADS_LIBCXX=true
TRIPLE=nanomips-elf
DEV_BUILD=false
SKIP_CLANG_PATTERN=""
NEWLIB_SRC="$PWD/newlib"
BUILD_RELEASE_COMMAND=$( echo "$0 $*" | sed 's/--test-sim [^ ]\+ //' )
POSTINSTALL_CHECK=true
CCACHE_BUILD=Off


help() {
    cat << EOF
Syntax: $0 [options] --version release_version
  options:
  --repo repository
  --hosttools gcc_dir
  --branch branch
  --cmake cmake_binary
  --python python_binary
  --jobs parallel_job_count
  --build-mingw
  --build-darwin/--build-darwin-x86
  --build-darwin-aarch64
  --mingw path_to_mingw
  --darwin-tools path_to_darwin_tools
  --no-check
  --build-dir path_build_dir
  --llvm-project path_to_llvm_project
  --disable-threads-libcxx
  --enable-threads-libcxx
  --rebuild-newlib
  --newlib-src path_to_newlib
  --newlib-branch newlib_branch
  --dev-build (quicker build; skip archive artefacts)
  --elftools (skip clang from archive)
  --no-postinstall-check
  --enable-assertions
  --disable-assertions
  --test-sim path_to_qemu
  --ccache
  --ninja
  --help
EOF
}

while [ $# -ge 1 ]; do
    case "$1" in
        --repo|-r|--repository)
            REPOSITORY="$2"; shift ;;
        --hosttools)
            HOST_GCC="$2"; shift ;;
        --branch)
            BRANCH="$2"; shift ;;
        --cmake)
            CMAKE="$2"; shift ;;
        --python)
            PYTHON="$2"; shift ;;
        --llvm-targets)
            LLVM_TARGETS="$2"; shift ;;
        --version)
            VERSION="$2"; shift ;;
        --jobs)
            JOBS="$2"; shift ;;
        --mingw)
            MINGW="$2"; shift ;;
        --darwin-tools)
            DARWIN_TOOLS="$2"; shift ;;
        --build-dir)
            BUILD_DIR="$2"; shift ;;
        --llvm-project)
            LLVM_PROJ="$2"; shift ;;
        --build-mingw)
            BUILD_MINGW=true ;;
        --build-darwin-aarch64)
            BUILD_DARWIN_AARCH64=true ;;
        --build-darwin-x86|--build-darwin)
            BUILD_DARWIN_X86=true ;;
        --enable-threads-libcxx)
            ;; # enabled by default
        --disable-threads-libcxx)
            ENABLE_THREADS_LIBCXX=false ;;
        --newlib-src)
            NEWLIB_SRC="$2"; shift ;;
        --newlib-branch)
            NEWLIB_BRANCH="$2"; shift ;;
        --no-check)
            CHECK=false ;;
        --dev-build)
            DEV_BUILD=true ;;
        --elftools)
            SKIP_CLANG_PATTERN="--exclude=bin/nanomips-elf-clang*" ;;
        --no-postinstall-check)
            POSTINSTALL_CHECK=false ;;
        --enable-assertions)
            ENABLE_ASSERTIONS=On ;; # default, supported just for backward compatibility.
        --disable-assertions)
            ENABLE_ASSERTIONS=Off ;;
        --test-sim)
            TEST_SIM="$2"; shift ;;
        --ccache)
            CCACHE_BUILD=On ;;
        --ninja)
            NINJA="$2"; shift ;;
        --help)
            help; exit ;;
        *)
            echo "Unknown option '$1'"
            exit 2 ;;
    esac
    shift;
done

if [ -z $CMAKE ]; then
    echo "Can't find cmake (you can specify one with --cmake path)"
    help
    exit
fi

if [ -z $LLVM_TARGETS ]; then
    echo "Must specify LLVM targets to build with --llvm-targets"
    exit
fi

if [ -z $VERSION ]; then
    echo "Must specify release version to build with --version"
    help
    exit
fi

if [ -z "$TEST_SIM" -o ! -f "$TEST_SIM" ]; then
    $CHECK && echo "Can't find qemu binary at $TEST_SIM" && exit 1
fi

if [ -d $PYTHON ] || [ ! -x $PYTHON ]; then
    echo "error: '$PYTHON' is not a valid Python executable"
    help
    exit
fi

if [ -z "$NINJA" ]; then
    NINJA=`which ninja`
fi

if [ -z "$NINJA" -o ! -x "$NINJA" ]; then
    echo "error: Can't find ninja binary! $NINJA"
    exit
fi


# realpath doesn't always exist on the host
# readlink -f is more common
function realpath() {
    readlink -f "$@"
}

# For llvm versions >= 19 LLVM_VERSION_MAJOR is set in LLVMVersion.cmake
version_file=$LLVM_PROJ/llvm/CMakeLists.txt
[[ -f $LLVM_PROJ/cmake/Modules/LLVMVersion.cmake ]] && version_file=$LLVM_PROJ/cmake/Modules/LLVMVersion.cmake

# Extract LLVM version
llvm_version=$(grep -E 'set\(LLVM_VERSION_MAJOR' "$version_file" | \
               sed -E 's/.*LLVM_VERSION_MAJOR[[:space:]]*([0-9]+).*/\1/')

if $PYTHON --version &>/dev/null; then
    pyver=`$PYTHON --version | awk '{print $2;}'`
    # Only enforce Python 3.8+ for LLVM 20+
    if [[ -n "$llvm_version" && $llvm_version -ge 20 ]]; then
        # Check Python version >= 3.8
        printf "3.8.0\n$pyver" | sort -C -V
        if [ $? -ne 0 ]; then
            echo "error: Python version $pyver is too old. Need at least 3.8.0 for LLVM $llvm_version"
            exit 1
        fi
    fi
 else
    echo "Python binary cannot run on this system: $PYTHON"
    exit 1
fi

get_newlib_src() {
    if [ ! -d "$NEWLIB_SRC" ]; then
        echo "### Cloning newlib repository $NEWLIB_REPOSITORY into $NEWLIB_SRC"
        git clone --branch "$NEWLIB_BRANCH" "$NEWLIB_REPOSITORY" \
            "$NEWLIB_SRC" || exit
    fi
    NEWLIB_SRC=$( cd "$NEWLIB_SRC"; pwd )
}

get_newlib_src
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOST_GCC/lib64
export LD_LIBRARY_PATH
PATH=$HOST_GCC/bin:$PATH
$BUILD_MINGW && PATH=$MINGW/bin:$PATH
$BUILD_DARWIN_X86 && PATH=$DARWIN_TOOLS/bin:$DARWIN_BASE/bin:$PATH
export PATH

TARBALL="${VENDOR}.LLVM.Tools_exe_$VERSION.nanomips-elf_x86_64-pc-linux-gnu.tgz"
TARBALL_MINGW="${VENDOR}.LLVM.Tools_exe_$VERSION.nanomips-elf_x86_64-w64-mingw32.tgz"
TARBALL_DARWIN="${VENDOR}.LLVM.Tools_exe_$VERSION.nanomips-elf_$DARWIN_ARCH-apple-darwin21.tgz"
INSTALL="$PWD/llvm-toolchain/$VERSION"
INSTALL_MINGW="$PWD/mingw/llvm-toolchain/$VERSION"

echo "Host GCC is $HOST_GCC"

#cd $(dirname "$0")

clone() {
    echo "### Cloning"
    git clone  --branch="$BRANCH" "$REPOSITORY" $LLVM_PROJ || exit
}


configure() {
    echo "### Configuring with cmake"

    for x in echo ""; do $x                                     \
    $CMAKE                                                      \
        -DLLVM_CCACHE_BUILD=$CCACHE_BUILD                       \
        -G Ninja                                                \
        -S $LLVM_PROJ/llvm                                      \
        -B $BUILD_DIR                                           \
        -DCMAKE_C_COMPILER=$(which gcc)                         \
        -DCMAKE_CXX_COMPILER=$( which g++ )                     \
        -DPython3_EXECUTABLE="$PYTHON"                          \
        -DLLVM_TARGETS_TO_BUILD="$LLVM_TARGETS"                 \
        -DLLVM_ENABLE_PROJECTS="clang;lld;clang-tools-extra"    \
        -DCLANG_DEFAULT_LINKER=lld                              \
        -DLLVM_TARGET_ARCH=nanomips                             \
        -DCMAKE_BUILD_TYPE=Release                              \
        -DLLVM_DEFAULT_TARGET_TRIPLE=$TRIPLE                    \
        -DLLVM_ENABLE_ASSERTIONS=$ENABLE_ASSERTIONS             \
        -DLLVM_ENABLE_TERMINFO=OFF                              \
        -DCMAKE_INSTALL_PREFIX="$INSTALL"                       \
        -DPACKAGE_VENDOR="${VENDOR} (r${VERSION})"              \
        -DBUG_REPORT_URL="${VENDOR} Compiler Support"           \
        -DCMAKE_C_FLAGS="-Wl,-rpath=${ORIGIN}/../${LIB}"        \
        -DCMAKE_CXX_FLAGS="-Wl,-rpath=${ORIGIN}/../${LIB}"      \
        -DLLVM_LINK_LLVM_DYLIB=ON                               \
        -DCLANG_DEFAULT_RTLIB="compiler-rt"                     \
        -DCLANG_DEFAULT_CXX_STDLIB="libc++"                     \
        -DCLANG_DEFAULT_UNWINDLIB="libunwind"                   \
        -DCMAKE_MAKE_PROGRAM="$NINJA"                           \
        || exit
    done
}

configure_mingw() {
    echo "### Configuring Windows build with MINGW ###"
    dir=$(cd $(dirname "$0") ; pwd)

    for x in echo ""; do
        $x                                                                      \
            $CMAKE -S $LLVM_PROJ/llvm                                           \
            -G Ninja                                                            \
            -S $LLVM_PROJ/llvm                                                  \
            -B ${BUILD_DIR}-mingw                                               \
            -DMINGW=$MINGW                                                      \
            -DCMAKE_TOOLCHAIN_FILE=$dir/Toolchain-x86_64-w64-mingw32.cmake      \
            -DPython3_EXECUTABLE="$PYTHON"                                      \
            -DLLVM_TARGETS_TO_BUILD="$LLVM_TARGETS"                             \
            -DLLVM_ENABLE_PROJECTS="clang;lld;clang-tools-extra"                \
            -DCLANG_DEFAULT_LINKER=lld                                          \
            -DLLVM_TARGET_ARCH=nanomips                                         \
            -DCMAKE_BUILD_TYPE=Release                                          \
            -DLLVM_DEFAULT_TARGET_TRIPLE=nanomips                               \
            -DLLVM_ENABLE_ASSERTIONS=$ENABLE_ASSERTIONS                         \
            -DLLVM_ENABLE_TERMINFO=OFF                                          \
            -DCMAKE_INSTALL_PREFIX="$INSTALL_MINGW"                             \
            -DLLVM_HOST_TRIPLE=x86_64-w64-windows-gnu                           \
            -DHAVE_STEADY_CLOCK=0                                               \
            -DLLVM_NATIVE_TOOL_DIR=$BUILD_DIR/bin                               \
            -DCMAKE_C_FLAGS=-static                                             \
            -DCMAKE_CXX_FLAGS=-static                                           \
            -DPACKAGE_VENDOR_="${VENDOR} (r${VERSION})"                         \
            -DCLANG_DEFAULT_RTLIB="compiler-rt"                                 \
            -DCLANG_DEFAULT_CXX_STDLIB="libc++"                                 \
            -DCLANG_DEFAULT_UNWINDLIB="libunwind"                               \
            -DCMAKE_MAKE_PROGRAM="$NINJA"                                       \
            || exit
    done
}

configure_darwin() {
    DARWIN_ARCH=$1
    echo "### Configuring MacOS/Darwin $DARWIN_ARCH build ###"
    dir=$(cd $(dirname "$0") ; pwd)

    export PATH=$HOME/build/llvm-toolchain/13.0/bin:$PATH

    INSTALL_DARWIN="$PWD/darwin-$DARWIN_ARCH/llvm-toolchain/$VERSION"

    for x in echo ""; do
        $x                                                                      \
            $CMAKE -S $LLVM_PROJ/llvm                                           \
            -G Ninja                                                            \
            -S $LLVM_PROJ/llvm                                                  \
            -DDARWIN_TOOLS=$DARWIN_TOOLS                                        \
            -B ${BUILD_DIR}-darwin-${DARWIN_ARCH}                               \
            -DCMAKE_TOOLCHAIN_FILE=$dir/Toolchain-${DARWIN_ARCH}-darwin.cmake   \
            -DPython3_EXECUTABLE="$PYTHON"                                      \
            -DLLVM_TARGETS_TO_BUILD="$LLVM_TARGETS"                             \
            -DLLVM_ENABLE_PROJECTS="clang;lld;clang-tools-extra"                \
            -DCLANG_DEFAULT_LINKER=lld                                          \
            -DLLVM_TARGET_ARCH=nanomips                                         \
            -DCMAKE_BUILD_TYPE=Release                                          \
            -DLLVM_DEFAULT_TARGET_TRIPLE=nanomips                               \
            -DLLVM_ENABLE_ASSERTIONS=$ENABLE_ASSERTIONS                         \
            -DLLVM_ENABLE_TERMINFO=OFF                                          \
            -DCMAKE_INSTALL_PREFIX="$INSTALL_DARWIN"                            \
            -DHAVE_STEADY_CLOCK=0                                               \
            -DLLVM_NATIVE_TOOL_DIR=$BUILD_DIR/bin                               \
            -DPACKAGE_VENDOR_="${VENDOR} (r${VERSION})"                         \
            -DCLANG_DEFAULT_RTLIB="compiler-rt"                                 \
            -DCLANG_DEFAULT_CXX_STDLIB="libc++"                                 \
            -DCLANG_DEFAULT_UNWINDLIB="libunwind"                               \
            -DCMAKE_MAKE_PROGRAM="$NINJA"                                       \
            || exit
    done
}

configure_runtimes() {
    MBUILD="$1"
    MFLAGS="$2"
    MPATH=$3
    EHRTTIMODE=$4
    TEST_EXECUTOR="$PYTHON ${LLVM_PROJ}/libcxx/test/../utils/run_qemu.py --path_to_qemu ${TEST_SIM}"
    echo "### Configuring runtimes in $MBUILD with flags '$MFLAGS'"
    mkdir -p $BUILD_DIR/$MBUILD/lib

    THREADS=OFF
    if [ $ENABLE_THREADS_LIBCXX == "true" ]; then
        THREADS=ON
    fi

    if [ $EHRTTIMODE == "OFF" ]; then
        # Re-build just libc++/libc++abi, install in /noehrtti subdirectory
        CXXMPATH=$MPATH/noehrtti
        RUNTIMES="compiler-rt;libcxx;libcxxabi"
        CRT_EH_FRAME_REG="-DCOMPILER_RT_CRT_USE_EH_FRAME_REGISTRY=OFF"
        LIBUNWIND_OPTIONS="-DLIBCXXABI_USE_LLVM_UNWINDER=OFF"
    else
        # Full multi-lib build of all supported runtimes
        CXXMPATH=$MPATH
        RUNTIMES="compiler-rt;libcxx;libcxxabi;libunwind"
        LIBUNWIND_OPTIONS="                                             \
-DLIBUNWIND_TEST_CONFIG=nanomips-libunwind-static.cfg.in                \
-DLIBCXXABI_NON_DEMANGLING_TERMINATE=ON                                 \
-DLIBCXXABI_USE_LLVM_UNWINDER=ON                                        \
-DCOMPILER_RT_USE_LLVM_UNWINDER=ON                                      \
-DLIBUNWIND_INCLUDE_TESTS=ON                                            \
-DLIBUNWIND_INSTALL_INCLUDE_DIR=${INSTALL}/${TRIPLE}/include/c++/v1     \
-DLIBUNWIND_INSTALL_LIBRARY_DIR=${INSTALL}/${TRIPLE}/lib/$CXXMPATH      \
-DLIBUNWIND_IS_BAREMETAL=ON                                             \
-DLIBUNWIND_ENABLE_SHARED=OFF                                           \
-DLIBCXXABI_USE_COMPILER_RT=ON                                          \
-DLIBUNWIND_ENABLE_THREADS=OFF                                          \
-DLIBUNWIND_ENABLE_ASSERTIONS=${ENABLE_ASSERTIONS}                      \
-DLIBUNWIND_NO_DWARF_FDE_CACHE=${THREADS}"
        CRT_EH_FRAME_REG="-DCOMPILER_RT_CRT_USE_EH_FRAME_REGISTRY=ON"
    fi

    for x in echo ""; do $x                                                     \
        $CMAKE                                                                  \
        -G Ninja                                                                \
        -S $LLVM_PROJ/runtimes                                                  \
        -B $BUILD_DIR/$MBUILD                                                   \
        -DCMAKE_C_COMPILER=$INSTALL/bin/nanomips-elf-clang                      \
        -DCMAKE_CXX_COMPILER=$INSTALL/bin/nanomips-elf-clang++                  \
        -DCMAKE_TRY_COMPILE_TARGET_TYPE=STATIC_LIBRARY                          \
        -DLIBCXX_ENABLE_SHARED=OFF                                              \
        -DLIBCXXABI_ENABLE_SHARED=OFF                                           \
        -DLIBCXX_ENABLE_THREADS=$THREADS                                        \
        -DLIBCXXABI_ENABLE_THREADS=$THREADS                                     \
        -DLIBCXX_HAS_EXTERNAL_THREAD_API=$THREADS                               \
        -DLIBCXXABI_HAS_EXTERNAL_THREAD_API=$THREADS                            \
        -DLIBCXXABI_HAS_CXA_THREAD_ATEXIT_IMPL=$THREADS                         \
        -DLIBCXXABI_USE_PLATFORM_LOCK=$THREADS                                  \
        -DLIBCXXABI_HAS_NO_FALLBACK_MALLOC=$THREADS                             \
        -DLIBCXXABI_EXTERNAL_CXA_GET_GLOBALS=$THREADS                           \
        -DLIBCXX_DISABLE_DYNAMIC_THREADING=$THREADS                             \
        -DLIBCXX_ENABLE_FILESYSTEM=OFF                                          \
        -DLIBCXX_ENABLE_EXCEPTIONS=$EHRTTIMODE                                  \
        -DLIBCXXABI_ENABLE_EXCEPTIONS=$EHRTTIMODE                               \
        -DLIBCXX_ENABLE_RTTI=$EHRTTIMODE                                        \
        -DLIBCXXABI_ENABLE_ASSERTIONS=$ENABLE_ASSERTIONS                        \
        -DLIBCXX_ENABLE_MONOTONIC_CLOCK=ON                                      \
        -DLIBCXXABI_INCLUDE_TESTS=ON                                            \
        -DLIBCXX_INCLUDE_TESTS=ON                                               \
        -DLIBCXX_ENABLE_FSTREAM=ON                                              \
        -DLLVM_ENABLE_RUNTIMES=$RUNTIMES                                        \
        ${LIBUNWIND_OPTIONS}                                                    \
        -DLIBCXX_ENABLE_EXPERIMENTAL_LIBRARY=ON                                 \
        -DCMAKE_C_FLAGS_MINSIZEWITHDEB="-Os -DNDEBUG -g"                        \
        -DCMAKE_CXX_FLAGS_MINSIZEWITHDEB="-Os -DNDEBUG -g"                      \
        -DCMAKE_BUILD_TYPE=MinSizeWithDeb                                       \
        -DCMAKE_POSITION_INDEPENDENT_CODE=OFF                                   \
        -DCMAKE_C_FLAGS="                                                       \
${TARGET_C_FLAGS} -ffile-prefix-map=${LLVM_PROJ}=./llvm-project                 \
-fdebug-prefix-map=${PWD}=. $MFLAGS"                                            \
        -DCMAKE_CXX_FLAGS="                                                     \
${TARGET_C_FLAGS} -ffile-prefix-map=${LLVM_PROJ}=./llvm-project                 \
-fdebug-prefix-map=${PWD}=. -fno-use-cxa-atexit $MFLAGS"                        \
        -DCOMPILER_RT_INSTALL_INCLUDE_DIR=$INSTALL/lib/clang/20/$MPATH/../include \
        -DCOMPILER_RT_INSTALL_LIBRARY_DIR=$INSTALL/lib/clang/20/$CXXMPATH       \
        -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON                                    \
        -DCOMPILER_RT_BAREMETAL_BUILD=ON                                        \
        -DCOMPILER_RT_EMULATOR="${TEST_EXECUTOR} --execdir $(realpath $BUILD_DIR)/$MBUILD" \
        -DCOMPILER_RT_BUILD_CRT=ON                                              \
        -DCOMPILER_RT_OS_DIR=""                                                 \
        -DCOMPILER_RT_INCLUDE_TESTS=ON                                          \
        -DCOMPILER_RT_64_BIT_DIV_BY_NORMALIZING_32_BIT_STEPS=ON                 \
        -DCOMPILER_RT_BUILTINS_ENABLE_PIC=OFF                                   \
        ${CRT_EH_FRAME_REG}                                                     \
        -DBUILTINS_TEST_TARGET_CFLAGS="-Tuhi32.ld"                              \
        -DCMAKE_C_COMPILER_TARGET=nanomips-elf                                  \
        -DCMAKE_CXX_COMPILER_TARGET=nanomips-elf                                \
        -DLIBCXX_INSTALL_INCLUDE_DIR=${INSTALL}/${TRIPLE}/include/c++/v1        \
        -DLIBCXXABI_INSTALL_INCLUDE_DIR=${INSTALL}/${TRIPLE}/include/c++/v1     \
        -DLIBCXX_INSTALL_MODULES_DIR=${INSTALL}/share/libc++/v1                 \
        -DLIBCXX_INSTALL_INCLUDE_TARGET_DIR=${INSTALL}/${TRIPLE}/include/c++/v1 \
        -DLIBCXX_INSTALL_LIBRARY_DIR=${INSTALL}/${TRIPLE}/lib/$CXXMPATH         \
        -DLIBCXXABI_INSTALL_LIBRARY_DIR=${INSTALL}/${TRIPLE}/lib/$CXXMPATH      \
        -DLIBCXX_TEST_CONFIG=nanomips-libc++-static.cfg.in                      \
        -DLIBCXX_TESTING_INSTALL_PREFIX=""                                      \
        -DCRT_TEST_TARGET_CFLAGS="                                              \
--target=nanomips-elf -Wno-error=unused-command-line-argument"                  \
        -DCMAKE_PREFIX_PATH=${LLVM_PROJ}/cmake                                  \
        -DLIBUNWIND_HAS_PTHREAD_LIB=OFF                                         \
        -DLIBCXXABI_HAS_PTHREAD_LIB=OFF                                         \
        -DLIBCXX_HAS_PTHREAD_LIB=OFF                                            \
        -DLIBCXX_HAS_RT_LIB=OFF                                                 \
        -DCOMPILER_RT_TARGET_HAS_MKDIR=OFF                                      \
        -DCOMPILER_RT_TARGET_HAS_FTRUNCATE=OFF                                  \
        -DCOMPILER_RT_TARGET_HAS_FLOCK=OFF                                      \
        -DCOMPILER_RT_TARGET_HAS_FCNTL_LCK=OFF                                  \
        -DLIBUNWIND_TEST_PARAMS="executor=${TEST_EXECUTOR}"                     \
        -DLIBCXX_TEST_PARAMS="executor=${TEST_EXECUTOR}"                        \
        -DCMAKE_MAKE_PROGRAM="$NINJA"                                           \
        -DPython3_EXECUTABLE="$PYTHON"                                          \
        || exit
    done
}

build_newlib() {
    echo "### Re-build standard C library with LLVM toolchain"
    mkdir $BUILD_DIR/newlib
    pushd $BUILD_DIR/newlib

    seen_multi_dirs=""
    echo "" > ml-nano-elf
    for opt in "${MULTI_OPTS[@]}"; do
        multidir=`$INSTALL/bin/$TRIPLE-clang -print-multi-directory $opt`
        if ! [[ $seen_multi_dirs =~ $multidir ]]; then
            echo $multidir >> ml-nano-elf
            seen_multi_dirs="$seen_multi_dirs $multidir"
        fi
    done

    PATH=$INSTALL/bin:$PWD/../bin:$PATH                 \
    CC_FOR_TARGET=nanomips-elf-clang                    \
    CFLAGS_FOR_TARGET="                                 \
-target nanomips-elf -Os                                \
-DMTK_OPT -U__mips__ ${TARGET_C_FLAGS}                  \
-gdwarf-4 -fdebug-prefix-map=$PWD=.                     \
-ffile-prefix-map=${NEWLIB_SRC}=./newlib"               \
    AR_FOR_TARGET=nanomips-elf-llvm-ar                  \
    RANLIB_FOR_TARGET=nanomips-elf-llvm-ranlib          \
    READELF_FOR_TARGET=nanomips-elf-llvm-readelf        \
    $NEWLIB_SRC/configure --srcdir="$NEWLIB_SRC"        \
    --with-newlib --prefix=$INSTALL                     \
    --with-cross-host=x86_64-pc-linux-gnu               \
    --with-sysroot=$INSTALL/nanomips-elf                \
    --with-build-sysroot=$INSTALL/nanomips-elf          \
    --enable-newlib-io-c99-formats                      \
    --enable-newlib-long-time_t                         \
    --with-pkgversion="$VERSION"                        \
    --build=x86_64-pc-linux-gnu                         \
    --host=x86_64-pc-linux-gnu                          \
    --with-headers=yes                                  \
    --target=nanomips-elf                               \
    --with-multi-buildlist=$PWD/ml-nano-elf             \
    || exit
    PATH=$INSTALL/bin:$PWD/../bin:$PATH make -j $JOBS  || exit
    popd
}

build() {
    echo "### Building LLVM toolchain"
    # Copy compatible C++ library from host toolchain
    cp $HOST_GCC/lib64/libstdc++.so.6 $BUILD_DIR/lib

    $CMAKE --build $BUILD_DIR -j $JOBS || exit
}

build_mingw() {
    echo "### Building Windows toolchain with MINGW ###"
    $CMAKE --build ${BUILD_DIR}-mingw -j $JOBS || exit
}

build_darwin() {
    DARWIN_ARCH=$1
    echo "### Building MacOS/Darwin $DARWIN_ARCH toolchain with cross LLVM ###"
    $CMAKE --build ${BUILD_DIR}-darwin-${DARWIN_ARCH} -j $JOBS || exit
}

build_runtimes() {
    $NINJA -C $BUILD_DIR/$1 -v -v -v
}

prefix_executables() {
    install_dir="$1"
    # Prefix executables in the install
    for binary in "$install_dir/bin"/*; do
        dir=$(dirname "$binary")
        leaf=$(basename "$binary")
        if [ -h "$binary" ]; then
            # Symlinks
            case "$leaf" in
                $PREFIX*)  ;;
                *) echo "must prefix $binary"
                   target=$(readlink "$binary")
                   new_target="$PREFIX$target"
                   name="$dir/$PREFIX$leaf"
                   ls -alrt "$name"
                   if [ -h "$name" ]; then
                       echo "Removing $name..."
                       rm -f "$name"
                   else
                       echo "Removing $binary..."
                       rm -f "$binary"
                   fi
                   echo ln -s "$new_target" "$name"
                   ln -s "$new_target" "$name"
                   ;;
            esac

        else
            case "$leaf" in
                $PREFIX*)  ;;
                qemu-system-nanomips) ;;
                *) echo "must prefix $binary"
                   name="$dir/$PREFIX$leaf"
                   if [ -f "$name" ]; then
                       rm -f "$name"
                   fi
                   echo "mv $binary $name"
                   mv "$binary" "$name"
                   ;;
            esac
        fi
    done
}

install_newlib() {
    echo "### Re-install standard C library built with LLVM toolchain"
    pushd $BUILD_DIR/newlib
    PATH=$INSTALL/bin:$PWD/../bin:$PATH make VERBOSE=3 V=1 install || exit
    popd
}

install_runtimes() {
    $NINJA -C $BUILD_DIR/$1 install
}

show_sha() {
  sha=$( git rev-parse HEAD )
  diffs=$( git diff | wc -l)
  if [ "$diffs" == "0" ]; then
    echo "$sha"
  else
    echo "$sha ++ CHANGES ($diffs lines)"
  fi
}

install() {
    echo "### Building installation"
    mkdir -p $INSTALL/lib

    # Copy compatible C++ library from host toolchain
    cp $HOST_GCC/lib64/libstdc++.so.6 $INSTALL/lib
    cp $HOST_GCC/lib64/libstdc++.so.6 $BUILD_DIR/lib

    (
       echo "Build information"
       echo "-----------------"
       echo -n "llvm-project SHA: "
       ( cd $LLVM_PROJ; show_sha )
       echo -n "llvm-test-suite SHA: "
       ( cd llvm-test-suite; show_sha )
       echo -n "mips_tool_chain SHA: "
       ( cd $SCRIPT_DIR; show_sha )
       echo -n "newlib SHA: "
       ( cd "$NEWLIB_SRC"; show_sha )
       echo "Build command line:"
       echo "$BUILD_RELEASE_COMMAND"
    ) | tee $INSTALL/BUILD_INFO.txt

    # Copy compatible C++ library from host toolchain
    cp $HOST_GCC/lib64/libstdc++.so.6 $INSTALL/lib

    $CMAKE --build $BUILD_DIR --target install -j $JOBS

    ln -s llvm-lto-predict-sections $INSTALL/bin/llvm-lto-sections

    # Prefix executables in the install
    prefix_executables "$INSTALL"

    # Fix up 'linux' symlink
    ln -s . $INSTALL/linux

    # Symlink for renamed tool
    ln -s $PREFIX"llvm-lto-predict-sections" $INSTALL/bin/$PREFIX"llvm-lto-sections"

    # Symlink for default linker
    ln -s $PREFIX"lld" $INSTALL/bin/$PREFIX"ld"

    touch llvm-toolchain/$VERSION/$VERSION

    for (( i=0; i < ${#INSTALL_ADDONS[@]}; i=i+2 )); do
        src=`eval echo ${INSTALL_ADDONS[$i]}`
        dst=`eval echo ${INSTALL_ADDONS[$((i+1))]}`
        if [ ! -f $src -o ! -d `dirname $dst` ]; then
            echo "Can't install $dest <- $dst, path not found"
        else
            cp $src $dst
        fi
    done

    build_newlib
    install_newlib
    # Remove libgcc from default linker scripts
    find ${INSTALL} -name uhi32.ld -exec sed 's/-lc -luhi -lgcc -lhal/-lc -luhi -lhal/g' -i \{} \;
    find ${INSTALL} -name mti32.ld -exec sed 's/-lc -lidt -lgcc/-lc -lidt/g' -i \{} \;
}

copy_cross_toolchain() {
    SRC=$1
    DEST=$2
    mkdir -p $DEST/$TRIPLE
    cp -vr $SRC/$TRIPLE/lib $DEST/$TRIPLE/
    cp -vr $SRC/$TRIPLE/include $DEST/$TRIPLE/
    mkdir -p $DEST/lib/gcc/$TRIPLE
    cp -vr $SRC/lib/gcc/$TRIPLE/* $DEST/lib/gcc/$TRIPLE/
    mkdir -p $DEST/share
    cp -vr $SRC/share/info $DEST/share/
    cp -vr $SRC/share/locale $DEST/share/
    cp -vr $SRC/share/gcc-* $DEST/share/
    cp -vr $SRC/share/doc $DEST/share/
    cp -vr $SRC/

    mkdir -p $DEST/include $DEST/lib
    cp -vr $SRC/include/c++  $DEST/include/
    cp -vr $SRC/lib/clang $DEST/lib/
}

install_mingw() {
    echo "### Building MINGW installation"

    mkdir -p "$INSTALL_MINGW"
    $CMAKE --build ${BUILD_DIR}-mingw --target install -j $JOBS

    prefix_executables "$INSTALL_MINGW"

    # Symlink for renamed tool
    ln -s $PREFIX"llvm-lto-predict-sections" $INSTALL/bin/$PREFIX"llvm-lto-sections"
    cp $SCRIPT_DIR/COPYRIGHT $INSTALL/COPYRIGHT
    cp $SCRIPT_DIR/NOTICE $INSTALL/NOTICE

    touch mingw/llvm-toolchain/$VERSION/$VERSION
    copy_cross_toolchain llvm-toolchain/$VERSION mingw/llvm-toolchain/$VERSION
    $DEV_BUILD || tar -C mingw --owner=0 --group=0 -hpczf $TARBALL_MINGW $SKIP_CLANG_PATTERN llvm-toolchain/$VERSION
}

install_darwin() {
    DARWIN_ARCH=$1
    INSTALL_DARWIN="$PWD/darwin-$DARWIN_ARCH/llvm-toolchain/$VERSION"
    echo "### Building MacOS/Darwin $DARWIN_ARCH installation"

    mkdir -p "$INSTALL_DARWIN"
    $CMAKE --build ${BUILD_DIR}-darwin-${DARWIN_ARCH} --target install -j $JOBS

    prefix_executables "$INSTALL_DARWIN"

    # Symlink for renamed tool
    ln -s $PREFIX"llvm-lto-predict-sections" $INSTALL/bin/$PREFIX"llvm-lto-sections"
    cp $SCRIPT_DIR/COPYRIGHT $INSTALL/COPYRIGHT
    cp $SCRIPT_DIR/NOTICE $INSTALL/NOTICE

    touch darwin-${DARWIN_ARCH}/llvm-toolchain/$VERSION/$VERSION
    copy_cross_toolchain llvm-toolchain/$VERSION darwin-${DARWIN_ARCH}/llvm-toolchain/$VERSION
    $DEV_BUILD || tar -C darwin-${DARWIN_ARCH} --owner=0 --group=0 -hpczf $TARBALL_DARWIN $SKIP_CLANG_PATTERN llvm-toolchain/$VERSION
}

check() {
    echo "### Checking build"

    # Currently-failing tests which are documented in bugz 125
    LIT_XFAIL="\
CodeGen/c-strings.c;\
CodeGen/no-skipped-passes-O0-opt-bisect.c;\
CodeGenCXX/auto-var-init.cpp;\
Sema/strict-aliasing-warn.c;\
CodeGen/Generic/llc-start-stop.ll;\
CodeGen/Mips/nanomips/outliner_test.ll;\
CodeGen/Mips/nanomips/outliner_test_regsave.mir;\
CodeGen/Mips/nanomips/outliner_test_tailcall_and_default.ll;\
CodeGen/Mips/nanomips/outliner_test_thunk.ll;\
DebugInfo/Generic/array.ll;\
Transforms/JumpThreading/codesize-loop.ll;\
Transforms/MemCpyOpt/profitable-memset.ll"
    export LIT_XFAIL

    ( PATH=$PATH:$INSTALL/bin
      $CMAKE --build $BUILD_DIR --target check-all --verbose | tee $BUILD_DIR/check.log )

}

check_libcxx() {
    MBUILD="$1"
    cp $BUILD_DIR/$MBUILD/lib/libstubs.a $INSTALL/nanomips-elf/lib/nanomips-r6-soft-newlib/lib
    $PYTHON $LLVM_PROJ/llvm/utils/lit/lit.py -v -v -v $BUILD_DIR/$MBUILD/libcxx/test --param=target_triple=$TRIPLE  \
        | tee $BUILD_DIR/$MBUILD/check_libcxx.log || true
}

check_compiler_rt() {
    # Currently failing comp-rt tests
    LIT_XFAIL="Builtins-nanomips-linux :: compiler_rt_scalbnf_test.c"
    export LIT_XFAIL

    MBUILD="$1"
    ln -s ../../bin $BUILD_DIR/$MBUILD/compiler-rt
    ln -s ../../bin/llvm-config $BUILD_DIR/$MBUILD/bin
    PATH=$(realpath $BUILD_DIR)/bin:$PATH \
        $NINJA -C $BUILD_DIR/$MBUILD check-all | tee $BUILD_DIR/$MBUILD/check_comprt.log
}

if [ ! -d $LLVM_PROJ ]; then
    clone
fi
if [ ! -d "$NEWLIB_SRC" ]; then
    echo missing newlib
fi
if [ ! -d $BUILD_DIR ] || [ ! -f $BUILD_DIR/build.ninja ]; then
    configure
fi

build || exit 1

if $CHECK; then
    # clangd tests look for compile_commands.json somewhere in the
    # source heirarchy. Since we're using GCC-10.2 to build LLVM,
    # compiler commands contain an option which is not supported by
    # clang. Create a shadow file without the problematic option so
    # that tests can pass with minimal changes,
    sed 's/-fno-shrink-wrap//g' $BUILD_DIR/compile_commands.json > \
        $BUILD_DIR/tools/clang/tools/extra/compile_commands.json
    check || exit 1
fi

install || exit 1

index=0
seen_multi_dirs=""
for opt in "${MULTI_OPTS[@]}"; do
    multidir=`$INSTALL/bin/$TRIPLE-clang -print-multi-directory $opt`
    if ! [[ $seen_multi_dirs =~ $multidir ]]; then
        for ehrttimode in "ON" "OFF"; do
            configure_runtimes runtimes-multi$index " $opt" $multidir $ehrttimode || exit 1
            build_runtimes runtimes-multi$index || exit 1
            index=$((index+1))
        done
        seen_multi_dirs="$seen_multi_dirs $multidir"
    fi
done
for i in $( seq 0 $((index - 1)) ); do
    for ehrttimode in "ON" "OFF"; do
        install_runtimes runtimes-multi$i $ehrttimode || exit 1
    done
done

# Post-installation verification step
check_install() {
    # Optional post-install verification script used to verify installed archives
    CHECKER=`eval echo $POST_INSTALL_CHECKER`
    if [[ -z "$CHECKER" || ! -f $CHECKER ]]; then
        return 0
    fi
    for f in  $( find $INSTALL/$TRIPLE $INSTALL/lib/clang/20 -type f -name "*.[oa]" \
                 | grep -v "r6-soft-\(small\|tiny\)"  | grep -v libstdc\+\+ ); do
        PATH=$INSTALL/bin:$PATH $CHECKER $f
        result=$?
        if [ $result -ne 0 ]; then
            echo "ERROR: Failed `basename ${POST_INSTALL_VERIFY}` check for $f";
            return $result;
        fi
    done
}

if $POSTINSTALL_CHECK; then
    check_install || exit
fi

check_libcxx_interface() {
    rm -Rf $BUILD_DIR/libcxx_interface/*
    mkdir $BUILD_DIR/libcxx_interface
    pushd $BUILD_DIR/libcxx_interface
    PATH=$INSTALL/bin:$PATH $LLVM_PROJ/cross-project-tests/libcxx-interface-tests/build_run_libcxx_tests.sh $INSTALL $TEST_SIM | tee check.log
    echo "TESTS: " `grep -c -e '>>>>.*:' check.log` >> check.log
    echo "FAIL: " `grep -c FAILED: check.log` >> check.log
    echo "PASS: " `grep -c PASSED: check.log` >> check.log
    popd
}

if $CHECK; then
    check_compiler_rt runtimes-multi0
    check_libcxx runtimes-multi0
    check_libcxx_interface
fi

# Final LLVM components archive
$DEV_BUILD || tar --owner=0 --group=0 -pczf ${TARBALL} llvm-toolchain/$VERSION

if $BUILD_MINGW; then
    if [ ! -d ${BUILD_DIR}-mingw ] || [ ! -f ${BUILD_DIR}-mingw/build.ninja ]; then
        configure_mingw || exit
    fi
    build_mingw || exit
    install_mingw || exit 1
fi

if $BUILD_DARWIN_X86; then
    if [ ! -d ${BUILD_DIR}-darwin-x86_64 ] || [ ! -f ${BUILD_DIR}-darwin-x86_64/build.ninja ]; then
        configure_darwin x86_64 || exit
    fi
    build_darwin x86_64 || exit
    install_darwin x86_64 || exit 1
fi

if $BUILD_DARWIN_AARCH64; then
    if [ ! -d ${BUILD_DIR}-darwin-aarch64 ] || [ ! -f ${BUILD_DIR}-darwin-aarch64/build.ninja ]; then
        configure_darwin aarch64 || exit
    fi
    build_darwin aarch64 || exit
    install_darwin aarch64 || exit 1
fi

print_test_summary() {
    echo "Compiler-RT Results:"
    grep -e "Testing Time:" -A 10 $BUILD_DIR/$1/check_comprt.log | grep -e ":[ ]\+[0-9]\+"
    echo "LibCXX Results:"
    grep -e "Testing Time:" -A 10 $BUILD_DIR/$1/check_libcxx.log  | grep -e ":[ ]\+[0-9]\+"
    echo "LibCXX Interface Results:"
    tail -n 3 $BUILD_DIR/libcxx_interface/check.log
    echo "LLVM Results:"
    grep -e "Testing Time:" -A 10 $BUILD_DIR/check.log | grep -e ":[ ]\+[0-9]\+"
}

$CHECK && print_test_summary runtimes-multi0
