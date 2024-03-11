#!/bin/sh

VERSION=
REPOSITORY="https://repourl"
BRANCH=mtk/nanomips
CMAKE="/server-path/cmake/cmake-3.19.5-Linux-x86_64/bin/cmake"
TESTSUITE=llvm-test-suite

help() {
    echo "Syntax: [$0 --repo repository] [--branch branch] [--cmake cmake_binary] --version release_version"
}


while [ $# -gt 1 ]; do
    case "$1" in 
        --repo|-r|--repository)
            REPOSITORY="$2"; shift ;;
        --branch)
            BRANCH="$2"; shift ;;
        --cmake)
            CMAKE="$2"; shift ;;
        --version)
            VERSION="$2"; shift ;;
        *) help; exit 2 ;;
    esac
    shift;
done

if [ -z $VERSION ]; then
    help
    exit 2
fi


COMPILER_BIN=$PWD/llvm-toolchain/$VERSION/bin

PATH=$COMPILER_BIN:$PATH
# Also need tools without nanomips-elf- prefix
PATH=$PWD/build/bin:$PATH
# For nanomips-elf-qemu-runner and perf
PATH=$PWD:$PATH
LD_LIBRARY_PATH=$COMPILER_BIN/../lib:$LD_LIBRARY_PATH
BLDDIR=build-testsuite

echo "Compiler version: "
nanomips-elf-clang --version || {
  echo "Cannot find nanomips-elf-clang"
  exit 1
}

# Find TCL
PATH=$PATH:/server-path/tcl/8.5.6/x86_64/bin/

clone() {
    echo "### Cloning"
    git clone  --branch="$BRANCH" "$REPOSITORY" "$TESTSUITE"
}

single="SingleSource/Regression;SingleSource/UnitTests"
multi="MultiSource/Applications;MultiSource/UnitTests"

configure() {
    OPT=$1
    FL=$2
    EXTRA_FLAGS="-mno-gpopt $FL"
    FLAGS="-Tuhi32.ld -Wl,--defsym,__memory_size=256M $EXTRA_FLAGS"
    for cmd in "echo" ""; do
    $cmd $CMAKE                                                 \
        -G Ninja                                                \
        -DCMAKE_C_COMPILER=$(which nanomips-elf-clang)          \
        -C$TESTSUITE/cmake/caches/"$OPT".cmake                  \
        -DTEST_SUITE_USER_MODE_EMULATION=ON                     \
        -DTEST_SUITE_RUN_UNDER=nanomips-elf-qemu-runner         \
        -DCMAKE_C_FLAGS="$FLAGS"                                \
        -DCMAKE_CXX_COMPILER=$(which nanomips-elf-clang++)      \
        -DCMAKE_CXX_FLAGS="$FLAGS"                              \
        -DTEST_SUITE_USE_PERF=ON                              \
        -DTEST_SUITE_COLLECT_CODE_SIZE=OFF                      \
	-DCMAKE_VERBOSE_MAKEFILE=On				\
        -DTEST_SUITE_COLLECT_COMPILE_TIME=ON                   \
	--verbose 					\
        -B $BLDDIR$OPT$FL                                    \
        $TESTSUITE
    done
        # -DTEST_SUITE_SUBDIRS="$single;$multi"   \
}

if [ ! -d llvm-test-suite ]; then
    clone
fi


for Fl in -fintegrated-as -fno-integrated-as; do
  for Opt in O3 Os; do
    if [ ! -d $BLDDIR$Opt$Fl ]; then
	configure "$Opt" "$Fl"
    fi
    cp .lit_test_times.txt $BLDDIR$Opt$Fl/
    pushd $BLDDIR$Opt$Fl
    ninja -v -j 16 -d explain || exit
    llvm-lit -v -v -v  -j 16 .  
    popd
  done
done
