#!/bin/bash -x

OPTS=`getopt -o s:r:c:a:j:h --long src:,runlist:,conf:,extra_args:,jobs:,help -n 'parse options' -- "$@"`
eval set -- "$OPTS"

dry_run=0
SRCDIR=""
RUNLIST=gcc,g\+\+,libstdc\+\+,newlib
EXTRA_ARGS=""
TOOLCHAIN=""

while true ; do
    case $1 in
	-s|--src) SRCDIR=$2; shift 2;;
	-r|--runlist) RUNLIST=$2; shift 2;;
	-a|--extra_args) EXTRA_ARGS=\/${2/,/\/}; shift 2;;
	-j|--jobs) JOB_MAX=$2; shift 2;;
	-h|--help)
	    echo "$0 <opts,...> <toolchain_path>"
	    echo "Options:"
	    echo "	--src=<path_to_checked_out_sources>"
	    echo "	--runlist=gcc,g++,libstdc++,newlib"
	    echo "	--extra_args=<extra_cflags_for_test>"
	    echo "	--jobs=<max number of parallel test runs>"
	    echo "	--help		Print this message"
	    shift; exit; break;;
	--) TOOLCHAIN=$2; break;;
	*)  echo "Unrecognized option, try $0 --help";
	    exit 1
	    break;;
    esac
done

if [ -z $2 ]; then
    TOOLCHAIN=/projects/mipssw/toolchains/nanomips-elf/2019.03-01
else
    TOOLCHAIN=$2
fi

if [ ! -d $TOOLCHAIN ]; then
    echo "ERROR: Toolchain directory not found $TOOLCHAIN"
    exit 1
fi

if [ "x$TOOLCHAIN" == "x" ]; then
    echo "error: must specify toolchain root"
    exit 1
elif [ ! -d $TOOLCHAIN -o ! -d $TOOLCHAIN/bin -o ! -d $TOOLCHAIN/$TRIPLET/bin ]; then
    echo "error: toolchain root not found: $TOOLCHAIN"
fi

if [ ! -d $SRCDIR/gcc ]; then
    echo "error: expect gcc sources in $SRCDIR/gcc"
    exit 1
fi

if [ ! -d $SRCDIR/dejagnu ]; then
    echo "ERROR: DejaGNU source not found $SRCDIR/dejagnu"
    exit 1
fi

if [ -z $JOB_MAX ]; then
    which lscpu > /dev/null
    if [ $? -eq 0 ]; then
	JOB_MAX=`lscpu | grep -e ^CPU\(s\): | awk '{print $2;}'`
    else
	JOB_MAX=8 # assumed
    fi
fi

HOSTTOOLS=${HOSTTOOLSROOT:-/projects/mipssw/toolchains/}x86_64-pc-linux-gnu/4.9.4-centos6

declare -a configs
configs=(
    "generic-sim/-m32/-EL/-msoft-float"
    "generic-sim/-m32/-EL/-msoft-float/-mcmodel=medium"
    "generic-sim/-m32/-EL/-msoft-float/-mcmodel=large"
    "generic-sim/-m32/-EL/-msoft-float/-mpid"
    "generic-sim/-m32/-EL/-msoft-float/-mcmodel=medium/-mpid"
    "generic-sim/-m32/-EL/-msoft-float/-mcmodel=large/-mpid"
    "generic-sim/-m32/-EL/-msoft-float/-mno-gpopt"
    "generic-sim/-m32/-EL/-msoft-float/-mcmodel=medium/-mno-gpopt"
    "generic-sim/-m32/-EL/-msoft-float/-mcmodel=large/-mno-gpopt"
    "generic-sim/-m32/-EL/-msoft-float/-mno-gpopt/-mno-pcrel"
    "generic-sim/-m32/-EL/-msoft-float/-mcmodel=medium/-mno-gpopt/-mno-pcrel"
    "generic-sim/-m32/-EL/-msoft-float/-mcmodel=large/-mno-gpopt/-mno-pcrel")
jobs=""

# manipulate the test_installed script to generate a modified site.exp
sed 's|^set CFLAGS.*$|set CFLAGS \"\"\nset HOSTCC \"gcc\"\nset HOSTCFLAGS \"\"|' $SRCDIR/gcc/contrib/test_installed > $SRCDIR/gcc/contrib/test_installed.gcc"$$"
chmod +x $SRCDIR/gcc/contrib/test_installed.gcc"$$"

jcount=0
declare -a jqueue

if [[ $RUNLIST =~ gcc ]]; then
    for cfg in "${configs[@]}"; do
	name="gcc_"`echo ${cfg#*/} | tr -d - | tr -d =  | tr / _`
	mkdir $name
	pushd $name
	rm -Rf *
	jcount=$(( jcount + 1 ))
	if [ $jcount -gt $JOB_MAX ]; then
	    wait ${jqueue[$((jcount - JOB_MAX))]}
	fi
	DEJAGNU_SIM_LDSCRIPT="-Tuhi32.ld" DEJAGNU_SIM_LINK_FLAGS="-Wl,--defsym,__memory_size=32M" DEJAGNU_SIM_OPTIONS="-cpu nanomips-generic -semihosting -nographic -kernel"  DEJAGNU_SIM=$TOOLCHAIN/bin/qemu-system-nanomips PATH=$TOOLCHAIN/bin:$HOSTTOOLS/bin:$SRCDIR/dejagnu:$PATH $SRCDIR/gcc/contrib/test_installed.gcc"$$" --without-gfortran --without-objc --without-g++ --with-gcc=$TOOLCHAIN/bin/nanomips-elf-gcc --prefix=$TOOLCHAIN --target=nanomips-elf --target_board=$cfg -v -v -v $4 &> test.log &
	jqueue+=( $! )
	popd > /dev/null
    done
fi

configs+=(
    "mips-sim-mti32/-m32/-EL/-msoft-float/-mno-gpopt/-fno-rtti/-fno-exceptions"
    "mips-sim-mti32/-m32/-EL/-msoft-float/-mno-gpopt/-fno-rtti/-fno-exceptions/-nortti-libstdc++"
)

# manipulate the test_installed script to generate a modified site.exp
sed 's|^set GCC_UNDER_TEST.*$|set GCC_UNDER_TEST \"'$TOOLCHAIN'/bin/nanomips-elf-gcc\"\nset HOSTCC \"gcc\"\nset HOSTCFLAGS \"\"|' $SRCDIR/gcc/contrib/test_installed > $SRCDIR/gcc/contrib/test_installed.g++"$$"
chmod +x $SRCDIR/gcc/contrib/test_installed.g++"$$"

if [[ $RUNLIST =~ g\+\+ ]]; then
    for cfg in "${configs[@]}"; do
	name="gxx_"`echo ${cfg#*/} | tr -d - | tr -d =  | tr / _`
	mkdir $name
	pushd $name
	rm -Rf *
	jcount=$(( jcount + 1 ))
	if [ $jcount -gt $JOB_MAX ]; then
	    wait ${jqueue[$((jcount - JOB_MAX))]}
	fi

	DEJAGNU_SIM_LDSCRIPT="-Tuhi32.ld" DEJAGNU_SIM_LINK_FLAGS="-Wl,--defsym,__memory_size=32M" DEJAGNU_SIM_OPTIONS="-cpu nanomips-generic -semihosting -nographic -kernel"  DEJAGNU_SIM=$TOOLCHAIN/bin/qemu-system-nanomips PATH=$TOOLCHAIN/bin:$HOSTTOOLS/bin:$SRCDIR/dejagnu:$PATH $SRCDIR/gcc/contrib/test_installed.g++"$$" --without-gfortran --without-objc --without-gcc --with-g++=$TOOLCHAIN/bin/nanomips-elf-g++ --prefix=$TOOLCHAIN --target=nanomips-elf --target_board=$cfg -v -v -v  $4 &> test.log &
	jqueue+=( $! )
	popd > /dev/null
    done
fi

configs=(
    "generic-sim/-m32/-EL/-msoft-float"
    "generic-sim/-m32/-EL/-msoft-float/-mno-gpopt"
    "generic-sim/-m32/-EL/-msoft-float/-nortti-libstdc++"
    "generic-sim/-m32/-EL/-msoft-float/-mno-gpopt/-nortti-libstdc++"
)

# manipulate the previously generated test_installed.g++ script to generate a modified site.exp
sed 's|^set CFLAGS.*$|set CFLAGS \"-Os -ffunction-sections -fdata-sections\"|' $SRCDIR/gcc/contrib/test_installed > $SRCDIR/gcc/contrib/test_installed.libstdc++"$$"
sed -i 's|^set CXXFLAGS.*$|set CXXFLAGS \"-Os -ffunction-sections -fdata-sections\"|' $SRCDIR/gcc/contrib/test_installed.libstdc++"$$"
sed -i 's|^set GCC_UNDER_TEST.*$|set GCC_UNDER_TEST \"'${TOOLCHAIN}'/bin/${target+$target-}gcc\"\nset HOSTCC \"gcc\"\nset HOSTCFLAGS \"\"|' $SRCDIR/gcc/contrib/test_installed.libstdc++"$$"
sed -i 's|^set srcdir.*$|set srcdir \"'$SRCDIR'/gcc/libstdc++-v3/testsuite\"|' $SRCDIR/gcc/contrib/test_installed.libstdc++"$$" 
sed -i 's|^exit 0$|runtest --tool libstdc++ ${1+"$@"}\nexit 0|g' $SRCDIR/gcc/contrib/test_installed.libstdc++"$$"
chmod +x $SRCDIR/gcc/contrib/test_installed.libstdc++"$$"
if [[ $RUNLIST =~ libstdc\+\+ ]]; then
    for cfg in "${configs[@]}"; do
	name="libstdcxx_"`echo ${cfg#*/} | tr -d - | tr -d =  | tr / _`

	mkdir $name
	pushd $name
	rm -Rf *
	jcount=$(( jcount + 1 ))
	if [ $jcount -gt $JOB_MAX ]; then
	    wait ${jqueue[$((jcount - JOB_MAX))]}
	fi

	DEJAGNU_SIM_LDSCRIPT="-Tuhi32.ld" DEJAGNU_SIM_LINK_FLAGS="-Wl,--defsym,__memory_size=32M" DEJAGNU_SIM_OPTIONS="-cpu nanomips-generic -semihosting -nographic -kernel"  DEJAGNU_SIM=$TOOLCHAIN/bin/qemu-system-nanomips  PATH=$TOOLCHAIN/bin:$HOSTTOOLS/bin:$SRCDIR/dejagnu:$PATH $SRCDIR/gcc/contrib/test_installed.libstdc++"$$" --without-gfortran --without-objc --without-gcc --without-g++ --prefix=$TOOLCHAIN --target=nanomips-elf --target_board=$cfg SIM=$TOOLCHAIN/bin/nanomips-elf-run -v -v -v  $4 &> test.log &
	jqueue+=( $! )
	popd > /dev/null
    done
fi

configs=(
    "generic-sim/-m32/-EL/-msoft-float"
    "generic-sim/-m32/-EL/-msoft-float/-mclib=tiny"
    "generic-sim/-m32/-EL/-msoft-float/-mclib=small"
)


# When running outside of build tree, including the provided flags.exp messes include paths and causes spurious failures.
# Discretely pre-empting the provided flags.exp with an empty version seems to avoid the problem.
mkdir lib
touch lib/flags.exp

# manipulate the previously generated test_installed.g++ script to generate a modified site.exp
sed 's|^set srcdir.*$|set srcdir \"'$SRCDIR'/gcc/newlib/testsuite\"\nset CFLAGS_FOR_TARGET \"-I'$TOOLCHAIN'/nanomips-elf/include\"|' $SRCDIR/gcc/contrib/test_installed > $SRCDIR/gcc/contrib/test_installed.newlib"$$"
sed -i 's|^exit 0$|runtest --tool newlib ${1+"$@"}\nexit 0|g' $SRCDIR/gcc/contrib/test_installed.newlib"$$"
chmod +x $SRCDIR/gcc/contrib/test_installed.newlib"$$"
if [[ $RUNLIST =~ newlib ]]; then
    for cfg in "${configs[@]}"; do
	name="newlib_"`echo ${cfg#*/} | tr -d - | tr -d =  | tr / _`

	mkdir $name
	pushd $name
	rm -Rf *
	jcount=$(( jcount + 1 ))
	if [ $jcount -gt $JOB_MAX ]; then
	    wait ${jqueue[$((jcount - JOB_MAX))]}
	fi
	# Needed for header-check in newlib.locale/UTF-8 test
	ln -s $TOOLCHAIN/nanomips-elf/include targ-include
	DEJAGNU_SIM_LDSCRIPT="-Tuhi32.ld" DEJAGNU_SIM_LINK_FLAGS="-Wl,--defsym,__memory_size=32M" DEJAGNU_SIM_OPTIONS="-cpu nanomips-generic -semihosting -nographic -kernel"  DEJAGNU_SIM=$TOOLCHAIN/bin/qemu-system-nanomips PATH=$TOOLCHAIN/bin:$HOSTTOOLS/bin:$SRCDIR/dejagnu:$PATH $SRCDIR/gcc/contrib/test_installed.newlib"$$" --without-gfortran --without-objc --without-gcc --without-g++ --prefix=$TOOLCHAIN --target=nanomips-elf --target_board=$cfg SIM=$TOOLCHAIN/bin/nanomips-elf-run -v -v -v  $4 &> test.log &
	jqueue+=( $! )
	popd > /dev/null
    done
fi

wait
# cleanup
rm -f $SRCDIR/gcc/contrib/test_installed.gcc"$$" $SRCDIR/gcc/contrib/test_installed.g++"$$" $SRCDIR/gcc/contrib/test_installed.libstdc++"$$" $SRCDIR/gcc/contrib/test_installed.newlib"$$"
