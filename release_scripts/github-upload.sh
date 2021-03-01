#!/bin/bash

buildhost=172.21.74.90

mkdir /c/Temp/nanomips
pushd /c/Temp/nanomips

rsync -av $buildhost:/worktmp/releases/download/nanoMIPS-$1/* .
rsync -av $buildhost:/worktmp/releases/tag/nanoMIPS-$1.md .

gh auth login -w
gh release create "nanoMIPS-$1" -t "nanoMIPS-$1" -F "nanoMIPS-$1.md" -R MediaTek-Labs/nanomips-gnu-toolchain 

for i in $( ls *.tar.gz ); do
    gh release upload  "nanoMIPS-$1" $i -R MediaTek-Labs/nanomips-gnu-toolchain 
done

popd
