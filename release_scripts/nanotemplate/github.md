# [![MTK Logo](https://cdn-www.mediatek.com/icons/mtklogo.svg)](https://www.mediatek.com) &nbsp;&nbsp; nanoMIPS GNU toolchain v2024.07-02
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Published on August 28, 2024

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
* Provide dummy interfaces for floating point (fenv/cfenv) headers. Thor/nanoMIPS processor does not have hardware floating point capability. The library support provides is just sufficient to satisfy compile/link requirements for projects that refer to the interface.


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
|[Linux x64](../../releases/download/nanoMIPS-2024.07-02/MediaTek.GNU.Tools.2024.07-02.for.nanoMIPS.Bare.Metal.CentOS-6.x86_64.tgz) (.tgz)|[156M]|md5: cef4a004eb27de3cdc92b62b17c8665c<br/>sha256: c6b0b53b4807ad0b72827f3e5be2aeb012cbec91ee4ca8f07c5d75eacb0443e2|
 |**MUSL/Linux Toolchain**|||


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2024.07-02.src.tgz](../../releases/download/nanoMIPS-2024.07-02/binutils-2024.07-02.src.tgz)|[53M]|md5: 6688ae14f20bcc408a6f7876ff55030e<br/>sha256: 0f4156530642462ff69283eefd61b8912b6879611ffc991513a61d4d8531d828|
|[gdb-2024.07-02.src.tgz](../../releases/download/nanoMIPS-2024.07-02/gdb-2024.07-02.src.tgz)|[52M]|md5: b6b535320bea76757624d64b5fb553fd<br/>sha256: 7d848df549cd77925100ea463014df9f4300be81cf11c4ccceaf3ac1fbc76b52|
|[gold-2024.07-02.src.tgz](../../releases/download/nanoMIPS-2024.07-02/gold-2024.07-02.src.tgz)|[54M]|md5: 5f26d3c5dbf4b22f28181e3b88471951<br/>sha256: a4330d1a2284dfd1b74e2b51d3fdb9b629c7d9d8386dbf06c7d55193a91dc231|
|[newlib-2024.07-02.src.tgz](../../releases/download/nanoMIPS-2024.07-02/newlib-2024.07-02.src.tgz)|[20M]|md5: a3fc02c828b54eecd6fc93a4188c74db<br/>sha256: eff32c1a3eca3bb29101e9dd76a509df07115a5ecb021d49004080a0f0d9239e|
|[gcc-2024.07-02.src.tgz](../../releases/download/nanoMIPS-2024.07-02/gcc-2024.07-02.src.tgz)|[125M]|md5: 0a04c83ea3b307ed5690cd5db840a6da<br/>sha256: 82a36166151c03660cd321ecfe202fe8939bde03a0ce827438efd6e823ec0ff3|
|[smallclib-2024.07-02.src.tgz](../../releases/download/nanoMIPS-2024.07-02/smallclib-2024.07-02.src.tgz)|[1M]|md5: d6e233f37bd9185a91647e5e95fbb487<br/>sha256: bdb068f911075e9d13033aaabe3cf9997a957936dd6c41b91da97212ec1f5fa6|
|[qemu-2024.07-02.src.tgz](../../releases/download/nanoMIPS-2024.07-02/qemu-2024.07-02.src.tgz)|[90M]|md5: ca75037b3ffcb2316f3b0dac6b5d48d4<br/>sha256: 68e2e9f031149b0880fa6b78f594a88950d9038a4ebf6b8f34812be452424f8e|
|[musl-2024.07-02.src.tgz](../../releases/download/nanoMIPS-2024.07-02/musl-2024.07-02.src.tgz)|[1M]|md5: 150a0867c52ec68b87631e9473a13847<br/>sha256: 800b7b653a7aa7d77df828ebf85cd4d1b8acbdcfd990c12416d94a21888b2087|
|[packages-2024.07-02.src.tgz](../../releases/download/nanoMIPS-2024.07-02/packages-2024.07-02.src.tgz)|[192M]|md5: fbb919ed81766b5fc12e3da9c0228dd7<br/>sha256: edc0e3b24cbd480144bda356b3c593532ba98fc5690c3ffcc2b0effd13716f9c|
|[python-2024.07-02.src.tgz](../../releases/download/nanoMIPS-2024.07-02/python-2024.07-02.src.tgz)|[22M]|md5: 457dddfcae2a08e7b346db3289d576f8<br/>sha256: 168a676797a6750df556739c40bc91efbd97b9a5db9e251f3b62e6cc1d6e7c82|


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
