# [![MTK Logo](https://cdn-www.mediatek.com/icons/mtklogo.svg)](https://www.mediatek.com) &nbsp;&nbsp; nanoMIPS GNU toolchain v2025.04-01
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Published on May 14, 2025

* [Introduction](#introduction)
* [Release Notes](#release-notes)
* [Documentation](#documentation)
* [Component Versions](#component-versions)
* [Downloads](#downloads)
* [Bug Reporting](#bug-reporting)
* [License Agreements](#license-agreements)

<div id="introduction"></div>

## Introduction

The nanoMIPS Toolchain includes example code, source code, and documentation to facilitate development of bare metal applications on nanoMIPS simulators and development boards.  This is not a fully functional toolchain. These toolchains provide GNU components (assembler, linkers, libraries and utilities) that can be couple with clang/LLVM for building applications to run on nanoMIPS cores.

#### Component	Description

* GNU Bare Metal Toolchain <br/>&nbsp;&nbsp; This is a software engineer's cross-development system for nanoMIPS processors, intended for statically linked embedded applications running on bare metal CPUs or light-weight operating systems.

<div id="release-notes"></div>

## Release Notes
#### New Features

#### Bug Fixes
* Fix linker crash due to BPOSGE32C relaxation
* Fix GDBsim crash when executing SCWP instruction 

#### Other Changes
  
#### Known issues


<div id="documentation"></div>

## Documentation
**Note** These are external links to documents by MIPS Tech

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
|[Linux x64](../../releases/download/nanoMIPS-2025.04-01/MediaTek.GNU.Tools.2025.04-01.nanomips-elf_x86_64-pc-linux-gnu.tgz) (.tgz)|[183M]|md5: 82f1f6382b9014728aa4be760f932322<br/>sha256: dc86a0a975c0d9cd8f6ac548153f72a8bb6b2a4cb6549c255277c2f7aaad8d74|


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2025.04-01.src.tgz](../../releases/download/nanoMIPS-2025.04-01/binutils-2025.04-01.src.tgz)|[51M]|md5: b88b4e19ff8489750006c7837f255a2b<br/>sha256: c5662c4140be2b54a796f26ba9e125cd57e281fdda356bad8e7790d4875a5939|
|[gdb-2025.04-01.src.tgz](../../releases/download/nanoMIPS-2025.04-01/gdb-2025.04-01.src.tgz)|[51M]|md5: d9f24dfc8d0a0c620805bad7765905ee<br/>sha256: 33fa5784b426639936df1cd68ef263173780571abcf0bd00cfaebf7f9658510a|
|[gold-2025.04-01.src.tgz](../../releases/download/nanoMIPS-2025.04-01/gold-2025.04-01.src.tgz)|[52M]|md5: 074a9b0ef38aceaca884414454b10c11<br/>sha256: c647da08b6820c0393a5b11f5d209ac55a39ae894361f1d27ef8eaabe5bfc87d|
|[newlib-2025.04-01.src.tgz](../../releases/download/nanoMIPS-2025.04-01/newlib-2025.04-01.src.tgz)|[21M]|md5: aca79edfb3775a2e16537cd763bd7be3<br/>sha256: cee93c66f11e6d54695c7c02429f29900d08bcc12280831bee8b491e399eaab2|
|[gcc-2025.04-01.src.tgz](../../releases/download/nanoMIPS-2025.04-01/gcc-2025.04-01.src.tgz)|[119M]|md5: 1a5d8a3614979a2d0221a46f981c9982<br/>sha256: 4211207c031407aaefef333409c2e60871607c2c345b367dc0b1903156f6f96c|
|[smallclib-2025.04-01.src.tgz](../../releases/download/nanoMIPS-2025.04-01/smallclib-2025.04-01.src.tgz)|[1M]|md5: 1e99d493017e9fecfa93758fa722ff81<br/>sha256: e41dda4fea3b7498c02f6fea8954a88b283d97bccb2011635605ac731f583ebe|
|[qemu-2025.04-01.src.tgz](../../releases/download/nanoMIPS-2025.04-01/qemu-2025.04-01.src.tgz)|[90M]|md5: 86d950f4e2a1fc8644e1d4007d4a5e19<br/>sha256: 48af1624ce3190e4af3195a72e962dbaaf056b08c45e97bc28a822d1d5d77533|
|[packages-2025.04-01.src.tgz](../../releases/download/nanoMIPS-2025.04-01/packages-2025.04-01.src.tgz)|[192M]|md5: 93b6177dd74749df0a4b770ef4a8d9cc<br/>sha256: 2210ed7e1c8087cb848dc257e963e157912ec4acb3a2e22a0a92965967cc55ae|
|[python-2025.04-01.src.tgz](../../releases/download/nanoMIPS-2025.04-01/python-2025.04-01.src.tgz)|[22M]|md5: 1e867602fb5af18a0d33fba1a2cca568<br/>sha256: 4d1470915ff848c4518ea4d9d9e348215e164d8d5903e16e8131f8aebd9fac87|


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
* MIT / BSD style Licenses - Newlib, smallclib, tinyclib, libgloss/MIPS HAL, libffi, expat, ncurses
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
COPYING.CLIB
