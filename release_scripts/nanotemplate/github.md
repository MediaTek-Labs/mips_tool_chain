# [![MTK Logo](https://cdn-www.mediatek.com/icons/mtklogo.svg)](https://www.mediatek.com) &nbsp;&nbsp; nanoMIPS GNU toolchain v2021.07-01-alpha-2
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Published on July 26, 2021

* [Introduction](#introduction)
* [Release Notes](#release-notes)
* [Documentation](#documentation)
* [Component Versions](#component-versions)
* [Downloads](#downloads)
* [Bug Reporting](#bug-reporting)
* [License Agreements](#license-agreements)

<div id="introduction"></div>

## Introduction

The nanoMIPS Toolchain includes example code, source code, and documentation to facilitate development of bare metal applications on nanoMIPS simulators and development boards. These toolchains provide compilers, linkers, libraries and utilities for building applications to run on nanoMIPS cores.

#### Component	Description

* GCC Bare Metal Toolchain <br/>&nbsp;&nbsp; This is a software engineer's cross-development system for nanoMIPS processors, intended for statically linked embedded applications running on bare metal CPUs or light-weight operating systems.
* GCC Linux (MUSL) Toolchain<br/>&nbsp;&nbsp; For compiling Linux applications for Linux running on nanoMIPS cores.

<div id="release-notes"></div>

## Release Notes
#### New Features

* None.

#### Bug Fixes

* Fix for incorrect branch targets in assembler output due to relocation minimizing pass ( CR MOLY00690538, MOLY00690538). This problem can also be worked around by adding -Wa,-mno-minimize-relocs to compiler flags.

* Fix incorrect exception-handling information in assembler due to linker relaxation.

* Fix internal error in linker due to output sections declared in linker script without any input sections.

* Fix %a translation for formatted output functions.


#### Other Changes

* None.


#### Known issues

* None



<div id="documentation"></div>

## Documentation
**Note** These are external links to docunments by MIPS Tech/Wave Computing.

* [Getting Started Guide, v1.02](http://codescape.mips.com/components/toolchain/nanomips/2019.03-01/docs/MIPS_nanoMIPS_GNU_Toolchain_Getting_Started_Guide_01_02_DN00183.pdf)
* [nanoMIPS ABI Supplement, v1.03](http://codescape.mips.com/components/toolchain/nanomips/2019.03-01/docs/MIPS_nanoMIPS_GNU_Toolchain_Programmers_Guide_01_04_DN00180.pdf)
* [Programmer's Guide, v1.04](http://codescape.mips.com/components/toolchain/nanomips/2019.03-01/docs/MIPS_nanoMIPS_GNU_Toolchain_Programmers_Guide_01_04_DN00180.pdf)
* [nanoMIPS ABI Porting Guide, v1.02](http://codescape.mips.com/components/toolchain/nanomips/2019.03-01/docs/MIPS_nanoMIPS_p32_ABI_Porting_Guide_01_02_DN00184.pdf)
* [Tuning memcpy for MIPS Cores - whitepaper, v0.2](http://codescape.mips.com/components/toolchain/nanomips/2019.03-04/docs/MIPS_nanoMIPS_Memcpy_Tuning_Whitepaper_00_02.pdf)

<div id="component-versions"></div>

## Component Versions

|Component |Based on upstream version|
|:---------|:-----------------------:|
|binutils|	2.28|
|GCC|	6.3.0|
|musl|	1.1.16|
|newlib|	2.5.0|
|GDB|	8.0|
|QEMU|	2.5.0|
|gold|	2.30|
|smallClib|	Internal|
|Python|	2.7.16|

<div id="downloads"></div>

## Downloads

#### Prebuilt Binaries

|Variant  |Size|Checksum|
|:--------|:---|:-------|
|**Bare Metal Toolchain**|||
|[Linux x64](../../releases/download/nanoMIPS-2021.07-01-alpha-2/MediaTek.GNU.Tools.2021.07-01-alpha-2.for.nanoMIPS.Bare.Metal.CentOS-6.x86_64.tar.gz) (.tar.gz)|[118M]|md5: c258b66ec6c08da2204cadeb2488eccb<br/>sha256: 953851153c4e07e69a6f69947abb2ab371c2305ee2faba02c3fff940ccc25d47|
|[Windows 64](../../releases/download/nanoMIPS-2021.07-01-alpha-2/MediaTek.GNU.Tools.2021.07-01-alpha-2.for.nanoMIPS.Bare.Metal.Windows.x86_64.tar.gz) (.tar.gz)|[93M]|md5: d57f28df717ee726ef22b66f0df4860a<br/>sha256: d64a3aa7e709e987aac3019d33bbe34bef60d409658d8087ab59790479d99c2b|
|[Linux x86](../../releases/download/nanoMIPS-2021.07-01-alpha-2/MediaTek.GNU.Tools.2021.07-01-alpha-2.for.nanoMIPS.Bare.Metal.CentOS-6.x86.tar.gz) (.tar.gz)|[121M]|md5: e537147a2f2f42ba3b30cf4f591cc232<br/>sha256: cee289262c7b0028e8d1b041aa0d310e7142352f7851f55406168f17a2408a43|
|[Windows x86](../../releases/download/nanoMIPS-2021.07-01-alpha-2/MediaTek.GNU.Tools.2021.07-01-alpha-2.for.nanoMIPS.Bare.Metal.Windows.x86.tar.gz) (.tar.gz)|[90M]|md5: 06e558f1a7c65f50746ffca72e258e6f<br/>sha256: fd35c9b1232b72d5001f0a137bfcd950ccef990b2a319164c4410fded05a8cbb|
 |**MUSL/Linux Toolchain**|||
|[Linux x64](../../releases/download/nanoMIPS-2021.07-01-alpha-2/MediaTek.GNU.Tools.2021.07-01-alpha-2.for.nanoMIPS.Linux.CentOS-6.x86_64.tar.gz) (.tar.gz)|[129M]|md5: 6dac82d18a2853b49e92b1fceeff3947<br/>sha256: 628dab5865c4eff6aabf595da69a8da6f56aabf091064bb64c40964e0bd326e3|
|[Windows 64](../../releases/download/nanoMIPS-2021.07-01-alpha-2/MediaTek.GNU.Tools.2021.07-01-alpha-2.for.nanoMIPS.Linux.Windows.x86_64.tar.gz) (.tar.gz)|[109M]|md5: 0fe0fde50287e097b681fc82f167c0b3<br/>sha256: ef56ac740244c438645661e4c9676993ba9a067bd078afd628b4ec9e740041cb|
|[Linux x86](../../releases/download/nanoMIPS-2021.07-01-alpha-2/MediaTek.GNU.Tools.2021.07-01-alpha-2.for.nanoMIPS.Linux.CentOS-6.x86.tar.gz) (.tar.gz)|[130M]|md5: a1ee43428b295a233c0a666a49de3ad6<br/>sha256: b31bb87560baa640dc30eae5f551d7e92374fb25ea77964798742e4e8dfe90d0|
|[Windows x86](../../releases/download/nanoMIPS-2021.07-01-alpha-2/MediaTek.GNU.Tools.2021.07-01-alpha-2.for.nanoMIPS.Linux.Windows.x86.tar.gz) (.tar.gz)|[106M]|md5: 40b49a456601b3f0fe7c40969f0f29fe<br/>sha256: 34309a1218698687d96f1d4d689feff8360a3dc37ea4d6c59c255c8b24ee85a3|


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2021.07-01-alpha-2.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-2/binutils-2021.07-01-alpha-2.src.tar.gz)|[51M]|md5: 54b682328282554f01e2fc7563813ac3<br/>sha256: 6f4bf5bc2d165085417c26eade94729d45d6b7b6d4748f9b430519580cf74fd2|
|[gdb-2021.07-01-alpha-2.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-2/gdb-2021.07-01-alpha-2.src.tar.gz)|[51M]|md5: 5a5154ee0348f46c2e9a1b5581e04544<br/>sha256: eeabea6e0e9c7364e9236232df303dc0ab4eb2647994f80b8da3bc2f67e6799f|
|[gold-2021.07-01-alpha-2.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-2/gold-2021.07-01-alpha-2.src.tar.gz)|[52M]|md5: ba6bf834afabb0605976e4ebc029cefc<br/>sha256: e1acb2c8b1a0617b65209d5b284cb10ebf3cfa1d0574fd659d3330294f905161|
|[newlib-2021.07-01-alpha-2.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-2/newlib-2021.07-01-alpha-2.src.tar.gz)|[19M]|md5: ca2914d8e4b7b70bc707cc9671398d6a<br/>sha256: a7e4ee9d5b6c1d88b96aed977336e37f5ac39fcd255234ab995fb53b1968be23|
|[gcc-2021.07-01-alpha-2.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-2/gcc-2021.07-01-alpha-2.src.tar.gz)|[112M]|md5: 1f7dd0439017873eb254b9aed08682fe<br/>sha256: 958ecbb472e432ce8cf0b620b83ab53340cc30a93608f0045752471cfeda4034|
|[smallclib-2021.07-01-alpha-2.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-2/smallclib-2021.07-01-alpha-2.src.tar.gz)|[1M]|md5: fe9e1385996b1ee1f5b05a23c6c1f911<br/>sha256: 54e55ff86b000d563376fcc57d10d812781846aa9bc252d44847f58055e96496|
|[qemu-2021.07-01-alpha-2.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-2/qemu-2021.07-01-alpha-2.src.tar.gz)|[11M]|md5: d835e32c0854aa2bbb117f5ae203eb2d<br/>sha256: 9adb49f7262a253cbaa700f1cc46b1fc8df5274ddc8a72c4057ed5f2b89ebd1b|
|[musl-2021.07-01-alpha-2.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-2/musl-2021.07-01-alpha-2.src.tar.gz)|[1M]|md5: c11263b6cd6cfb6c6c76b528290b0a4c<br/>sha256: 682b9b369fc885e4e1e18b82960458a52d6a0ab9b2d6adb775503554393d6a12|
|[packages-2021.07-01-alpha-2.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-2/packages-2021.07-01-alpha-2.src.tar.gz)|[189M]|md5: bc4b186ec656fb26b0d3ad8f99cca7c3<br/>sha256: dd63662486758e1c4cd06457e26dce1d3f85e97dac4e334d13b044da749de7b6|
|[python-2021.07-01-alpha-2.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-2/python-2021.07-01-alpha-2.src.tar.gz)|[16M]|md5: b0b7cf845a4fceb187344fe45731006a<br/>sha256: 7a463f5bf67cc76a55e3edb92b7baa0675c027ae64ddcb178f93bd7bd2ce608a|


<div id="bug-reporting"></div>

## Bug Reporting

Report bugs for MediaTek's nanoMIPS GNU toolchain, **[here](https://github.com/MediaTek-Labs/nanomips-gnu-toolchain/issues)**.

For reporting issues that are not target-specific, please see instructions provided within the source files of the concerned component.

<div id="license-agreements"></div>

## License Agreements

### License Categories
The components included in this toolchain fall under multiple license agreements:

* GPL v2 - QEMU, Linux
* GPL v3.1 - GNU toolchain, gdb, gmp, mpfr, libiconv
* LGPL v3 - mpc
* MIT / BSD style Licenses - Newlib, smallclib, tinyclib, libgloss/MIPS HAL, musl-libc, libffi, expat, ncurses
* zlib - zlib-libpng license 
* PSFL v2 - python

To refer to the complete license text for any component, check the corresponding sources above.

*Disclaimer of Warranties and Limitation of Liability*

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

TO THE FULLEST EXTENT ALLOWED AND PERMITTED BY APPLICABLE LAWS AND REGULATIONS, MEDIATEK SHALL NOT, UNDER ANY CIRCUMSTANCES, BE LIABLE TO YOU OR ANY THIRD PARTY THROUGH YOU FOR PERSONAL INJURY OR ANY CONSEQUENTIAL, EXEMPLARY, INCIDENTAL, INDIRECT, PUNITIVE OR SPECIAL DAMAGES WHATSOEVER, INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF PROFITS, LOSS OF DATA, BUSINESS INTERRUPTION OR ANY OTHER COMMERCIAL DAMAGES OR LOSSES, ARISING OUT OF OR IN RELATION TO THIS AGREEMENT, YOUR USE OF THE Software Package and DOCUMENTATION, OR YOUR DEVELOPMENT OF APPLICATIONS, WHETHER BASED ON BREACH OF CONTRACT, BREACH OF WARRANTY, TORT (INCLUDING NEGLIGENCE), PRODUCT LIABILITY OR OTHERWISE, EVEN IF MEDIATEK HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.

### License Agreements

#### GPL v3.1

The source code is distributed under the GNU General Public License version 3,
with the addition under section 7 of an exception described in the "GCC
Runtime Library Exception, version 3.1" as follows (or see the file
COPYING.RUNTIME):

GCC RUNTIME LIBRARY EXCEPTION

Version 3.1, 31 March 2009

Copyright (C) 2009 Free Software Foundation, Inc.

Everyone is permitted to copy and distribute verbatim copies of this
license document, but changing it is not allowed.

This GCC Runtime Library Exception ("Exception") is an additional
permission under section 7 of the GNU General Public License, version
3 ("GPLv3"). It applies to a given file (the "Runtime Library") that
bears a notice placed by the copyright holder of the file stating that
the file is governed by GPLv3 along with this Exception.

When you use GCC to compile a program, GCC may combine portions of
certain GCC header files and runtime libraries with the compiled
program. The purpose of this Exception is to allow compilation of
non-GPL (including proprietary) programs to use, in this way, the
header files and runtime libraries covered by this Exception.

0. Definitions.

A file is an "Independent Module" if it either requires the Runtime
Library for execution after a Compilation Process, or makes use of an
interface provided by the Runtime Library, but is not otherwise based
on the Runtime Library.

"GCC" means a version of the GNU Compiler Collection, with or without
modifications, governed by version 3 (or a specified later version) of
the GNU General Public License (GPL) with the option of using any
subsequent versions published by the FSF.

"GPL-compatible Software" is software whose conditions of propagation,
modification and use would permit combination with GCC in accord with
the license of GCC.

"Target Code" refers to output from any compiler for a real or virtual
target processor architecture, in executable form or suitable for
input to an assembler, loader, linker and/or execution
phase. Notwithstanding that, Target Code does not include data in any
format that is used as a compiler intermediate representation, or used
for producing a compiler intermediate representation.

The "Compilation Process" transforms code entirely represented in
non-intermediate languages designed for human-written code, and/or in
Java Virtual Machine byte code, into Target Code. Thus, for example,
use of source code generators and preprocessors need not be considered
part of the Compilation Process, since the Compilation Process can be
understood as starting with the output of the generators or
preprocessors.

A Compilation Process is "Eligible" if it is done using GCC, alone or
with other GPL-compatible software, or if it is done without using any
work based on GCC. For example, using non-GPL-compatible Software to
optimize any GCC intermediate representations would not qualify as an
Eligible Compilation Process.

1. Grant of Additional Permission.

You have permission to propagate a work of Target Code formed by
combining the Runtime Library with Independent Modules, even if such
propagation would otherwise violate the terms of GPLv3, provided that
all Target Code was generated by Eligible Compilation Processes. You
may then convey such a combination under terms of your choice,
consistent with the licensing of the Independent Modules.

2. No Weakening of GCC Copyleft.

The availability of this Exception does not imply any general
presumption that third-party software is unaffected by the copyleft
requirements of the license of GCC.


#### NewLib, SmallClib,TinyClib and Musl
These libraries are licensed under a collection of code, copyright held by multiple 
contributors and distributed under an umbrella of permissive MIT and BSD-like free 
licenses. The complete license text is provided in the binary distribution 
under [Toolchain_Root]/share/copying
COPYING.NEWLIB
COPYING.MUSL
COPYING.CLIB
