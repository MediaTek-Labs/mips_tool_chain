#!/bin/sh

OUT=$PWD/out

mkdir -p $OUT

OLD_CLANG="/server_path/llvm-toolchain/2022.04-trial-5/bin/nanomips-elf-clang"
GCC_OPT="-O0 -DINT64_ALIGN=0"

driver.pl  -x 100 -B none -D none -o $OUT \
    -n 500000 $( echo -m lsf -t 12:8 -p 80801  -R U1404 -v4 -q mosesq ) \
    -f "\
{gcc|flag='$GCC_OPT'}\
{thor|flag='-mno-gpopt -Os'|reference='1'}\
{thorllvm|flag='-mno-gpopt -O0'}\
{thorllvm|flag='-mno-gpopt -Os'}\
{thorllvm|compiler='$OLD_CLANG'|flag='-mno-gpopt -Os'|reference='1'}\
\
"

