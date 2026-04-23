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

VERSION=
TESTSUITE=llvm-test-suite
LLVM_LIT=
SCRIPT_DIR=$PWD/`dirname $0`
QEMU_RUNNER="$PWD/$TESTSUITE/run-under-qemu.sh"
USE_GOLD=0

help() {
    echo "Syntax: [$0 --repo repository] [--branch branch] [--cmake cmake_binary] [--ninja ninja-binary] [--use-gold] --version release_version --llvm-lit path_to_llvm_lit --test-sim path_to_test_qemu"
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
        --llvm-lit)
            LLVM_LIT="$2"; shift ;;
        --use-gold)
            USE_GOLD=1 ;;
        --test-sim)
            TEST_SIM="$2"; shift;;
        --ninja)
            NINJA="$2"; shift ;;
        *) help; exit 2 ;;
    esac
    shift;
done

if [ -z $VERSION ] || [ -z $LLVM_LIT ]; then
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
PATH=$PATH:$TCL_PATH

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
    FLAGS="-Wno-int-conversion -Wno-implicit-function-declaration -Wno-implicit-int -Tuhi32.ld -Wl,--defsym,__memory_size=256M $EXTRA_FLAGS"
    if [ "$USE_GOLD" -eq "1" ]; then
        FLAGS+=" -fuse-ld=gold"
    fi
    for cmd in "echo" ""; do
    $cmd $CMAKE                                                 \
        -G Ninja                                                \
        -DCMAKE_MAKE_PROGRAM="$NINJA"                           \
        -DCMAKE_C_COMPILER=$(which nanomips-elf-clang)          \
        -C$TESTSUITE/cmake/caches/"$OPT".cmake                  \
        -DTEST_SUITE_USER_MODE_EMULATION=ON                     \
        -DTEST_SUITE_RUN_UNDER="$QEMU_RUNNER $TEST_SIM I7200"   \
        -DCMAKE_C_FLAGS="$FLAGS"                                \
        -DCMAKE_CXX_COMPILER=$(which nanomips-elf-clang++)      \
        -DCMAKE_CXX_FLAGS="$FLAGS" \
        -DTEST_SUITE_USE_PERF=ON                              \
        -DTEST_SUITE_COLLECT_CODE_SIZE=OFF                      \
	-DCMAKE_VERBOSE_MAKEFILE=On				\
        -DTEST_SUITE_COLLECT_COMPILE_TIME=OFF                   \
        -B $BLDDIR$OPT                                          \
        $TESTSUITE
    done
}

if [ ! -d llvm-test-suite ]; then
    clone
fi


for Opt in Os O3; do
  if [ ! -d $BLDDIR$Opt ]; then
      configure "$Opt"
  fi
  cp .lit_test_times.txt $BLDDIR$Opt
  pushd $BLDDIR$Opt
  $NINJA -v -j 16 -d explain || exit
  $LLVM_LIT -v -v -v  -j 16 .
  popd
done
