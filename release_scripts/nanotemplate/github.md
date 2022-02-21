# [![MTK Logo](https://cdn-www.mediatek.com/icons/mtklogo.svg)](https://www.mediatek.com) &nbsp;&nbsp; nanoMIPS GNU toolchain v2021.00-05-trial-1
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
* GNU assembler support for LWPI/SWPI/BITSUM/LOOP/LOOPI, nabled by the assembler command-line option `-march=thorv2`
* Compiler support for LWPI/SWPI/BITSUM, enabled by the assembler command-line option `-march=thorv2`
* GDB/simulator support for LWPI/SWPI/BITSUM, enabled by the command-line option `--architecture=nanomips:thorv2`
* QEMU support for LWPI/SWPI/BITSUM, enabled by the command-line option `-cpu THORV2`

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
|[Linux x64](../../releases/download/nanoMIPS-2021.00-05-trial-1/MediaTek.GNU.Tools.2021.00-05-trial-1.for.nanoMIPS.Bare.Metal.CentOS-6.x86_64.tar.gz) (.tar.gz)|[185M]|md5: 9e6dd2c79efebc777422c4c2a37982ea<br/>sha256: 75447d6676c97b8b8b17958212c068e17bd0fb94ce1c8459c8a69b2ff53520fb|
|[Windows 64](../../releases/download/nanoMIPS-2021.00-05-trial-1/MediaTek.GNU.Tools.2021.00-05-trial-1.for.nanoMIPS.Bare.Metal.Windows.x86_64.tar.gz) (.tar.gz)|[139M]|md5: 37c9bfe9c82635b7d07313b8aef0b356<br/>sha256: 6ccfdf17829a7f5e40086b86ff2359b7773d9e5af30d646e3add9a669da64827|
|[Linux x86](../../releases/download/nanoMIPS-2021.00-05-trial-1/MediaTek.GNU.Tools.2021.00-05-trial-1.for.nanoMIPS.Bare.Metal.CentOS-6.x86.tar.gz) (.tar.gz)|[190M]|md5: 8ab89af6658b93df13856c13732e1605<br/>sha256: c0a718f46e63cded33f093212be2af1feb5c2c4ff2cd79cf43a5422f97ae4e72|
|[Windows x86](../../releases/download/nanoMIPS-2021.00-05-trial-1/MediaTek.GNU.Tools.2021.00-05-trial-1.for.nanoMIPS.Bare.Metal.Windows.x86.tar.gz) (.tar.gz)|[135M]|md5: 502772b5bfd05c24121e7a2864d17b47<br/>sha256: 677e592d6fadda76f4e9e630b394451553a65fe54a06ae30260cec77503125f0|
 |**MUSL/Linux Toolchain**|||
|[Linux x64](../../releases/download/nanoMIPS-2021.00-05-trial-1/MediaTek.GNU.Tools.2021.00-05-trial-1.for.nanoMIPS.Linux.CentOS-6.x86_64.tar.gz) (.tar.gz)|[207M]|md5: d43caa3b8cc472404ba524d979fbccdd<br/>sha256: 0848c623dd6d0893781228dd02c9796c4520d8a223e257bfe9b58bb629d94a90|
|[Windows 64](../../releases/download/nanoMIPS-2021.00-05-trial-1/MediaTek.GNU.Tools.2021.00-05-trial-1.for.nanoMIPS.Linux.Windows.x86_64.tar.gz) (.tar.gz)|[183M]|md5: 8b7a1852d30f3027e550c01774a2800d<br/>sha256: d16a0a663aaa5beed8c826f85e321c306af7a978a8d01528f3638fb7021c2190|
|[Linux x86](../../releases/download/nanoMIPS-2021.00-05-trial-1/MediaTek.GNU.Tools.2021.00-05-trial-1.for.nanoMIPS.Linux.CentOS-6.x86.tar.gz) (.tar.gz)|[210M]|md5: 71f71be19d0bed3fad0aa5f055cc6679<br/>sha256: af6a86cfd9ad4af76ece30d65d4faa299035c105a6f5521c03af9199da81727b|
|[Windows x86](../../releases/download/nanoMIPS-2021.00-05-trial-1/MediaTek.GNU.Tools.2021.00-05-trial-1.for.nanoMIPS.Linux.Windows.x86.tar.gz) (.tar.gz)|[178M]|md5: 970d53d123c0610c68be7c35bbed78f2<br/>sha256: d176c48d2a1bac92af051ac1b5119799b27b24b02d651be595c3d007bf4a63d6|


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2021.00-05-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-05-trial-1/binutils-2021.00-05-trial-1.src.tar.gz)|[51M]|md5: 3b289dc621a9de26a9a18ebc78fa3f1e<br/>sha256: 95f45e2490e2ed36e886fa8fba27793e352326f4d19cd78df670d9be9ff43727|
|[gdb-2021.00-05-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-05-trial-1/gdb-2021.00-05-trial-1.src.tar.gz)|[51M]|md5: 0ebf6c26f163e835b7cf5ec941af26a6<br/>sha256: acd0e47c94b0133b0cf18d64460f2a92fa08d928b88dfcba0dcd71be3a4aa029|
|[gold-2021.00-05-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-05-trial-1/gold-2021.00-05-trial-1.src.tar.gz)|[52M]|md5: 617a06feb3690f0fd37ee280133a46dd<br/>sha256: 0cdd5e19d8f8061701bccc12bdc3989c029533fc12d1ccbd17508f8a85e8996c|
|[newlib-2021.00-05-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-05-trial-1/newlib-2021.00-05-trial-1.src.tar.gz)|[21M]|md5: 500fbd88caa5cc3f4675d8aab8149a48<br/>sha256: 2092f05a5a851173885af61347fed9315f50b32780597c346a33d731a7999042|
|[gcc-2021.00-05-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-05-trial-1/gcc-2021.00-05-trial-1.src.tar.gz)|[119M]|md5: 36c7ae720dea28b8573e948728ab72aa<br/>sha256: 31958748748897566217faa9d44bde05969342e0059a4d7d7624ac4ffbbcb837|
|[smallclib-2021.00-05-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-05-trial-1/smallclib-2021.00-05-trial-1.src.tar.gz)|[1M]|md5: 01386cc1b01217b9bbeb33ca473aa8f7<br/>sha256: 9d7d8eb43eaf5a0c2a8d15ff7de5cd7ec9a0470ba106583254976f6aa8e4eb65|
|[qemu-2021.00-05-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-05-trial-1/qemu-2021.00-05-trial-1.src.tar.gz)|[90M]|md5: 85a5eacfd970fe1fd017e100e1129782<br/>sha256: 2441d24970485f2ac4303819541b13aaafef6144bdd47be41104d1ad0ad12fa7|
|[musl-2021.00-05-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-05-trial-1/musl-2021.00-05-trial-1.src.tar.gz)|[1M]|md5: 05118acfc64a266865f663c8d4eef3be<br/>sha256: 878db74951c2ee81ea15ba0f1d147b8be8f5eee9e3ba5d8dd7c3dc8725e0752c|
|[packages-2021.00-05-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-05-trial-1/packages-2021.00-05-trial-1.src.tar.gz)|[192M]|md5: a7a0380637cfdf994ecea563bff31ebe<br/>sha256: 416e632c0c129739ee34061314b2a088f86a26a8dc99e394c9fb2273d1666daa|
|[python-2021.00-05-trial-1.src.tar.gz](../../releases/download/nanoMIPS-2021.00-05-trial-1/python-2021.00-05-trial-1.src.tar.gz)|[22M]|md5: a02bf773dadcd97f6aab0fb2fcf58565<br/>sha256: fd3a0e612ba725df171df0051514f54d89f4f4ffcf79c8283f5935c88bb3e9e8|


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
