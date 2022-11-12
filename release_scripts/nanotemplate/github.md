# [![MTK Logo](https://cdn-www.mediatek.com/icons/mtklogo.svg)](https://www.mediatek.com) &nbsp;&nbsp; nanoMIPS GNU toolchain v2022.11-01
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Published on November 11, 2022

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
|[Linux x64](../../releases/download/nanoMIPS-2022.11-01/MediaTek.GNU.Tools.2022.11-01.for.nanoMIPS.Bare.Metal.CentOS-6.x86_64.tgz) (.tgz)|[188M]|md5: fc2f2bc846c21651efe14d14cea4df32<br/>sha256: c1367e12f9b737fb9ebad14d2bfa82f4449385824ef7c542b0c19a7c5b184175|
|[Windows 64](../../releases/download/nanoMIPS-2022.11-01/MediaTek.GNU.Tools.2022.11-01.for.nanoMIPS.Bare.Metal.Windows.x86_64.tgz) (.tgz)|[143M]|md5: a54f1ac2eab4cc63ebc03d912ca13ff4<br/>sha256: c6a12b03a8bb6c0e54903d4008bacd0fa5ad79443aefbe737d0297aceed67968|
|[Linux x86](../../releases/download/nanoMIPS-2022.11-01/MediaTek.GNU.Tools.2022.11-01.for.nanoMIPS.Bare.Metal.CentOS-6.x86.tgz) (.tgz)|[194M]|md5: 6fb94cc91b70a32840bd369e1235349d<br/>sha256: d0f35afedbaea493f492b44f2255abcea452d0b732e9b2c8c7190848ffb63cdb|
|[Windows x86](../../releases/download/nanoMIPS-2022.11-01/MediaTek.GNU.Tools.2022.11-01.for.nanoMIPS.Bare.Metal.Windows.x86.tgz) (.tgz)|[139M]|md5: afb2de4ce01647db5990e058a4dec08e<br/>sha256: d6fd7e43cf5abbcbd67a1f1a7e09d3222b3f879fd0c0e2d18edbab8a04eda599|
 |**MUSL/Linux Toolchain**|||
|[Linux x64](../../releases/download/nanoMIPS-2022.11-01/MediaTek.GNU.Tools.2022.11-01.for.nanoMIPS.Linux.CentOS-6.x86_64.tgz) (.tgz)|[207M]|md5: 736aeec22f9f116fef7e86af5219c815<br/>sha256: e8f093130ad3704b7ad91f547142e64f7a12d717fb6f894acdeffc45e30f974f|
|[Windows 64](../../releases/download/nanoMIPS-2022.11-01/MediaTek.GNU.Tools.2022.11-01.for.nanoMIPS.Linux.Windows.x86_64.tgz) (.tgz)|[183M]|md5: 5eccbda333e3b65f5878ae54906c8560<br/>sha256: 6d6d3fecc95a38363a0b1b5060863274031dc2e07742f5f6b23bc57b073c0710|
|[Linux x86](../../releases/download/nanoMIPS-2022.11-01/MediaTek.GNU.Tools.2022.11-01.for.nanoMIPS.Linux.CentOS-6.x86.tgz) (.tgz)|[210M]|md5: 65c7ffdbc06d87c65d785fea62c58918<br/>sha256: be33d29ae029f9ccb25123e7b68883d61d2412c9202badb6a4d8beb8ad121a86|
|[Windows x86](../../releases/download/nanoMIPS-2022.11-01/MediaTek.GNU.Tools.2022.11-01.for.nanoMIPS.Linux.Windows.x86.tgz) (.tgz)|[178M]|md5: 94d5ad5bb88d4fe12c69beceb9cdff5d<br/>sha256: ad643b886a1804260942e983b3c4226f819e03d6d80ea93336dfe9022d5ea9bd|


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2022.11-01.src.tgz](../../releases/download/nanoMIPS-2022.11-01/binutils-2022.11-01.src.tgz)|[51M]|md5: 70be67e5acfed97224e4d64ac717735c<br/>sha256: 9ceb4bf978f985254c6931dc565c23a19dbc366a0fde61b4739be3cd08ce1668|
|[gdb-2022.11-01.src.tgz](../../releases/download/nanoMIPS-2022.11-01/gdb-2022.11-01.src.tgz)|[51M]|md5: aac2d6e2f5298d1aaaba0bccac7bcc0c<br/>sha256: b2444f45563233bd563d7f50b26066df028a3b3d9b6fd2899d89189b23684748|
|[gold-2022.11-01.src.tgz](../../releases/download/nanoMIPS-2022.11-01/gold-2022.11-01.src.tgz)|[52M]|md5: 268d5118a8aaa377682b0330c97112b7<br/>sha256: 92d20a30ac0bf8bf771ed038acb90290b1e5f8a162d5ee8cf3775f1a8731cd2d|
|[newlib-2022.11-01.src.tgz](../../releases/download/nanoMIPS-2022.11-01/newlib-2022.11-01.src.tgz)|[21M]|md5: e6a6f0d5a148443ac455402fd9567aa8<br/>sha256: 0446d4135b7fd050fee56c0b85d18b02a21f83f195bf6099f5347eb1ef61d46e|
|[gcc-2022.11-01.src.tgz](../../releases/download/nanoMIPS-2022.11-01/gcc-2022.11-01.src.tgz)|[119M]|md5: 146ce77dded586cc3404887e4e5db05f<br/>sha256: 6420a5e87ad45f21051909b3f9c7974b318a92fed7d1abe0fb9eb08cd1d4b5d9|
|[smallclib-2022.11-01.src.tgz](../../releases/download/nanoMIPS-2022.11-01/smallclib-2022.11-01.src.tgz)|[1M]|md5: a4de77087753978d0f98d59e1a37ba7c<br/>sha256: 841b0e201239caf0641d71a26156b22db1398644e81e315dd12f7c9f5925511c|
|[qemu-2022.11-01.src.tgz](../../releases/download/nanoMIPS-2022.11-01/qemu-2022.11-01.src.tgz)|[90M]|md5: 6703b48d688ceafdc6d23b3bfaa22cd6<br/>sha256: 1b71395e470b68cd21e8118a9d3187d306a87c063c3b5891c75a554df61a87ba|
|[musl-2022.11-01.src.tgz](../../releases/download/nanoMIPS-2022.11-01/musl-2022.11-01.src.tgz)|[1M]|md5: 764aa41d3a30c5f0488870a8817a7b29<br/>sha256: fb1746249be8fb41333c638b780aacd5dc68b8ef1b43fc24a5333893c744a42d|
|[packages-2022.11-01.src.tgz](../../releases/download/nanoMIPS-2022.11-01/packages-2022.11-01.src.tgz)|[192M]|md5: b1ec31027e18b464af71c52fab8133b0<br/>sha256: dde0789bd56cb7c46054149a5f0e77d07bdb5333f030dd4622bf25ee1de7c86f|
|[python-2022.11-01.src.tgz](../../releases/download/nanoMIPS-2022.11-01/python-2022.11-01.src.tgz)|[22M]|md5: c8cf068f6534f8a1c33dad12b96128e8<br/>sha256: bcb302821efc57832493fd84f5bee350ee3eae3d05d000c6e198ef186c297daf|


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
