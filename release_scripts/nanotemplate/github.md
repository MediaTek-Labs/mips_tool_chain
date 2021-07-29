# [![MTK Logo](https://cdn-www.mediatek.com/icons/mtklogo.svg)](https://www.mediatek.com) &nbsp;&nbsp; nanoMIPS GNU toolchain v2021.07-01-alpha-3
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Published on July 29, 2021

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

* Fix for incorrect branch targets in assembler output due to relocation minimizing pass ( CR MOLY00690538, MOLY00690538). This problem can also be worked around by adding -Wa,-mmnimize-relocs to compiler flags.

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
|[Linux x64](../../releases/download/nanoMIPS-2021.07-01-alpha-3/MediaTek.GNU.Tools.2021.07-01-alpha-3.for.nanoMIPS.Bare.Metal.CentOS-6.x86_64.tar.gz) (.tar.gz)|[118M]|md5: 4a8a31b5ca062b5117d1e6ff37ac5328<br/>sha256: bc61a0f2ba2c33364d1419c22c78b3df0a4124f7cd49486618e0812726979f39|
|[Windows 64](../../releases/download/nanoMIPS-2021.07-01-alpha-3/MediaTek.GNU.Tools.2021.07-01-alpha-3.for.nanoMIPS.Bare.Metal.Windows.x86_64.tar.gz) (.tar.gz)|[0M]|md5: d41d8cd98f00b204e9800998ecf8427e<br/>sha256: e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855|
|[Linux x86](../../releases/download/nanoMIPS-2021.07-01-alpha-3/MediaTek.GNU.Tools.2021.07-01-alpha-3.for.nanoMIPS.Bare.Metal.CentOS-6.x86.tar.gz) (.tar.gz)|[0M]|md5: d41d8cd98f00b204e9800998ecf8427e<br/>sha256: e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855|
|[Windows x86](../../releases/download/nanoMIPS-2021.07-01-alpha-3/MediaTek.GNU.Tools.2021.07-01-alpha-3.for.nanoMIPS.Bare.Metal.Windows.x86.tar.gz) (.tar.gz)|[0M]|md5: d41d8cd98f00b204e9800998ecf8427e<br/>sha256: e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855|
 |**MUSL/Linux Toolchain**|||
|[Linux x64](../../releases/download/nanoMIPS-2021.07-01-alpha-3/MediaTek.GNU.Tools.2021.07-01-alpha-3.for.nanoMIPS.Linux.CentOS-6.x86_64.tar.gz) (.tar.gz)|[129M]|md5: 7a86d045f82d2e93d5b0afb9ca49c82a<br/>sha256: 1deb917209dd607a925e4b8b959cf1ec3984cf3ae14ee063deb2d5b2f600b5f9|
|[Windows 64](../../releases/download/nanoMIPS-2021.07-01-alpha-3/MediaTek.GNU.Tools.2021.07-01-alpha-3.for.nanoMIPS.Linux.Windows.x86_64.tar.gz) (.tar.gz)|[0M]|md5: d41d8cd98f00b204e9800998ecf8427e<br/>sha256: e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855|
|[Linux x86](../../releases/download/nanoMIPS-2021.07-01-alpha-3/MediaTek.GNU.Tools.2021.07-01-alpha-3.for.nanoMIPS.Linux.CentOS-6.x86.tar.gz) (.tar.gz)|[0M]|md5: d41d8cd98f00b204e9800998ecf8427e<br/>sha256: e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855|
|[Windows x86](../../releases/download/nanoMIPS-2021.07-01-alpha-3/MediaTek.GNU.Tools.2021.07-01-alpha-3.for.nanoMIPS.Linux.Windows.x86.tar.gz) (.tar.gz)|[0M]|md5: d41d8cd98f00b204e9800998ecf8427e<br/>sha256: e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855|


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2021.07-01-alpha-3.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-3/binutils-2021.07-01-alpha-3.src.tar.gz)|[51M]|md5: ee5baad826bb9eecce3f8489f2eaa20c<br/>sha256: f9887681bad2b876c8ee5facec1c69d645886483d9b2098d8e25058315c774ca|
|[gdb-2021.07-01-alpha-3.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-3/gdb-2021.07-01-alpha-3.src.tar.gz)|[51M]|md5: ae7818e4050704fbd84afa2edf61c76a<br/>sha256: d8ace642d41f51772702099dec428eddf1e1e344f68def27528dedc5db116018|
|[gold-2021.07-01-alpha-3.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-3/gold-2021.07-01-alpha-3.src.tar.gz)|[52M]|md5: c406159ce9095c844de8649f5e4d9b32<br/>sha256: 18b76a006d471ef49acde16f12cb0376424e80a61938b9b49159a5b9832caabe|
|[newlib-2021.07-01-alpha-3.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-3/newlib-2021.07-01-alpha-3.src.tar.gz)|[19M]|md5: a78dff14e547b039f913334c09546b4f<br/>sha256: 8fcde0ccf71b97fd9bc80e3f13599c4631a4661604c1bba7efe21e49d1d72dca|
|[gcc-2021.07-01-alpha-3.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-3/gcc-2021.07-01-alpha-3.src.tar.gz)|[112M]|md5: 1c6999f608f5a3c13be19601e99d17c2<br/>sha256: 13a3c087c71671fa62d4f5873a45cf265e1cc90ba2596ce412bd377b8119eeb8|
|[smallclib-2021.07-01-alpha-3.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-3/smallclib-2021.07-01-alpha-3.src.tar.gz)|[1M]|md5: 9e87c782d41094126540817277674596<br/>sha256: 5840251143c3a573c2cccaf2d985061748d2f3c498cd01a8a0a1b5269b07ed96|
|[qemu-2021.07-01-alpha-3.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-3/qemu-2021.07-01-alpha-3.src.tar.gz)|[11M]|md5: 5338402ce51f1544ec544942de6be93a<br/>sha256: 2ba29d06c0764a84e9cdb61d1658bb450d9f2e3a2cb97ee31c29a1bdad594248|
|[musl-2021.07-01-alpha-3.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-3/musl-2021.07-01-alpha-3.src.tar.gz)|[1M]|md5: 7e96fbd2a6ece1e41a0e830bd2dee7aa<br/>sha256: b209a9936faa859940544c545acad284108ec23cb6a30344bbbf9b893d81a743|
|[packages-2021.07-01-alpha-3.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-3/packages-2021.07-01-alpha-3.src.tar.gz)|[189M]|md5: 11eb5cc4885f1fb707e578c5280ff07b<br/>sha256: a282767740570d1b3da6800de38a1d8fb56c3fc6f199c088003aecfb238693ce|
|[python-2021.07-01-alpha-3.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01-alpha-3/python-2021.07-01-alpha-3.src.tar.gz)|[16M]|md5: 82af420204d0aceff8ee1f02d6232073<br/>sha256: 44bdb3aa2871dfc47eb4cfc7cde927cb9b7baea66dbef29b55ef3ae5ca67e7ba|


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
