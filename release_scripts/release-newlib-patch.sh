#!/bin/bash -x

TARGET=nanomips-elf
HOSTTOOLSROOT=/mtkoss/Thor/gcc-host
GCCVER=4.9.4

HOSTTRIPLE=x86_64-pc-linux-gnu 
HOSTOBJ="${HOSTOBJ}-$HOSTTRIPLE"
HOSTINSTALL="${HOSTINSTALL}-$HOSTTRIPLE"
BUILD_DIR=build-newlib
os=centos6
HOST_GCC=$HOSTTOOLSROOT/$HOST/${GCCVER}-${os}
NEWLIB_SRC=$PWD/src/newlib
REPO=https://gerrit.mediatek.inc/MD-SHAOLIN/MIPS/newlib
	
help() {
    cat << EOF
Syntax: $0 [options] --version release_version
  options:
  --version new_version
  --seed-version seed_version
  --hosttools gcc_dir
  --build-dir path_build_dir
  --newlib path_to_llvm_project
  --target [nanomips-elf|mips-mti-elf]
  --help
EOF
}

while [ $# -ge 1 ]; do
    case "$1" in 
        --hosttools)
            HOST_GCC="$2"; shift ;;
        --version)
            VERSION="$2"; shift ;;
        --seed-release)
            SEED_TARBALL="$2"; shift ;;
	--build-dir)
	    BUILD_DIR="$2"; shift ;;
	--newlib)
	    NEWLIB_SRC="$2"; shift ;;
	--newlib-branch)
	    NEWLIB_BRANCH="$2"; shift ;;
	--target)
	    TARGET="$2"; shift ;;
	--help)
	    help; exit ;;
	*)
	    echo "error: Unknown option '$1'"
	    exit 2 ;;
    esac
    shift;
done

if [ -z $VERSION ]; then
    echo "error: Must specify release version to build with --version"
    help
    exit
fi

if [ -z $SEED_TARBALL ]; then
    echo "error: Must specify seed version to use with --seed-release"
    help
    exit
fi

if [ ! -f $SEED_TARBALL ]; then
    echo "error: Can't find seed tarball at ${SEED_TARBALL}"
    help
    exit
fi

if [ ! -d $NEWLIB_SRC -a -z $NEWLIB_BRANCH ]; then
    echo "error: Can't find newlib sources at ${NEWLIB_SRC} and no branch specified"
    help
    exit
fi

case $TARGET in
    nanomips*-elf)
	ARCH=nanoMIPS ;;
    mips*-elf)
	ARCH=MIPS ;;
esac

TARBALL=MediaTek.GNU.Tools.${VERSION}.for.${ARCH}.Bare.Metal.CentOS-6.x86_64.tar.gz
SEEDVERSION=`echo $SEED_TARBALL | cut -d. -f 4`
PATH=$HOST_GCC/bin:$PATH
export PATH

INSTALL="$PWD/gcc-elf/$VERSION"
SYSROOT=$INSTALL/$TARGET

build_newlib() {
    echo "### Re-build standard C library"
    mkdir $BUILD_DIR
    rm -Rf $BUILD_DIR/*
    pushd $BUILD_DIR
    # Re-build each newlib multi-lib present in the seed toolchain
    for i in $( find $INSTALL/$TARGET/lib/ -name libc.a -printf "%P\n" | grep -e newlib ); do
	echo `dirname $i` >> ml-elf;
    done
    PATH=$INSTALL/bin:$PATH CC_FOR_TARGET=${TARGET}-gcc $NEWLIB_SRC/configure --srcdir=$NEWLIB_SRC  --with-newlib --with-cross-host=x86_64-pc-linux-gnu --prefix=$INSTALL/  --with-sysroot=$SYSROOT --with-build-sysroot=$SYSROOT --enable-newlib-io-c99-formats --with-pkgversion="$VERSION"  --with-target-subdir=mipsel-r2-mips16-soft-newlib --build=x86_64-pc-linux-gnu --host=$TARGET --target=$TARGET --with-multi-buildlist=$PWD/ml-elf
    PATH=$INSTALL/bin:$PATH make -j 8 || exit
    popd
}

install_newlib() {
    echo "### Re-install standard C library"
    PATH=$INSTALL/bin:$PATH make -C $BUILD_DIR install || exit
}

get_source() {
    if [ ! -z $NEWLIB_BRANCH ]; then
	if [ ! -d $NEWLIB_SRC ]; then
	    git clone --single-branch -b $NEWLIB_BRANCH $REPO $NEWLIB_SRC
	else
	    pushd $NEWLIB_SRC
	    git checkout $NEWLIB_BRANCH
	    popd
	fi
    fi
}

copy_seed() {
    seed=$1
    if [ -d gcc-elf/$VERSION ]; then
	rm -Rf gcc-elf/$VERSION/*
    else
	mkdir -p gcc-elf/$VERSION
    fi
    tar zxv -k -f $seed --strip-components=2 -C gcc-elf/$VERSION
    rm -f gcc-elf/$VERSION/linux gcc-elf/$VERSION/$SEEDVERSION
    touch gcc-elf/$VERSION/$VERSION
}

get_source
copy_seed $SEED_TARBALL
build_newlib
install_newlib
ln -s . gcc-elf/$VERSION/linux
tar --owner=0 --group=0 -pczf $TARBALL gcc-elf/$VERSION

if [ -f ${SEED_TARBALL/.CentOS-6.x86_64./.CentOS-6.x86.} ]; then
    copy_seed ${SEED_TARBALL/.CentOS-6.x86_64./.CentOS-6.x86.}
    install_newlib
    tar --owner=0 --group=0 -pczf ${TARBALL/.CentOS-6.x86_64./.CentOS-6.x86.} gcc-elf/$VERSION
fi

#sed -i 's|RANLIB\ =\ .*ranlib|RANLIB\ =\ /usr/bin/ranlib|g' `find $BUILD_DIR/$TARGET/newlib/ -name Makefile`
sed -i 's|RANLIB=$(RANLIB)|RANLIB=/usr/bin/ranlib|g' $BUILD_DIR/$TARGET/newlib/Makefile

if [ -f ${SEED_TARBALL/.CentOS-6.x86_64./.Windows.x86_64.} ]; then
    copy_seed ${SEED_TARBALL/.CentOS-6.x86_64./.Windows.x86_64.}
    install_newlib
    tar --owner=0 --group=0 -pczf ${TARBALL/.CentOS-6.x86_64./.Windows.x86_64.} gcc-elf/$VERSION
fi

if [ -f ${SEED_TARBALL/.CentOS-6.x86_64./.Windows.x86.} ]; then
    copy_seed ${SEED_TARBALL/.CentOS-6.x86_64./.Windows.x86.}
    install_newlib
    tar --owner=0 --group=0 -pczf ${TARBALL/.CentOS-6.x86_64./.Windows.x86.} gcc-elf/$VERSION
fi
