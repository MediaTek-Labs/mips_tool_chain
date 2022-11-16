# [![MTK Logo](https://cdn-www.mediatek.com/icons/mtklogo.svg)](https://www.mediatek.com) &nbsp;&nbsp; nanoMIPS GNU toolchain v2022.10-01
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Published on November 16, 2022

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
* GNU assembler support for all ThorV2 instructions, enabled by the assembler command-line option `-march=thorv2`.
* Compiler support for for all ThorV2 instructions, enabled by the assembler command-line option `-march=thorv2`.
* GDB/simulator support for all ThorV2 instructions, enabled by the command-line option `--architecture=nanomips:thorv2`.
* QEMU support for all ThorV2 instructions, enabled by the command-line option -cpu THORV2.
* Add small and tiny C library multi-lib variants for ThorV2.
* Add assembler/disassembler support for named hardware loop count and control CP0 registers.
* Add 64-bit __builtin_popcount11() expansion by using BITSUM on higher and lower halves of the input.

#### Bug Fixes
* None

#### Other Changes
* Rules for assembly syntax of hardware loop instructions (LOOP/LOOPI)
** Loop body should be at least 1 instruction and at most 16 instructions wide.
** Loops cannot contain other branches, any other relocated instructions or macros that expand in to multiple instructions.

#### Known Issues
* Expansion of the `LA`  assembler macro can lead to mis-aligned GP-relative address calculation (ADDIU[GP.W]) for sub-word variable types. This leads to link-time failures and can be avoided by explicitly using `ADDIU[GP.B]` or `ADDIU[GP.W]` depending on the element type.


<div id="documentation"></div>

## Documentation
**Note** These are external links to docunments by MIPS Tech/Wave Computing.

* [Getting Started Guide, v1.02](http://codescape.mips.com/components/toolchain/nanomips/2019.03-01/docs/MIPS_nanoMIPS_GNU_Toolchain_Getting_Started_Guide_01_02_DN00183.pdf)
* [nanoMIPS ABI Supplement, v1.03](http://codescape.mips.com/components/toolchain/nanomips/2019.03-01/docs/MIPS_nanoMIPS_ABI_supplement_01_03_DN00179.pdf)
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
|[Linux x64](../../releases/download/nanoMIPS-2022.10-01/MediaTek.GNU.Tools.2022.10-01.for.nanoMIPS.Bare.Metal.CentOS-6.x86_64.tgz) (.tgz)|[188M]|md5: bff51e538127965382d9bfd76ee24ce1<br/>sha256: 6468bea3de5d2faf52eb51fecf12be27c01cb323002f5f3882a2cc6d0a138c37|
|[Windows 64](../../releases/download/nanoMIPS-2022.10-01/MediaTek.GNU.Tools.2022.10-01.for.nanoMIPS.Bare.Metal.Windows.x86_64.tgz) (.tgz)|[143M]|md5: 9351eb98e4f79ea2b8eebc185c03a146<br/>sha256: 05ea077095ff99e9396e5714f77c24501a8d5d33f3eb9f8fe39b12044b566b27|
|[Linux x86](../../releases/download/nanoMIPS-2022.10-01/MediaTek.GNU.Tools.2022.10-01.for.nanoMIPS.Bare.Metal.CentOS-6.x86.tgz) (.tgz)|[194M]|md5: 9fe6698294efac594da39be474dfd823<br/>sha256: a237a13b36ee606544c73d35da2abd370d4174437835b45eb9e5000e9436b780|
|[Windows x86](../../releases/download/nanoMIPS-2022.10-01/MediaTek.GNU.Tools.2022.10-01.for.nanoMIPS.Bare.Metal.Windows.x86.tgz) (.tgz)|[139M]|md5: 85bf72757b804c743e3b3583068f95dd<br/>sha256: f273297a5dedbaa9da3d058d3274d3d7f06583427c64ce0e7a0695b64c3aa6b5|
 |**MUSL/Linux Toolchain**|||
|[Linux x64](../../releases/download/nanoMIPS-2022.10-01/MediaTek.GNU.Tools.2022.10-01.for.nanoMIPS.Linux.CentOS-6.x86_64.tgz) (.tgz)|[207M]|md5: 6f3b5b7948f8ff3c09ac65ad044aa8df<br/>sha256: 63497c13244ba157555e76b15ec755810d4bfd2b72c70c71aa0acbdec1ab53e0|
|[Windows 64](../../releases/download/nanoMIPS-2022.10-01/MediaTek.GNU.Tools.2022.10-01.for.nanoMIPS.Linux.Windows.x86_64.tgz) (.tgz)|[183M]|md5: 43153e23e1ae8a3c7350dc71b99b3fcf<br/>sha256: 7f40d1be1c98047b6aecb9ef1f09079aed12ff0f5cb08274ad397599ffb900ac|
|[Linux x86](../../releases/download/nanoMIPS-2022.10-01/MediaTek.GNU.Tools.2022.10-01.for.nanoMIPS.Linux.CentOS-6.x86.tgz) (.tgz)|[210M]|md5: c8d43c488301698ab69f34445563764b<br/>sha256: 00add67cd98c777d89b609f3b0f97c985a135c6e542f182810cf031498e00232|
|[Windows x86](../../releases/download/nanoMIPS-2022.10-01/MediaTek.GNU.Tools.2022.10-01.for.nanoMIPS.Linux.Windows.x86.tgz) (.tgz)|[178M]|md5: 23e2e652c0929b2840f5e876f4a81e39<br/>sha256: a0573a915b018d2d3bed3b7a45ec056b88861c072ccffe34ad028a416588df01|


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2022.10-01.src.tgz](../../releases/download/nanoMIPS-2022.10-01/binutils-2022.10-01.src.tgz)|[51M]|md5: 9fb8bae0c3aeaa4334fc6fc1b32bea1c<br/>sha256: 5780443347cf8a6082d30045c562fff3626a24cfefafa4e992bf03dd720a6649|
|[gdb-2022.10-01.src.tgz](../../releases/download/nanoMIPS-2022.10-01/gdb-2022.10-01.src.tgz)|[51M]|md5: 8bbd3226c01d5cb7976184076343a34f<br/>sha256: 77b6aa2dd9573802efb3cefd9951455fa21e8fd57516020d246b2c7db24501f9|
|[gold-2022.10-01.src.tgz](../../releases/download/nanoMIPS-2022.10-01/gold-2022.10-01.src.tgz)|[52M]|md5: 35ea62d9d295377ee34ff42b5f7e7c63<br/>sha256: f981e3aa951c6bde85cc10c972f2e4d6ec5547db86b7068faad08c87562aeb0c|
|[newlib-2022.10-01.src.tgz](../../releases/download/nanoMIPS-2022.10-01/newlib-2022.10-01.src.tgz)|[21M]|md5: 9f813bdc70e44be5c41f05fe7f6626ea<br/>sha256: b94053c76831a603b760c8395176c3ac3b24b9718f5d1a424757f7171ca7ff20|
|[gcc-2022.10-01.src.tgz](../../releases/download/nanoMIPS-2022.10-01/gcc-2022.10-01.src.tgz)|[119M]|md5: c18e33c18434c57cc4caf76198c5f4a9<br/>sha256: 33996158c6ce2bb1783f6880076ed1ca4049db909cf99605024d264d558706c0|
|[smallclib-2022.10-01.src.tgz](../../releases/download/nanoMIPS-2022.10-01/smallclib-2022.10-01.src.tgz)|[1M]|md5: 452592c74548973eb3e8104fe96938cc<br/>sha256: 3cfbfe63472fc481952ba14f1ed607f8565d1227b222a6a4f8ee0d2c886fbf86|
|[qemu-2022.10-01.src.tgz](../../releases/download/nanoMIPS-2022.10-01/qemu-2022.10-01.src.tgz)|[90M]|md5: d03e5431776548b0056e7c23edcd367d<br/>sha256: a4126436ecdc50585f36e814581156e9fc7beff35f712df988f3125d93c53fb4|
|[musl-2022.10-01.src.tgz](../../releases/download/nanoMIPS-2022.10-01/musl-2022.10-01.src.tgz)|[1M]|md5: e7cf3d629bad44b3114a24d2889eaeac<br/>sha256: 8fe0a3b81f7542fe94e9a6853fa179b5b6ccccdf55193768093a2d70f20b64e5|
|[packages-2022.10-01.src.tgz](../../releases/download/nanoMIPS-2022.10-01/packages-2022.10-01.src.tgz)|[192M]|md5: aafb85664e6717fda08f233da2541aec<br/>sha256: e3131afc662cbe281ad7ba49ccb1e75262bf0d768c7361e13fa9d91c9b74c4e8|
|[python-2022.10-01.src.tgz](../../releases/download/nanoMIPS-2022.10-01/python-2022.10-01.src.tgz)|[22M]|md5: 0d20737394318d920024b757c0726e84<br/>sha256: 620806b7700cb0b964a3bd28fd0ee80c10014a2ddee8a5abe44e5c18ef5e2422|


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
