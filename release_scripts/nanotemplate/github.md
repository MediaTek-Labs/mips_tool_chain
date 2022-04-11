# [![MTK Logo](https://cdn-www.mediatek.com/icons/mtklogo.svg)](https://www.mediatek.com) &nbsp;&nbsp; nanoMIPS GNU toolchain v2022.00-01-trial-1
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Published on April 11, 2022

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
* QEMU support for all ThorV2 instructions, enabled by the command-line option `-cpu THORV2`.
*Rules for assembly syntax of hardware loop instructions (LOOP/LOOPI)
** Loop body should be at least 1 instruction and at most 16 instructions wide.
** Loops cannot contain other branches, any other relocated instructions or macros that expand in to multiple instructions.


#### Bug Fixes

#### Other Changes

#### Known issues
* QEMU can currently only handle at most 150 iterations of the LOOP instruction in call cases. For larger loop counts, qemu will either crash or fail to terminate.
* Due to the QEMU issue, regression testing of this toolchain build is limited to GDBSim. Testing shows slightly different pass rate as compared to previous releases due
to differences in the capabilities of QEMU and GDBSim.
* The nanomips-linux toolchain is only regression tested with QEMU, so it has not been tested for this build.



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
|[Linux x64](../../releases/download/nanoMIPS-2022.00-01-trial-1/MediaTek.GNU.Tools.2022.00-01-trial-1.for.nanoMIPS.Bare.Metal.CentOS-6.x86_64.tar.gz) (.tar.gz)|[187M]|md5: bc27dbf1589da3ad849c44c63a5a909b<br/>sha256: 37bccccda6cb5b25be7644cdadbd6c1a7b59c77756237c8cedbd5fcf1f8f9bb8|
|[Windows 64](../../releases/download/nanoMIPS-2022.00-01-trial-1/MediaTek.GNU.Tools.2022.00-01-trial-1.for.nanoMIPS.Bare.Metal.Windows.x86_64.tar.gz) (.tar.gz)|[141M]|md5: df20a27e2a0aba626e909d432798eebf<br/>sha256: 92b5e267732c9c99d2b2580d6db41072acecebb69cb05e12535b1e4a17c7608b|
|[Linux x86](../../releases/download/nanoMIPS-2022.00-01-trial-1/MediaTek.GNU.Tools.2022.00-01-trial-1.for.nanoMIPS.Bare.Metal.CentOS-6.x86.tar.gz) (.tar.gz)|[192M]|md5: ed8560c4102e9d23ee486f7f7ebb4b52<br/>sha256: 1f37e623d23f8782f9df58377fbb106fcbcb3815e38df5fd980c7f8a5ae58401|
|[Windows x86](../../releases/download/nanoMIPS-2022.00-01-trial-1/MediaTek.GNU.Tools.2022.00-01-trial-1.for.nanoMIPS.Bare.Metal.Windows.x86.tar.gz) (.tar.gz)|[137M]|md5: e4d1ad24ea422f486f2a0b2a3fc7b8f9<br/>sha256: 60ea4fb2f99893315fa985c4d44b92b8941214e3ac0f46809b330da3b62d01ec|
 |**MUSL/Linux Toolchain**|||
|[Linux x64](../../releases/download/nanoMIPS-2022.00-01-trial-1/MediaTek.GNU.Tools.2022.00-01-trial-1.for.nanoMIPS.Linux.CentOS-6.x86_64.tar.gz) (.tar.gz)|[207M]|md5: cb43a64d367da61e410d810d8b612703<br/>sha256: 9bcf3066e359227fa3a9a96fb5777dd8fc00fd33cca1af0554b6d25cfb92acf0|
|[Windows 64](../../releases/download/nanoMIPS-2022.00-01-trial-1/MediaTek.GNU.Tools.2022.00-01-trial-1.for.nanoMIPS.Linux.Windows.x86_64.tar.gz) (.tar.gz)|[183M]|md5: 08c51eaaf5881138d551af17c3948cae<br/>sha256: 1345490db2f539a9b7fb4af4e4e74c44a21356f2c4a6bab4f2ccb31487337c96|
|[Linux x86](../../releases/download/nanoMIPS-2022.00-01-trial-1/MediaTek.GNU.Tools.2022.00-01-trial-1.for.nanoMIPS.Linux.CentOS-6.x86.tar.gz) (.tar.gz)|[210M]|md5: de2682cd1ef0f679a02939fb3c05b442<br/>sha256: 0a3473145eced2772a0e82cbe4d33c5048f409f55610b3e56d9f2f41f4c90b8d|
|[Windows x86](../../releases/download/nanoMIPS-2022.00-01-trial-1/MediaTek.GNU.Tools.2022.00-01-trial-1.for.nanoMIPS.Linux.Windows.x86.tar.gz) (.tar.gz)|[178M]|md5: 4392daaea9cf30fa0bde46cfb6d787fd<br/>sha256: 13cd2acebb087bd907984d2c598b15c7ecebe4d7856f5fbc0a81519730d6dd49|


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2022.00-01-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2022.00-01-trial-1/binutils-2022.00-01-trial-1.src.tar.gz)|[51M]|md5: 20d7f9505895e26bdfaf060152b0aed8<br/>sha256: a04270406a819f52cef3fcab4591f8052b09b905012d86ba5724f16246e20b20|
|[gdb-2022.00-01-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2022.00-01-trial-1/gdb-2022.00-01-trial-1.src.tar.gz)|[51M]|md5: 4a0532bf8be8236c3e6710a585810ba1<br/>sha256: 07c251539bf8559246cec8d36c4e0e568916161fe9dd69c8129d0a279961913d|
|[gold-2022.00-01-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2022.00-01-trial-1/gold-2022.00-01-trial-1.src.tar.gz)|[52M]|md5: 958cecb091740dc9d5cb0f039f4d74a6<br/>sha256: 15c726887e536f54d8cce15aa0e3eb635997fc41accaf9beb80cf22917d75a98|
|[newlib-2022.00-01-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2022.00-01-trial-1/newlib-2022.00-01-trial-1.src.tar.gz)|[21M]|md5: ccdd8e32841b6a03d750b04926ea9df6<br/>sha256: 88a15d56b827717498fc77baa163951f7f86eef0e3665548b1cc09b95bd4f25e|
|[gcc-2022.00-01-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2022.00-01-trial-1/gcc-2022.00-01-trial-1.src.tar.gz)|[119M]|md5: 7c028a57eb7e2e7c4fdbcec32799affd<br/>sha256: f36ef0e5d19064cfdf2816ac53ca8c56acf3b89895cc373b37f789eeb05fb168|
|[smallclib-2022.00-01-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2022.00-01-trial-1/smallclib-2022.00-01-trial-1.src.tar.gz)|[1M]|md5: 676841c1983fef1073bd9c947389349e<br/>sha256: cd9e4ffca589bdc3a595160cb8dc84a16a662e10731b9443a572f6ddd517a6d0|
|[qemu-2022.00-01-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2022.00-01-trial-1/qemu-2022.00-01-trial-1.src.tar.gz)|[90M]|md5: 733c13e5bc8891345000aff1fd0bfbba<br/>sha256: e52f699dd59542f78b9403c423d0b5f15b2f1da30a7b9252ba39f82037147576|
|[musl-2022.00-01-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2022.00-01-trial-1/musl-2022.00-01-trial-1.src.tar.gz)|[1M]|md5: cbda8407d1b3693238949e454bff540b<br/>sha256: 8193b6d4964aad218b43240ec40dc9ee3067bfe7cf0b50fb99ec54572acf9d69|
|[packages-2022.00-01-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2022.00-01-trial-1/packages-2022.00-01-trial-1.src.tar.gz)|[192M]|md5: 1996abc6291a4d168c935b565fb178b1<br/>sha256: 6f924ff85361a1fdab499b47954e12bacf15549fb3c552e4969d5155423b2fcb|
|[python-2022.00-01-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2022.00-01-trial-1/python-2022.00-01-trial-1.src.tar.gz)|[22M]|md5: 97904445280af9d0ce09359933530578<br/>sha256: 2023770ce66576998f8e56261e5b2f9f978e5b65e0a7810a7ba0fc01dc9135a9|


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
