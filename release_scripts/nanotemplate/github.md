# [![MTK Logo](https://cdn-www.mediatek.com/icons/mtklogo.svg)](https://www.mediatek.com) &nbsp;&nbsp; nanoMIPS GNU toolchain v2021.04-01
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Published on April 30, 2021

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

* Add option _-flto-preserve-object-names_  to re-map temporary LTO object names back to original object names at link time. When this option is used, original object names can be matched directly in linker scripts. The linker map file output shows original object names as if generated without LTO.

* Improve use of *'INS'* instruction in situations where bitfield manipulation is expressed in source code using shifts and masks. This should yield improvements in code size and execution speed.

#### Bug Fixes

 * None.

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
|[Linux x86](../../releases/download/nanoMIPS-2021.04-01/MediaTek.GNU.Tools.2021.04-01.for.nanoMIPS.Bare.Metal.CentOS-6.x86.tar.gz) (.tar.gz)|[120M]|md5: 9b3d21c1d93e1a98c05cd20c6268c94f<br/>sha256: 733c35770377bef07843120439c7348041ccbcfcba741c32823cb0851b3e7423|
|[Windows x86](../../releases/download/nanoMIPS-2021.04-01/MediaTek.GNU.Tools.2021.04-01.for.nanoMIPS.Bare.Metal.Windows.x86.tar.gz) (.tar.gz)|[90M]|md5: 37628af41bb8ab4fabd1f09d8b6dcde7<br/>sha256: 714ebe6dbd345a4c3e6f2a08d5cafbfa435c7508c70b01d5fae3e449149d80b8|
|[Linux x64](../../releases/download/nanoMIPS-2021.04-01/MediaTek.GNU.Tools.2021.04-01.for.nanoMIPS.Bare.Metal.CentOS-6.x86_64.tar.gz) (.tar.gz)|[118M]|md5: 14dcc60c3d2fcbc780881fd43c39c1c8<br/>sha256: ac164c0a660814b7ab1e5d6a1f0499ee15485db7ffb97bfd12a0f6c3b587a214|
|[Windows 64](../../releases/download/nanoMIPS-2021.04-01/MediaTek.GNU.Tools.2021.04-01.for.nanoMIPS.Bare.Metal.Windows.x86_64.tar.gz) (.tar.gz)|[93M]|md5: 0c8863bc5202e69ac93bf785d8ffc8b0<br/>sha256: 8685ad8c2955b49971185ce051f8b399592c8abb4e856a4e187c8de97b8014ef|
 |**MUSL/Linux Toolchain**|||
|[Linux x86](../../releases/download/nanoMIPS-2021.04-01/MediaTek.GNU.Tools.2021.04-01.for.nanoMIPS.Linux.CentOS-6.x86.tar.gz) (.tar.gz)|[130M]|md5: 03fcfdbd23bf28ca48d875860db88534<br/>sha256: 2ef6706d935f52346565285920738b09b8100f6bc0ea9c9d9fb1269fc20913a4|
|[Windows x86](../../releases/download/nanoMIPS-2021.04-01/MediaTek.GNU.Tools.2021.04-01.for.nanoMIPS.Linux.Windows.x86.tar.gz) (.tar.gz)|[106M]|md5: 39cedbb5a85d1a6ef04470e2b7e52350<br/>sha256: 0c05db1b44ed79736ab1c8650f233d0f9dea0ae69338e844042f1078dd3a09df|
|[Linux x64](../../releases/download/nanoMIPS-2021.04-01/MediaTek.GNU.Tools.2021.04-01.for.nanoMIPS.Linux.CentOS-6.x86_64.tar.gz) (.tar.gz)|[129M]|md5: cc757b3e6dfca46861c550dfdc424bea<br/>sha256: 4d8e6e703a2608ccdce49f60ba8a937607b75f9fcf84be640447ea25f15d5633|
|[Windows 64](../../releases/download/nanoMIPS-2021.04-01/MediaTek.GNU.Tools.2021.04-01.for.nanoMIPS.Linux.Windows.x86_64.tar.gz) (.tar.gz)|[109M]|md5: cdde83144e8362c9a5fa347acc64a5a3<br/>sha256: afe80c2cd86584b3cef63d76382b362aeca8f6902a31cd80298570c59eea93ac|


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2021.04-01.src.tar.gz](../../releases/download/nanoMIPS-2021.04-01/binutils-2021.04-01.src.tar.gz)|[51M]|md5: 727a95e35352084ff623d7d2dcf38613<br/>sha256: 352d5ae45e8a808716a1270540fb891d90657181411e85b417a0c16a2df922d5|
|[gdb-2021.04-01.src.tar.gz](../../releases/download/nanoMIPS-2021.04-01/gdb-2021.04-01.src.tar.gz)|[51M]|md5: 7b844ff5cea3837d55a9e4dc11264db7<br/>sha256: ca736d4d5b436bb81d1c30f61aafd775b1edfff44663414abb00ffdc3449f54c|
|[gold-2021.04-01.src.tar.gz](../../releases/download/nanoMIPS-2021.04-01/gold-2021.04-01.src.tar.gz)|[52M]|md5: 3530007f429349dc369405f0fb050bb2<br/>sha256: 321ffa51307a2c0b844d1b736a87d2cdb6f98828e596ed3691fbe14653ced2c9|
|[newlib-2021.04-01.src.tar.gz](../../releases/download/nanoMIPS-2021.04-01/newlib-2021.04-01.src.tar.gz)|[19M]|md5: ec056564b50caf18480d0582f38f35f3<br/>sha256: bd0192da387ea729ab90eb2962fe02c6d6eef0c959d65bd9ebf55000ecaec2a2|
|[gcc-2021.04-01.src.tar.gz](../../releases/download/nanoMIPS-2021.04-01/gcc-2021.04-01.src.tar.gz)|[112M]|md5: b0419a38d6ef1636b78726dee24f1655<br/>sha256: 999767c8a197a5d3ee5af0cf5e396b12421bea1e84fcae358c9a1b712204379c|
|[smallclib-2021.04-01.src.tar.gz](../../releases/download/nanoMIPS-2021.04-01/smallclib-2021.04-01.src.tar.gz)|[1M]|md5: fb547aba35a18ed444a3ef6777820a01<br/>sha256: abda1de99c4953dc0000a68114f568f54e7ce1d615dcaa1c4693c96ba82e333f|
|[qemu-2021.04-01.src.tar.gz](../../releases/download/nanoMIPS-2021.04-01/qemu-2021.04-01.src.tar.gz)|[11M]|md5: 9dce2d4762b5286a0482f918e4fd62ab<br/>sha256: 93af5f3bf2c6e4876ed79b844a9d5d84edb03f9e73436b7e656d1a100b513375|
|[musl-2021.04-01.src.tar.gz](../../releases/download/nanoMIPS-2021.04-01/musl-2021.04-01.src.tar.gz)|[1M]|md5: 934576f49ecb82d83e661ba595b400c3<br/>sha256: a37b8ec507b07cb8399a716de7d7b72978a8caba799804921ebee840cd8bedff|
|[packages-2021.04-01.src.tar.gz](../../releases/download/nanoMIPS-2021.04-01/packages-2021.04-01.src.tar.gz)|[189M]|md5: 5b8599cb7dfb2dd578d4862963c71fca<br/>sha256: fdf438ece3e17f5863931d820c54537b8d24f4b206e60eb548da20c3f10d50f4|
|[python-2021.04-01.src.tar.gz](../../releases/download/nanoMIPS-2021.04-01/python-2021.04-01.src.tar.gz)|[16M]|md5: 5ed2941dbabddd85c286107210530133<br/>sha256: fde02f3899dac8cb7d579c9cb8bd84c181b5c230c41b3786812082d6b74cd59e|


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
