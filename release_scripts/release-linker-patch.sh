#!/bin/bash -x

# usage release-linker-patch.sh <tools-version> <seed-version>
# Expect 
#   1. GNU workspace to exist, with linker branch checkout out at ./src/gold
#   2. Host toolchains under /mtkoss/Thor/gcc-host
#   3. Seed tarballs in /worktmp/release/downloads/nanoMIPS-<seed-version>
# Output in a release tarball for <tools-version> in the current directory,
# consisting of toolchain from <seed-version> patched with a linker built
# for toolsversion.
# One patched toolchain will be produced against each available host
# toolchain variant (x86_64/i686/w64/w32) present for seed-version.

# Currently the seed toolchain path (3) is only visible on mtksap70

TOPDIR=/scratch/frs/build
TARGET=nanomips-elf
OBJ=$TOPDIR/obj-$TARGET
HOSTTOOLSROOT=/mtkoss/Thor/gcc-host
TOOLSVERSION=$1
SEEDVERSION=$2
GCCVER=${GCCVER:-4.9.4}
INSTALL=$PWD/gcc-elf/$TOOLSVERSION
SYSROOT=$INSTALL/$TARGET
BUILDPATH=$INSTALL/bin:$PATH
BUILDPATH=${BUILDPATH#:*} # trim leading :

HOST=x86_64-pc-linux-gnu
HOSTTRIPLE=${HOSTTRIPLE:-$HOST}
HOSTOBJ="${HOSTOBJ}-$HOSTTRIPLE"
HOSTINSTALL="${HOSTINSTALL}-$HOSTTRIPLE"

os=centos6

for HOSTTRIPLE in x86_64-pc-linux-gnu i686-pc-linux-gnu x86_64-w64-mingw32 i686-w64-mingw32; do
    case x$HOSTTRIPLE in
	xx86_64-pc-linux-gnu )
	    os=centos6
	    HOST_OS=CentOS-6
	    HOST_ARCH=x86_64
	    ;;
	xi686-pc-linux-gnu )
	    os=centos6
	    HOST_OS=CentOS-6
	    HOST_ARCH=x86
	    ;;
	xx86_64-w64-mingw32 )
	    os=v6.0.0
	    HOST_OS=Windows
	    HOST_ARCH=x86_64
	    ;;
	xi686-w64-mingw32 )
	    os=v6.0.0
	    HOST_OS=Windows
	    HOST_ARCH=x86
	    ;;
    esac
	
  SEED_TARBALL=MediaTek.GNU.Tools.${SEEDVERSION}.for.nanoMIPS.Bare.Metal.${HOST_OS}.${HOST_ARCH}.tar.gz
  TARBALL=MediaTek.GNU.Tools.${TOOLSVERSION}.for.nanoMIPS.Bare.Metal.${HOST_OS}.${HOST_ARCH}.tar.gz

  if [ ! -e /worktmp/releases/download/nanoMIPS-${SEEDVERSION}/${SEED_TARBALL} ]; then
      continue
  fi

  BUILDPATH="${HOSTTOOLSROOT}/x86_64-pc-linux-gnu/${GCCVER}_centos6/bin:${HOSTTOOLSROOT}/${HOSTTRIPLE}/${GCCVER}_${os}/bin:${BUILDPATH}"

  cd $TOPDIR

  HOSTOPTIONS="--host=$HOSTTRIPLE --build_triple=$HOST"
  G=( --path=$BUILDPATH --git_home=$GITHOME --jobs=${JOBS:-8} )
  G+=(--build=$OBJ --with-pkgversion="$TOOLSVERSION" $HOSTOPTIONS)
  G+=(--prefix=$INSTALL --target=$TARGET --sysroot=$SYSROOT)
  rm -Rf obj-nanomips-elf/gold $INSTALL 

  b/build_toolchain build "${G[@]}" gold || exit 1
  
  tar zxv -k -f /worktmp/releases/download/nanoMIPS-${SEEDVERSION}/${SEED_TARBALL} --strip-components=2 -C gcc-elf/$TOOLSVERSION
  rm -f gcc-elf/$TOOLSVERSION/linux gcc-elf/$TOOLSVERSION/$TOOLSVERSION
  ln -s ../$TOOLSVERSION gcc-elf/$TOOLSVERSION/linux

  tar --owner=0 --group=0 -pczf $TARBALL gcc-elf/$TOOLSVERSION

done
