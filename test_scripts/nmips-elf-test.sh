#!/bin/bash -x

if [ -z $1 ]; then
    DO=gcc
else
    DO=$1
fi

if [ -z $2 ]; then
    TOOLCHAIN=/projects/mipssw/toolchains/nanomips-elf/2019.03-01
else
    TOOLCHAIN=$2
fi

if [ ! -d $TOOLCHAIN ]; then
    echo "ERROR: Toolchain directory not found $TOOLCHAIN"
    exit 1
fi

if [ -n $3 ]; then
    SRCDIR=$3
fi

if [ ! -d $SRCDIR ]; then
    echo "ERROR: Source directory not found $SRCDIR"
    exit 1
fi

if [ ! -d $SRCDIR/dejagnu ]; then
    echo "ERROR: DejaGNU source not found $SRCDIR/dejagnu"
    exit 1
fi

if [ ! -d $SRCDIR/gcc ]; then
    echo "ERROR: GCC source not found $SRCDIR/gcc"
    exit 1
fi

HOSTTOOLS=${HOSTTOOLSROOT:-/projects/mipssw/toolchains/}x86_64-pc-linux-gnu/4.9.4-centos6

declare -a configs
configs=(
    "mips-sim-mti32/-m32/-EL/-msoft-float" 
    "mips-sim-mti32/-m32/-EL/-msoft-float/-mcmodel=medium"
    "mips-sim-mti32/-m32/-EL/-msoft-float/-mcmodel=large"
    "mips-sim-mti32/-m32/-EL/-msoft-float/-mpid"
    "mips-sim-mti32/-m32/-EL/-msoft-float/-mcmodel=medium/-mpid"
    "mips-sim-mti32/-m32/-EL/-msoft-float/-mcmodel=large/-mpid"
    "mips-sim-mti32/-m32/-EL/-msoft-float/-mno-gpopt"
    "mips-sim-mti32/-m32/-EL/-msoft-float/-mcmodel=medium/-mno-gpopt"
    "mips-sim-mti32/-m32/-EL/-msoft-float/-mcmodel=large/-mno-gpopt"
    "mips-sim-mti32/-m32/-EL/-msoft-float/-mno-gpopt/-mno-pcrel"
    "mips-sim-mti32/-m32/-EL/-msoft-float/-mcmodel=medium/-mno-gpopt/-mno-pcrel"
    "mips-sim-mti32/-m32/-EL/-msoft-float/-mcmodel=large/-mno-gpopt/-mno-pcrel")
jobs=""

# manipulate the test_installed script to generate a modified site.exp
sed 's|^set CFLAGS.*$|set CFLAGS \"\"\nset HOSTCC \"gcc\"\nset HOSTCFLAGS \"\"|' $SRCDIR/gcc/contrib/test_installed > $SRCDIR/gcc/contrib/test_installed.gcc"$$"
chmod +x $SRCDIR/gcc/contrib/test_installed.gcc"$$"

if [ $DO = "gcc" -o $DO = "both" -o $DO = "all" ]; then
for cfg in "${configs[@]}"; do
    name="gcc_"`echo ${cfg#*/} | tr -d - | tr -d =  | tr / _`
    mkdir $name
    pushd $name
    rm -Rf *
    PATH=$TOOLCHAIN/bin:$HOSTTOOLS/bin:$SRCDIR/dejagnu:$PATH $SRCDIR/gcc/contrib/test_installed.gcc"$$" --without-gfortran --without-objc --without-g++ --with-gcc=$TOOLCHAIN/bin/nanomips-elf-gcc --prefix=$TOOLCHAIN --target=nanomips-elf --target_board=$cfg SIM=$TOOLCHAIN/bin/nanomips-elf-run  -v -v -v $4 &> test.log &
    popd
done
fi

configs+=(
    "mips-sim-mti32/-m32/-EL/-msoft-float/-mno-gpopt/-fno-rtti/-fno-exceptions"
    "mips-sim-mti32/-m32/-EL/-msoft-float/-mno-gpopt/-fno-rtti/-fno-exceptions/-nortti-libstdc++"
)

# manipulate the test_installed script to generate a modified site.exp
sed 's|^set GCC_UNDER_TEST.*$|set GCC_UNDER_TEST \"'${TOOLCHAIN}'/bin/${target+$target-}gcc\"\nset HOSTCC \"gcc\"\nset HOSTCFLAGS \"\"|' $SRCDIR/gcc/contrib/test_installed > $SRCDIR/gcc/contrib/test_installed.g++"$$"
chmod +x $SRCDIR/gcc/contrib/test_installed.g++"$$"
if [ $DO = "g++" -o $DO = "all" ]; then
for cfg in "${configs[@]}"; do
    name="gxx_"`echo ${cfg#*/} | tr -d - | tr -d =  | tr / _`
    
    mkdir $name
    pushd $name
    rm -Rf *

    PATH=$TOOLCHAIN/bin:$HOSTTOOLS/bin:$SRCDIR/dejagnu:$PATH $SRCDIR/gcc/contrib/test_installed.g++"$$" --without-gfortran --without-objc --without-gcc --with-g++=$TOOLCHAIN/bin/nanomips-elf-g++ --prefix=$TOOLCHAIN --target=nanomips-elf --target_board=$cfg SIM=$TOOLCHAIN/bin/nanomips-elf-run -v -v -v  $4 &> test.log &
    popd
done
fi

configs=(
    "mips-sim-mti32/-m32/-EL/-msoft-float"
    "mips-sim-mti32/-m32/-EL/-msoft-float/-mno-gpopt"
    "mips-sim-mti32/-m32/-EL/-msoft-float/-nortti-libstdc++"
    "mips-sim-mti32/-m32/-EL/-msoft-float/-mno-gpopt/-nortti-libstdc++"
)

# manipulate the previously generated test_installed.g++ script to generate a modified site.exp
sed 's|^set CFLAGS.*$|set CFLAGS \"-Os -ffunction-sections -fdata-sections\"|' $SRCDIR/gcc/contrib/test_installed > $SRCDIR/gcc/contrib/test_installed.libstdc++"$$"
sed -i 's|^set CXXFLAGS.*$|set CXXFLAGS \"-Os -ffunction-sections -fdata-sections\"|' $SRCDIR/gcc/contrib/test_installed.libstdc++"$$"
sed -i 's|^set GCC_UNDER_TEST.*$|set GCC_UNDER_TEST \"'${TOOLCHAIN}'/bin/${target+$target-}gcc\"\nset HOSTCC \"gcc\"\nset HOSTCFLAGS \"\"|' $SRCDIR/gcc/contrib/test_installed.libstdc++"$$"
sed -i 's|^set srcdir.*$|set srcdir \"'$SRCDIR'/gcc/libstdc++-v3/testsuite\"|' $SRCDIR/gcc/contrib/test_installed.libstdc++"$$" 
sed -i 's|^exit 0$|runtest --tool libstdc++ ${1+"$@"}\nexit 0|g' $SRCDIR/gcc/contrib/test_installed.libstdc++"$$"
chmod +x $SRCDIR/gcc/contrib/test_installed.libstdc++"$$"
if [ $DO = "libstdc++" -o $DO = "all" ]; then
for cfg in "${configs[@]}"; do
    name="libstdcxx_"`echo ${cfg#*/} | tr -d - | tr -d =  | tr / _`

    mkdir $name
    pushd $name
    rm -Rf *

    PATH=$TOOLCHAIN/bin:$HOSTTOOLS/bin:$SRCDIR/dejagnu:$PATH $SRCDIR/gcc/contrib/test_installed.libstdc++"$$" --without-gfortran --without-objc --without-gcc --without-g++ --prefix=$TOOLCHAIN --target=nanomips-elf --target_board=$cfg SIM=$TOOLCHAIN/bin/nanomips-elf-run -v -v -v  $4 &> test.log &
    popd
done
fi

configs=(
    "mips-sim-mti32/-m32/-EL/-msoft-float"
    "mips-sim-mti32/-m32/-EL/-msoft-float/-mclib=tiny"
    "mips-sim-mti32/-m32/-EL/-msoft-float/-mclib=small"
)


# When running outside of build tree, including the provided flags.exp messes include paths and causes spurious failures.
# Discretely pre-empting the provided flags.exp with an empty version seems to avoid the problem.
mkdir lib
touch lib/flags.exp

# manipulate the previously generated test_installed.g++ script to generate a modified site.exp
sed 's|^set srcdir.*$|set srcdir \"'$SRCDIR'/gcc/newlib/testsuite\"\nset CFLAGS_FOR_TARGET \"-I'$TOOLCHAIN'/nanomips-elf/include\"|' $SRCDIR/gcc/contrib/test_installed > $SRCDIR/gcc/contrib/test_installed.newlib"$$" 
sed -i 's|^exit 0$|runtest --tool newlib ${1+"$@"}\nexit 0|g' $SRCDIR/gcc/contrib/test_installed.newlib"$$"
chmod +x $SRCDIR/gcc/contrib/test_installed.newlib"$$"
if [ $DO = "newlib" -o $DO = "all" ]; then
for cfg in "${configs[@]}"; do
    name="newlib_"`echo ${cfg#*/} | tr -d - | tr -d =  | tr / _`

    mkdir $name
    pushd $name
    rm -Rf *
    # Needed for header-check in newlib.locale/UTF-8 test
    ln -s $TOOLCHAIN/nanomips-elf/include targ-include
    PATH=$TOOLCHAIN/bin:$HOSTTOOLS/bin:$SRCDIR/dejagnu:$PATH $SRCDIR/gcc/contrib/test_installed.newlib"$$" --without-gfortran --without-objc --without-gcc --without-g++ --prefix=$TOOLCHAIN --target=nanomips-elf --target_board=$cfg SIM=$TOOLCHAIN/bin/nanomips-elf-run -v -v -v  $4 &> test.log &
    popd
done
fi

wait
# cleanup
rm -f $SRCDIR/gcc/contrib/test_installed.gcc"$$" $SRCDIR/gcc/contrib/test_installed.g++"$$" $SRCDIR/gcc/contrib/test_installed.libstdc++"$$" $SRCDIR/gcc/contrib/test_installed.newlib"$$"
