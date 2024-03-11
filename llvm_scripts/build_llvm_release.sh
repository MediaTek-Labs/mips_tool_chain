#!/bin/bash -x

# Release-specific info:
GCC_TOOLCHAIN=/server_path/gcc-elf/2024.01-01

ENABLE_ASSERTIONS=Off
PREFIX="nanomips-elf-"


REPOSITORY="https://gerrit.mediatek.inc/MD-SHAOLIN/llvm-project"
HOST_GCC="/server_path/gcc-host/x86_64-pc-linux-gnu/10.2.0-centos6"
MINGW="/server_path/gcc-host/x86_64-w64-mingw32/10.2.0_v6.0.0_posix"
BRANCH="mtk/nanomips"
CMAKE="/server_path/cmake/cmake-3.19.5-Linux-x86_64/bin/cmake"
JOBS=$(nproc || echo 8)
BUILD_MINGW=false
SCRIPT_DIR=`dirname $0`

help() {
    echo "Syntax: $0 --repo repository --hosttools gcc_dir --gcc-toolchain nanomips_gcc_toolchain_dir --branch branch --cmake cmake_binary --version release_version --jobs parallel_job_count --build-mingw --mingw path_to_mingw"
}

while [ $# -ge 1 ]; do
    case "$1" in 
        --repo|-r|--repository)
            REPOSITORY="$2"; shift ;;
        --hosttools)
            HOST_GCC="$2"; shift ;;
        --gcc-toolchain)
            GCC_TOOLCHAIN="$2"; shift ;;
        --branch)
            BRANCH="$2"; shift ;;
        --cmake)
            CMAKE="$2"; shift ;;
        --version)
            VERSION="$2"; shift ;;
        --jobs)
            JOBS="$2"; shift ;;
	--mingw)
	    MINGW="$2"; shift ;;
	--build-mingw)
	    BUILD_MINGW=true ;;
	*)
	    echo "Unknown option '$1'"
	    exit 2 ;;
    esac
    shift;
done

if [ -z $GCC_TOOLCHAIN ]; then
    echo "Must specify nanomips GCC toolchain with --gcc-toolchain"
    help
    exit
fi
if [ ! -d $GCC_TOOLCHAIN ]; then
    echo "Can't find nanomips gcc toolchain in $GCC_TOOLCHAIN"
    exit
fi

if [ ! -r $GCC_TOOLCHAIN/lib/gcc/nanomips-elf/*/plugin/include/plugin-api.h ]; then
    echo "Can't find plugin include plugin-api.h in $GCC_TOOLCHAIN"
    help
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

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOST_GCC/lib64
export LD_LIBRARY_PATH
PATH=$HOST_GCC/bin:$MINGW/bin:$PATH
export PATH

TARBALL="MediaTek.LLVM.Tools.$VERSION.nanomips-elf_x86_64-pc-linux-gnu.tgz"
TARBALL_MINGW="MediaTek.LLVM.Tools.$VERSION.nanomips-elf-x86_64-w64-mingw32.tgz"
GNU_TARBALL=`echo ${TARBALL} | sed s/LLVM/GNU/ -`
INSTALL="$PWD/llvm-toolchain/$VERSION"
INSTALL_MINGW="$PWD/mingw/llvm-toolchain/$VERSION"

echo "Host GCC is $HOST_GCC"

#cd $(dirname "$0")

clone() {
    echo "### Cloning"
    # git clone --single-branch --branch="$BRANCH" "$REPOSITORY"
    git clone  --branch="$BRANCH" "$REPOSITORY"
}


configure() {
    echo "### Configuring with cmake"

    for x in $GCC_TOOLCHAIN/lib/gcc/nanomips-elf/*/plugin/include; do
        plugin_include=$x
    done
    if [ ! -d $plugin_include ]; then
        echo "Couldn't find plugin includes $plugin_include"
        exit
    fi
    LTO=-DLLVM_BINUTILS_INCDIR="$plugin_include"

    for x in echo ""; do $x                             \
    $CMAKE                                              \
        -G Ninja                                        \
        -S llvm-project/llvm                            \
        -B build                                        \
        -DCMAKE_C_COMPILER=$(which gcc)                 \
        -DCMAKE_CXX_COMPILER=$( which g++ )             \
        -DLLVM_TARGETS_TO_BUILD="Mips"                  \
        -DLLVM_ENABLE_PROJECTS=clang                    \
        -DLLVM_TARGET_ARCH=nanomips                     \
        -DCMAKE_BUILD_TYPE=Release                      \
        -DLLVM_DEFAULT_TARGET_TRIPLE=nanomips-elf       \
        -DLLVM_ENABLE_ASSERTIONS=$ENABLE_ASSERTIONS     \
        -DLLVM_ENABLE_TERMINFO=OFF			\
        -DCMAKE_INSTALL_PREFIX="$INSTALL"               \
        -DPACKAGE_VENDOR="MediaTek"                     \
        -DLLVM_LINK_LLVM_DYLIB=ON $LTO || exit
    done
}

configure_mingw() {
    echo "### Configuring Windows build with MINGW ###"
    dir=$(cd $(dirname "$0") ; pwd)

    for x in $GCC_TOOLCHAIN/lib/gcc/nanomips-elf/*/plugin/include; do
        plugin_include=$x
    done
    if [ ! -d $plugin_include ]; then
        echo "Couldn't find plugin includes $plugin_include"
        exit
    fi
    LTO=-DLLVM_BINUTILS_INCDIR="$plugin_include"

    for x in echo ""; do
	$x                                                                      \
	    $CMAKE -S llvm-project/llvm                                         \
	    -G Ninja                                                            \
	    -S llvm-project/llvm                                                \
	    -B build-mingw                                                      \
	    -DCMAKE_TOOLCHAIN_FILE=$dir/Toolchain-x86_64-w64-mingw32.cmake      \
	    -DLLVM_TARGETS_TO_BUILD="Mips"                                      \
	    -DLLVM_ENABLE_PROJECTS=clang                                        \
	    -DLLVM_TARGET_ARCH=nanomips                                         \
	    -DCMAKE_BUILD_TYPE=Release                                          \
	    -DLLVM_DEFAULT_TARGET_TRIPLE=nanomips                               \
	    -DLLVM_ENABLE_ASSERTIONS=$ENABLE_ASSERTIONS                         \
	    -DLLVM_ENABLE_TERMINFO=OFF                                          \
	    -DCMAKE_INSTALL_PREFIX="$INSTALL_MINGW"                             \
	    -DLLVM_HOST_TRIPLE=x86_64-w64-windows-gnu                           \
	    -DHAVE_STEADY_CLOCK=0                                               \
	    -DCMAKE_SYSTEM_NAME=Windows                                         \
	    -DLLVM_NATIVE_TOOL_DIR=$PWD/build/bin                               \
	    -DCMAKE_C_FLAGS=-static                                             \
			     -DCMAKE_CXX_FLAGS=-static				\
	    $LTO || exit
    done
}

build() {
    echo "### Building LLVM toolchain"
    $CMAKE --build build -j $JOBS || exit
}

build_mingw() {
    echo "### Building Windows toolchain with MINGW ###"
    $CMAKE --build build-mingw -j $JOBS || exit
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


install() {
    echo "### Building installation"

    rsync -ravu                                                 \
        --exclude nanomips-elf-gcc --exclude nanomips-elf-g++   \
        --exclude libexec/gcc --exclude gcc.mo                  \
        --exclude nanomips-elf-c++                              \
        "$GCC_TOOLCHAIN"/ "$INSTALL"/

    # Remove linux symlink from GCC toolchain
    rm $INSTALL/linux

    # Copy compatible C++ library from host toolchain
    cp $HOST_GCC/lib64/libstdc++.so.6 $INSTALL/lib
    cp $HOST_GCC/lib64/libstdc++.so.6 build/lib

    # Copyright notices
    cp $SCRIPT_DIR/NOTICE.NEWLIB $INSTALL/NOTICE.NEWLIB

    # Remove modulefile from GCC toolchain
    for f in $INSTALL/*; do
      if [ -f $f ] && grep Module1.0 $f; then
        echo "Removing stale modulefile $f"
        rm $f
      fi
    done

    # Archive the GNU components on the same install path
    tar --owner=0 --group=0 -pczf $GNU_TARBALL llvm-toolchain/$VERSION
    rm -Rf $INSTALL

    mkdir -p $INSTALL
    $CMAKE --build build --target install -j $JOBS

    ln -s llvm-lto-predict-sections $INSTALL/bin/llvm-lto-sections

    # Prefix executables in the install
    prefix_executables "$INSTALL"

    # Fix up 'linux' symlink
    ln -s . $INSTALL/linux

    # Symlink for renamed tool
    ln -s $PREFIX"llvm-lto-predict-sections" $INSTALL/bin/$PREFIX"llvm-lto-sections"

    cp $SCRIPT_DIR/COPYRIGHT $INSTALL/COPYRIGHT
    cp $SCRIPT_DIR/NOTICE $INSTALL/NOTICE

    tar -C llvm-toolchain --owner=0 --group=0 -pczf $TARBALL $VERSION

    # Add modulefile (after creating tarball)
    cat > $INSTALL/$VERSION <<EOF
#%Module1.0

while { [file type \$ModulesCurrentModulefile] eq "link" } {
set ModulesCurrentModulefile [ file join [file dirname \$ModulesCurrentModulefile] [file readlink \$ModulesCurrentModulefile] ]
}
set toolsroot [file dirname [file normalize \$ModulesCurrentModulefile]]
#module load dep/1 otherdep/2 # load module dependencies
prepend-path PATH \$toolsroot/bin
# setenv FOO bar #???
EOF

    # Extract the gnu components on top of LLVM install
    tar zxf $GNU_TARBALL -C llvm-toolchain
}


install_mingw() {
    echo "### Building MINGW installation"

    mkdir -p "$INSTALL_MINGW"
    $CMAKE --build build-mingw --target install -j $JOBS

    prefix_executables "$INSTALL_MINGW"

    tar -C mingw --owner=0 --group=0 -pczf $TARBALL_MINGW llvm-toolchain/$VERSION
}

check() {
    echo "### Checking build"

    ( PATH=$PATH:$INSTALL/bin
      $CMAKE --build build --target check-all --verbose )

}




#cd $(dirname "$0")

if [ ! -d llvm-project ]; then
    clone
fi
if [ ! -d build ] || [ ! -f build/build.ninja ]; then
    configure
fi

build || exit 1
install || exit 1

if $BUILD_MINGW; then
    if [ ! -d build-cross ] || [ ! -f build-cross/build.ninja ]; then
	configure_mingw || exit
    fi
    build_mingw || exit
    install_mingw || exit 1
fi

check
