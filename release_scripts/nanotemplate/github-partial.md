# [![MTK Logo](https://cdn-www.mediatek.com/icons/mtklogo.svg)](https://www.mediatek.com) &nbsp;&nbsp; nanoMIPS GNU toolchain v2025.09-02
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Published on November 18, 2025

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
* Fix crash in gold due to placement of sections groups containing the same section name [Bug 174]
* Fix mapping of DSP prepend instruction to EXTW - broken since v2024.11-01. There is a typo in the nanoMIPS DSP TRM v0.04. The toolchain now provides the correct mapping, but is inconsistent with the published TRM.
* Fix qemu emulation of MTHLIP instruction for accumulators $ac1,$ac2,$ac3 [Bug 169]
* Fix qemu emulation of BPOSGE32C instruction with -ve offsets [Bug 170]

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
|[Linux x64](../../releases/download/nanoMIPS-2025.09-02/MediaTek.GNU.Tools.2025.09-02.nanomips-elf_x86_64-pc-linux-gnu.tgz) (.tgz)|[183M]|md5: 40c9b5b50b1037440c73857c8fa4b470<br/>sha256: 6664aa9812afe5872132844e2dae625a3c6a28d0dc37d184020a1e70cedb0d38|


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2025.09-02.src.tgz](../../releases/download/nanoMIPS-2025.09-02/binutils-2025.09-02.src.tgz)|[51M]|md5: 12cdb0b6dfc62ecd34193e8abff555f8<br/>sha256: c550fd88e9cd7b44187e4cda0c599c83f7eeeeedf183ffada5d318f536bac8e1|
|[gdb-2025.09-02.src.tgz](../../releases/download/nanoMIPS-2025.09-02/gdb-2025.09-02.src.tgz)|[51M]|md5: 8f0539ff6af6443e4fd6810023081cac<br/>sha256: 72c0176464037c9ea07594e8f2f43a01084763b3d8ab586eb273e3e37815e742|
|[gold-2025.09-02.src.tgz](../../releases/download/nanoMIPS-2025.09-02/gold-2025.09-02.src.tgz)|[52M]|md5: d41f0604759016d368c6550652a23754<br/>sha256: 6b57a2d9a0d7b79ec115ce44c72cedb55a92cfb5a12bfe74447f82e75d2b43cb|
|[newlib-2025.09-02.src.tgz](../../releases/download/nanoMIPS-2025.09-02/newlib-2025.09-02.src.tgz)|[21M]|md5: 0a9413b3e0396c0c053304a9da7bc5b1<br/>sha256: 3e980a2fb82ca9e2f0add55b9e42a8d74ae44e13a538d08a7e32556c7c5950d2|
|[gcc-2025.09-02.src.tgz](../../releases/download/nanoMIPS-2025.09-02/gcc-2025.09-02.src.tgz)|[119M]|md5: c9486540af9fb692ef58d0c5d00da3e0<br/>sha256: f125770a59da69f1f32849a6f5587293e3b364d3ba97a0daa123b09356b580d2|
|[smallclib-2025.09-02.src.tgz](../../releases/download/nanoMIPS-2025.09-02/smallclib-2025.09-02.src.tgz)|[1M]|md5: 9fa19ba102557ca10af4af2e03cee757<br/>sha256: 73fe092b0163aaf82afa48d2922416d7f10886c421109865148e0f0adb264b1e|
|[qemu-2025.09-02.src.tgz](../../releases/download/nanoMIPS-2025.09-02/qemu-2025.09-02.src.tgz)|[90M]|md5: 328581484749c7dd2c70ad70bed0fd81<br/>sha256: d82e891dd2237a44c0cc557bb5dcbcc49dcfe69039c072c6d7c8d9d6dab19a16|
|[packages-2025.09-02.src.tgz](../../releases/download/nanoMIPS-2025.09-02/packages-2025.09-02.src.tgz)|[192M]|md5: 4975afdee39c3dbd5dfa77fe817a9398<br/>sha256: 625469d7a13434f99fed00024c3def7e1579cab57a2ed792812d74b11f3c53ff|
|[python-2025.09-02.src.tgz](../../releases/download/nanoMIPS-2025.09-02/python-2025.09-02.src.tgz)|[22M]|md5: 5191bbb462b19da53c68d2a5dfbed30c<br/>sha256: a9e6e414832e17e21f22603080a3537305cbef069cb95b21bd4b797ed57094ca|


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
