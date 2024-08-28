#!/bin/bash

# $1: release version, eg: 2024.01-02
# $2: path to version.md release notes file
# $3: path to source and binary tar-balls

GH=$HOME/usr/bin/gh

#$GH auth login -w

$GH release create "nanoMIPS-$1" -t "nanoMIPS-$1" -F $2 -R MediaTek-Labs/nanomips-gnu-toolchain

for i in $( ls $3/*.tar.gz $3/*.tgz ); do 
	$GH release upload "nanoMIPS-$1" $i  -R MediaTek-Labs/nanomips-gnu-toolchain
done
