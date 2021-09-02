# [![MTK Logo](https://cdn-www.mediatek.com/icons/mtklogo.svg)](https://www.mediatek.com) &nbsp;&nbsp; nanoMIPS GNU toolchain v2021.00-01-trial-1
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Published on September 02, 2021

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

#### Bug Fixes

#### Other Changes
* Upgrade GCC compiler from release v6.3 to v11.2
  
#### Known issues


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
|[Linux x64](../../releases/download/nanoMIPS-2021.00-01-trial-1/MediaTek.GNU.Tools.2021.00-01-trial-1.for.nanoMIPS.Bare.Metal.CentOS-6.x86_64.tar.gz) (.tar.gz)|[144M]|md5: d1fe1ac8e9202b98dd8eba4bbb51b79d<br/>sha256: 978f3fd55c1e2a1b0fe8d7927e339b59f27206d2d0c5a367a28ecb999a05aa05|
|[Linux x86](../../releases/download/nanoMIPS-2021.00-01-trial-1/MediaTek.GNU.Tools.2021.00-01-trial-1.for.nanoMIPS.Bare.Metal.CentOS-6.x86.tar.gz) (.tar.gz)|[147M]|md5: cfe72a6150e8705b095f8130745f8c2a<br/>sha256: 893af8e6f08fcaf1a88d28fc19720679199983891414ab0676fcc351ae649e93|
 |**MUSL/Linux Toolchain**|||
|[Linux x64](../../releases/download/nanoMIPS-2021.00-01-trial-1/MediaTek.GNU.Tools.2021.00-01-trial-1.for.nanoMIPS.Linux.CentOS-6.x86_64.tar.gz) (.tar.gz)|[160M]|md5: effcd5cbccbe449f01772f1ce3a63e70<br/>sha256: a31e949f330195a4b68e108be0ec4a5c0139c45d8cafcdc00bf376e70bb8542b|
|[Linux x86](../../releases/download/nanoMIPS-2021.00-01-trial-1/MediaTek.GNU.Tools.2021.00-01-trial-1.for.nanoMIPS.Linux.CentOS-6.x86.tar.gz) (.tar.gz)|[163M]|md5: add6be63012cc9a145f97c5fcfcde351<br/>sha256: 858dd4e3da16c23b8aa840e9546c3f77e9e32eb259785ce2f5258397db6cc2c8|


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2021.00-01-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-01-trial-1/binutils-2021.00-01-trial-1.src.tar.gz)|[51M]|md5: 3a93f82c9f73e904bf4ef3933918138c<br/>sha256: 2aa075fab61f5831b1c3b4b6101b3cfdb9634f37a2bba53c1e19f7fb2cefa1cb|
|[gdb-2021.00-01-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-01-trial-1/gdb-2021.00-01-trial-1.src.tar.gz)|[51M]|md5: f6db9d8990230ef2e7f7bd811b0ee705<br/>sha256: 06090455c03b704c013fac47e8a1633f0c6f37a69382364f8739cb049df5fb40|
|[gold-2021.00-01-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-01-trial-1/gold-2021.00-01-trial-1.src.tar.gz)|[52M]|md5: c05adfe0771df18f6420802c70ca6fdf<br/>sha256: 033429f958b6f6bae550411935f27e2ec022192dd7777f9877b839db08db56ca|
|[newlib-2021.00-01-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-01-trial-1/newlib-2021.00-01-trial-1.src.tar.gz)|[19M]|md5: fe13b01e3ddaa20103375d10af966254<br/>sha256: 181e452dd4c2f825311f757688c5f88815a53060713a8407568d260d4f56d879|
|[gcc-2021.00-01-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-01-trial-1/gcc-2021.00-01-trial-1.src.tar.gz)|[119M]|md5: 57bfd79254353cd9b42004a7eaeef8e1<br/>sha256: da5593372980846b3cb14caffd3e6fce4c60878d8fda37a56385449fc125504e|
|[smallclib-2021.00-01-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-01-trial-1/smallclib-2021.00-01-trial-1.src.tar.gz)|[1M]|md5: 0256c57e733575ea432d687b608edac6<br/>sha256: b1b890d985603cbea56bb53084aafd95ef3fdaac90fdff21d71e1c8cd4e2ab8a|
|[qemu-2021.00-01-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-01-trial-1/qemu-2021.00-01-trial-1.src.tar.gz)|[11M]|md5: dc43bbbfadb7d38c4f2615f1fc5b06bc<br/>sha256: 0a2eabf38c2451e63ba87d740b1c53d1692da74361f6b69c15833894e2ca783d|
|[musl-2021.00-01-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-01-trial-1/musl-2021.00-01-trial-1.src.tar.gz)|[1M]|md5: b2cce0d4c72dde6f96d15549adc4d0ad<br/>sha256: 85b068adc1cd191d6c03ede9f6ac4b86e09d6f320697299ee8986f7328546590|
|[packages-2021.00-01-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-01-trial-1/packages-2021.00-01-trial-1.src.tar.gz)|[189M]|md5: 29a3eb7668f5c455fd35ea97bc519796<br/>sha256: a9ae1c71d3331a71fc6ed3fde7b5322f2deb7f3737e1da5e8eb88f909dd641c9|
|[python-2021.00-01-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-01-trial-1/python-2021.00-01-trial-1.src.tar.gz)|[16M]|md5: 1661982e8b5af5281aa782064ab9d6c1<br/>sha256: 15bf385f2d5bb8482981ffc07f84ab69152fcd940e7f3a9e5b8617a5de224929|


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
