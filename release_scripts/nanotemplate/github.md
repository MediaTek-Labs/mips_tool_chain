# [![MTK Logo](https://cdn-www.mediatek.com/icons/mtklogo.svg)](https://www.mediatek.com) &nbsp;&nbsp; nanoMIPS GNU toolchain v2021.07-01-alpha-4
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Published on August 01, 2021

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

* Fix for incorrect branch targets in assembler output due to relocation minimizing pass ( CR MOLY00690538, MOLY00690538). This problem can also be worked around by adding *-Wa,-mmnimize-relocs* to compiler flags.

* Fix incorrect exception-handling information in assembler due to linker relaxation.

* Fix internal error in linker due to output sections declared in linker script without any input sections.

* Fix %a translation for formatted output functions.


#### Other Changes

* None.


#### Known issues

<li>Jump-table optimization (compiler option *-f[no]-jumptable-opt*) is implicitly dependent recoc-minimization (assembler option *-mminimize-relocs*). If reloc-minimization is disabled, then jump-table optimizaiton must be disabled too.</li>

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
|[Linux x64](../../releases/download/nanoMIPS-2021.07-01-alpha-4/MediaTek.GNU.Tools.2021.07-01-alpha-4.for.nanoMIPS.Bare.Metal.CentOS-6.x86_64.tar.gz) (.tar.gz)|[118M]|md5: 2bd381b0dd36a852c8794ad664efb391<br/>sha256: a6616e14bb3daafaabad52c55526b4a4b3c9b7b9f225c854319832d6bbf6e373|
|[Windows 64](../../releases/download/nanoMIPS-2021.07-01-alpha-4/MediaTek.GNU.Tools.2021.07-01-alpha-4.for.nanoMIPS.Bare.Metal.Windows.x86_64.tar.gz) (.tar.gz)|[0M]|md5: d41d8cd98f00b204e9800998ecf8427e<br/>sha256: e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855|
|[Linux x86](../../releases/download/nanoMIPS-2021.07-01-alpha-4/MediaTek.GNU.Tools.2021.07-01-alpha-4.for.nanoMIPS.Bare.Metal.CentOS-6.x86.tar.gz) (.tar.gz)|[0M]|md5: d41d8cd98f00b204e9800998ecf8427e<br/>sha256: e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855|
|[Windows x86](../../releases/download/nanoMIPS-2021.07-01-alpha-4/MediaTek.GNU.Tools.2021.07-01-alpha-4.for.nanoMIPS.Bare.Metal.Windows.x86.tar.gz) (.tar.gz)|[0M]|md5: d41d8cd98f00b204e9800998ecf8427e<br/>sha256: e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855|
 |**MUSL/Linux Toolchain**|||
|[Linux x64](../../releases/download/nanoMIPS-2021.07-01-alpha-4/MediaTek.GNU.Tools.2021.07-01-alpha-4.for.nanoMIPS.Linux.CentOS-6.x86_64.tar.gz) (.tar.gz)|[129M]|md5: fcd57e39390613abcb5b4bc916a6e9c8<br/>sha256: 9b6d4c6d350069c0042c0bc9bb72ce963bccee11ed40a981cfc485d108054dc2|
|[Windows 64](../../releases/download/nanoMIPS-2021.07-01-alpha-4/MediaTek.GNU.Tools.2021.07-01-alpha-4.for.nanoMIPS.Linux.Windows.x86_64.tar.gz) (.tar.gz)|[0M]|md5: d41d8cd98f00b204e9800998ecf8427e<br/>sha256: e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855|
|[Linux x86](../../releases/download/nanoMIPS-2021.07-01-alpha-4/MediaTek.GNU.Tools.2021.07-01-alpha-4.for.nanoMIPS.Linux.CentOS-6.x86.tar.gz) (.tar.gz)|[0M]|md5: d41d8cd98f00b204e9800998ecf8427e<br/>sha256: e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855|
|[Windows x86](../../releases/download/nanoMIPS-2021.07-01-alpha-4/MediaTek.GNU.Tools.2021.07-01-alpha-4.for.nanoMIPS.Linux.Windows.x86.tar.gz) (.tar.gz)|[0M]|md5: d41d8cd98f00b204e9800998ecf8427e<br/>sha256: e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855|


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2021.07-01-alpha-4.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-4/binutils-2021.07-01-alpha-4.src.tar.gz)|[51M]|md5: 8d6a928bec0d4181b1e36ac5a271dfdf<br/>sha256: 5ebeb4799189a48940905e85e3dbaf3f3fb0947515992d3850d22e0d37130832|
|[gdb-2021.07-01-alpha-4.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-4/gdb-2021.07-01-alpha-4.src.tar.gz)|[51M]|md5: 3472168384bf948b5f128d0b77ae8a7c<br/>sha256: dc7ff7ac92eda0991cb685bc728f7d1458815ca356ffa4a60e57723dc50091d1|
|[gold-2021.07-01-alpha-4.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-4/gold-2021.07-01-alpha-4.src.tar.gz)|[52M]|md5: 4f89db3917c3929b6fbf3b078e7e0461<br/>sha256: e94f877488a42ebf2627464d644b9b1c65e03e8bddf95d0a66c7455d9aa2abc4|
|[newlib-2021.07-01-alpha-4.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-4/newlib-2021.07-01-alpha-4.src.tar.gz)|[19M]|md5: 3a431f2d2e025e5aaf148daef4e0ff6c<br/>sha256: d309ca8e8230e977a6955d6781080a29cb13ee0f41332f47ab575b33b9a4424f|
|[gcc-2021.07-01-alpha-4.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-4/gcc-2021.07-01-alpha-4.src.tar.gz)|[112M]|md5: e7c7cc0c4a826c28d2e4b075ca2b31fe<br/>sha256: 3618da934b5bbb56eb575a22658e44f8602ded049b4a70987fe3897bd7c6c88e|
|[smallclib-2021.07-01-alpha-4.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-4/smallclib-2021.07-01-alpha-4.src.tar.gz)|[1M]|md5: 75683e1051daca0c04dd9f5c8d019c9d<br/>sha256: 3bc8eaff6df658a86a95d6208cb5407457e2f32e954ecb3ad56acbb6ea9b8295|
|[qemu-2021.07-01-alpha-4.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-4/qemu-2021.07-01-alpha-4.src.tar.gz)|[11M]|md5: 99ecf545d47e9eb67066d3fb9284de12<br/>sha256: dd136ed91434762cb01ec30279e294198c1391514a3450c28c4e726e961e846f|
|[musl-2021.07-01-alpha-4.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-4/musl-2021.07-01-alpha-4.src.tar.gz)|[1M]|md5: 885f1f68d327b31e21001352c60591d7<br/>sha256: 32f4d7c2e10a6231e50bee6deb7692bb5d7c9216ad67306bdf7b86159244530c|
|[packages-2021.07-01-alpha-4.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-4/packages-2021.07-01-alpha-4.src.tar.gz)|[189M]|md5: 5f0b676a85af4c6d552912d7e4053414<br/>sha256: 5875a99f47a021cf5ca8302d653ca7ae56d2936c99a7315760e4ccda2f8130b8|
|[python-2021.07-01-alpha-4.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-4/python-2021.07-01-alpha-4.src.tar.gz)|[16M]|md5: bd0bc5a82c52785b662fe7e9f2b6241e<br/>sha256: 85a214f2c70c04e9af78b1f6f0e9a3e97729baf065070a66f786759b7010d488|


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
