# [![MTK Logo](https://cdn-www.mediatek.com/icons/mtklogo.svg)](https://www.mediatek.com) &nbsp;&nbsp; nanoMIPS GNU toolchain v2021.00-04-trial-1
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Published on February 21, 2022

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
* Update gcc from v6.3 to v11.2
* Update binutils from v2.29 to v2.37
* Update newlib from v2.5.0 to v4.2.0
* Update qemu from v2.5 to v6.2.0

#### Bug Fixes

#### Other Changes

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
|[Linux x64](../../releases/download/nanoMIPS-2021.00-04-trial-1/MediaTek.GNU.Tools.2021.00-04-trial-1.for.nanoMIPS.Bare.Metal.CentOS-6.x86_64.tar.gz) (.tar.gz)|[166M]|md5: 22fd1153636b2833e5c42b0088f0ca8e<br/>sha256: e5aca8a150898b74c7287d3440009dac04d182b98a577d1f9e725caed8e56b5b|
|[Windows 64](../../releases/download/nanoMIPS-2021.00-04-trial-1/MediaTek.GNU.Tools.2021.00-04-trial-1.for.nanoMIPS.Bare.Metal.Windows.x86_64.tar.gz) (.tar.gz)|[120M]|md5: 57bfde9107744121ce120a8ad0bc28d4<br/>sha256: 4977402057284400ea3282998384ded37f1e0642fd3dd89dc74de919d6880f0d|
|[Linux x86](../../releases/download/nanoMIPS-2021.00-04-trial-1/MediaTek.GNU.Tools.2021.00-04-trial-1.for.nanoMIPS.Bare.Metal.CentOS-6.x86.tar.gz) (.tar.gz)|[169M]|md5: b909a52ec7b27b441a14b12740363dd9<br/>sha256: 9b69eab94851e4820565031368f1a6241a3b74c9bb757f3ed73898cb73a5aaac|
|[Windows x86](../../releases/download/nanoMIPS-2021.00-04-trial-1/MediaTek.GNU.Tools.2021.00-04-trial-1.for.nanoMIPS.Bare.Metal.Windows.x86.tar.gz) (.tar.gz)|[116M]|md5: ce71ecfd2ce0eeb79f4a2db36b80e3f9<br/>sha256: f7eaf8895e662898cdf5d4b76a32f9bc66473e1f987c8bb53e2260a4d5f05472|
 |**MUSL/Linux Toolchain**|||
|[Linux x64](../../releases/download/nanoMIPS-2021.00-04-trial-1/MediaTek.GNU.Tools.2021.00-04-trial-1.for.nanoMIPS.Linux.CentOS-6.x86_64.tar.gz) (.tar.gz)|[184M]|md5: 28f494624046ec25ab13bcbbc66e7cfa<br/>sha256: 7854fe015f68d8fabd74bfa9005ac4f30ede3450574e5aae79f5dfd6ba48be28|
|[Windows 64](../../releases/download/nanoMIPS-2021.00-04-trial-1/MediaTek.GNU.Tools.2021.00-04-trial-1.for.nanoMIPS.Linux.Windows.x86_64.tar.gz) (.tar.gz)|[147M]|md5: c5d32e868fd7eeaad3fb4b197f686ef7<br/>sha256: 70a0b734fdee272ee0a17efa50035d49970d1cce8e50f09f95541a498610e92d|
|[Linux x86](../../releases/download/nanoMIPS-2021.00-04-trial-1/MediaTek.GNU.Tools.2021.00-04-trial-1.for.nanoMIPS.Linux.CentOS-6.x86.tar.gz) (.tar.gz)|[186M]|md5: 8e6a17859e623844dfcf6bd6d67a8c1d<br/>sha256: 44e8ab44a911ff9448b48e091afddafe2ab6430dc15f7fac68795fa330f9a2ee|
|[Windows x86](../../releases/download/nanoMIPS-2021.00-04-trial-1/MediaTek.GNU.Tools.2021.00-04-trial-1.for.nanoMIPS.Linux.Windows.x86.tar.gz) (.tar.gz)|[142M]|md5: deb54df307c67ba62534eb25050f317f<br/>sha256: ce5e7656eaf99da02f93bad50b0711b75c90249646fd13d9a3fbd30f5821c2b4|


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2021.00-04-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-04-trial-1/binutils-2021.00-04-trial-1.src.tar.gz)|[51M]|md5: b6f41849bd60c3dc3254659bec2494e3<br/>sha256: af3f618e60b545941004c70d0ffe0ccb761e1fa1d0d26cac99a70516ad66f2b8|
|[gdb-2021.00-04-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-04-trial-1/gdb-2021.00-04-trial-1.src.tar.gz)|[51M]|md5: f9329853006b2ac41507559d188c65ce<br/>sha256: 4692d4399f08dac24500849c56397e3c669cb874d4219ed894c7c57c1fd1b2b8|
|[gold-2021.00-04-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-04-trial-1/gold-2021.00-04-trial-1.src.tar.gz)|[52M]|md5: 7ed0b0c19fe6e0878e7297a085495880<br/>sha256: 52e0d8fe447884e789d4fd12e9ebb1508902efa271d0126bfb3b92386b3b89fc|
|[newlib-2021.00-04-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-04-trial-1/newlib-2021.00-04-trial-1.src.tar.gz)|[21M]|md5: 76c5b5a194fd5ea17fa05d66ab4c9e08<br/>sha256: bacdbad15518d6c012fdd4c0dc377071ae3df0373723b1b367a07c803e213168|
|[gcc-2021.00-04-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-04-trial-1/gcc-2021.00-04-trial-1.src.tar.gz)|[119M]|md5: 3b1148801483e4c2061bba2a14e11b88<br/>sha256: 748e3df5bbf6fb073c9ef1b5a87172e2a7e155ff516e8f3e9c4a23245f8ac17a|
|[smallclib-2021.00-04-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-04-trial-1/smallclib-2021.00-04-trial-1.src.tar.gz)|[1M]|md5: 7092b722bf358d69da12fb48c84f49b2<br/>sha256: b32ac3f94f27460f1a956022636ebfc4ac9b8336ea80aabd5c0bc70680f89587|
|[qemu-2021.00-04-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-04-trial-1/qemu-2021.00-04-trial-1.src.tar.gz)|[90M]|md5: 7b979520b5144712ba434aaa82ca078e<br/>sha256: 84fe243d610c876f0155d6bc4e97d2af688ab2176553300c49de704190b183d5|
|[musl-2021.00-04-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-04-trial-1/musl-2021.00-04-trial-1.src.tar.gz)|[1M]|md5: cf32f0ab01677461429bfd5b5d8e066d<br/>sha256: 211240ec2e203b8594763bf729c9a7d470f37b8aef0d228f67913da368d6eb79|
|[packages-2021.00-04-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-04-trial-1/packages-2021.00-04-trial-1.src.tar.gz)|[192M]|md5: 4ba6917bd8b8266744a5cc0dae856f8e<br/>sha256: 7afc25848f3456ff9f8d24f9fd30d3be16b6f776fd91e562394ed9b0a4969655|
|[python-2021.00-04-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-04-trial-1/python-2021.00-04-trial-1.src.tar.gz)|[22M]|md5: 7282c77cdf7c1430e76ffbef8f47d07a<br/>sha256: 5bc2fb3380920cc1dd4d1e3c6590227639576c9e97ee557235070e2e3ca0955e|


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
