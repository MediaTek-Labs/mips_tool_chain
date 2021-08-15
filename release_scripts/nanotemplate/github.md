# [![MTK Logo](https://cdn-www.mediatek.com/icons/mtklogo.svg)](https://www.mediatek.com) &nbsp;&nbsp; nanoMIPS GNU toolchain v2021.07-01
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Published on August 06, 2021

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
* Add variation of memcpy (*__aligned_memcpy_no_prefetch*) for **4-byte aligned pointers** and sizes. This does not perform any validation on alignment of the input parameters.  It must be explicitly invoked via a source code change where alignment is known. Behavior will be unpredictable if invoked for misaligned pointers or sizes. It also does not prefetch and is intended for sizes of **128 bytes** or less. For larger sizes the standard memcpy is typically faster due to prefetch.

#### Bug Fixes
* Fix for incorrect branch targets in assembler output due to minimize relocations pass ( **CR MOLY00690538**, **MOLY00690538**).
* Decouple the minimize relocations pass from jump-table optimization. Previously disabling minimize relocations would inhibit jump-table relaxations and could cause link failures if jump vectors overflow their estimated address range due to linker relaxation. The historic behavior can be restored with the new assembler option *-mlegacy-minimize-relocs-behavior*.
* Fix incorrect exception-handling information in assembler due to linker relaxation.
* Fix internal error in linker due to output sections declared in linker script without any input sections.
* Fix %a translation for formatted output functions.
* Fix buffer overrun in formatted output functions.

#### Other Changes

* The minimize relocations pass in the assembler is now disabled by default. It can be reenabled by the command-line option *-mminimize -relocs*.

#### Known issues

* None


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
|[Linux x64](../../releases/download/nanoMIPS-2021.07-01/MediaTek.GNU.Tools.2021.07-01.for.nanoMIPS.Bare.Metal.CentOS-6.x86_64.tar.gz) (.tar.gz)|[118M]|md5: cbfc12f1d15c532eee55d4a18711604a<br/>sha256: e7ea63e8071ae7cd6d53f047d93f4288c6f4b00a36242c60b8d7b5863c566344|
|[Windows 64](../../releases/download/nanoMIPS-2021.07-01/MediaTek.GNU.Tools.2021.07-01.for.nanoMIPS.Bare.Metal.Windows.x86_64.tar.gz) (.tar.gz)|[94M]|md5: 0c095293745f6bb4521103c107a1db9f<br/>sha256: 34d000a74765d71d7a3d7acb6519565d060c67d5d462cc20f0cc519781710217|
|[Linux x86](../../releases/download/nanoMIPS-2021.07-01/MediaTek.GNU.Tools.2021.07-01.for.nanoMIPS.Bare.Metal.CentOS-6.x86.tar.gz) (.tar.gz)|[121M]|md5: ae869d416e653569cdf0da926c89bba9<br/>sha256: 92fd06ef34ca2e798abeb853c35347518deeaf8893191bcf6a4254b128731eff|
|[Windows x86](../../releases/download/nanoMIPS-2021.07-01/MediaTek.GNU.Tools.2021.07-01.for.nanoMIPS.Bare.Metal.Windows.x86.tar.gz) (.tar.gz)|[91M]|md5: d981aee964624c1f8a57352ba1064da4<br/>sha256: 879089b1969fe53dc04b030813683b40c5ad61fc9aee7e8e21df979b3ee6bb37|
 |**MUSL/Linux Toolchain**|||
|[Linux x64](../../releases/download/nanoMIPS-2021.07-01/MediaTek.GNU.Tools.2021.07-01.for.nanoMIPS.Linux.CentOS-6.x86_64.tar.gz) (.tar.gz)|[129M]|md5: dad69f7ffb39d45b75d9f7948fdda026<br/>sha256: 390a4c04136ae7890bcb74f51ed8c1c55a6a3f812d4ec2c7b77aff78f4718891|
|[Windows 64](../../releases/download/nanoMIPS-2021.07-01/MediaTek.GNU.Tools.2021.07-01.for.nanoMIPS.Linux.Windows.x86_64.tar.gz) (.tar.gz)|[109M]|md5: bf34c08081787448c0eeb6440685883a<br/>sha256: 0bcb531710e50ddc860980dcdd2bf3f0fee3fb52a7eb9384b8e22d59dea21234|
|[Linux x86](../../releases/download/nanoMIPS-2021.07-01/MediaTek.GNU.Tools.2021.07-01.for.nanoMIPS.Linux.CentOS-6.x86.tar.gz) (.tar.gz)|[130M]|md5: 333203e4847504131ccba0a705084ff4<br/>sha256: e00d7de14040671ac62f47fb7faccb64eccbc0f420fe050e939812a05788a2d2|
|[Windows x86](../../releases/download/nanoMIPS-2021.07-01/MediaTek.GNU.Tools.2021.07-01.for.nanoMIPS.Linux.Windows.x86.tar.gz) (.tar.gz)|[106M]|md5: 83cc14af130f9eb941074fdc22300d7b<br/>sha256: cb55fb6733d194f4c62beaffa2f7010fe8556e1bcfe0d462de35a21bf0e61150|


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2021.07-01.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01/binutils-2021.07-01.src.tar.gz)|[51M]|md5: 490a29bd604af80b7465a58121682947<br/>sha256: 629fce274ab436870b678211134cf6ea25e9b1ac10244c041d260039ef9c0ff7|
|[gdb-2021.07-01.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01/gdb-2021.07-01.src.tar.gz)|[51M]|md5: 8b34265b92a25b05aa521dc482f1b995<br/>sha256: 1aa1715ce14ea0946e2299c082f9795565b9535a42ea2874d272d4a9f4617e13|
|[gold-2021.07-01.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01/gold-2021.07-01.src.tar.gz)|[52M]|md5: de69057cebd27d5806cce5d9746075f6<br/>sha256: c867f30946072623f85dc848f940bf8451ea3c3fad83c3ee92b707282329c8c4|
|[newlib-2021.07-01.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01/newlib-2021.07-01.src.tar.gz)|[19M]|md5: 850fee1d032b31e9cdbf769fb8562196<br/>sha256: 70d5a4e7d0756261449a979ec47e5f9f00c3f676e2df02545328bb0412870bcd|
|[gcc-2021.07-01.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01/gcc-2021.07-01.src.tar.gz)|[112M]|md5: af3c728d5493e1d55b93af68a03433f8<br/>sha256: 615b84c995c890816bf3e10a05dd441e16e4cd3e4d4d42bea01044b99ebef449|
|[smallclib-2021.07-01.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01/smallclib-2021.07-01.src.tar.gz)|[1M]|md5: 70f972f165a870d1019fcdff5416b3e3<br/>sha256: 60cc8d806dee2fec3a6be4d4dd23a8ba79cd2b01472f3e90f3f17b78b0b490df|
|[qemu-2021.07-01.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01/qemu-2021.07-01.src.tar.gz)|[11M]|md5: c8be0b015ff0b244de6f77bfaa9fa5d3<br/>sha256: 6527e08ff71ea2062a446c816c078e9cffdd003890c313324caa922ed3db8e42|
|[musl-2021.07-01.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01/musl-2021.07-01.src.tar.gz)|[1M]|md5: 09691dbd52a909451769c81e521f4319<br/>sha256: 3b91340d7b71ae8b5251eb5001adaa6efc9cba2b810347478dde96b168664363|
|[packages-2021.07-01.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01/packages-2021.07-01.src.tar.gz)|[189M]|md5: 868a3c757312d89fb8b27c9027031915<br/>sha256: 24d489b586bc2edc85eee4b35924eb7cc0d1d3d0cf5af006870aff07d53afb4d|
|[python-2021.07-01.src.tar.gz](../../releases/download/nanoMIPS-2021.07-01/python-2021.07-01.src.tar.gz)|[16M]|md5: 26bc70e2a09ba21e04a1137e4ca68579<br/>sha256: fb1fec7a6769e7d95c88a2be7235a9ce4b3514ff29bb98b668bdc916125444a8|


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
