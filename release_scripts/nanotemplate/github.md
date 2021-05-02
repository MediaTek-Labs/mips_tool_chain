# [![MTK Logo](https://cdn-www.mediatek.com/icons/mtklogo.svg)](https://www.mediatek.com) &nbsp;&nbsp; nanoMIPS GNU toolchain v2021.04-02
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Published on May 02, 2021

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
|[Linux x86](../../releases/download/nanoMIPS-2021.04-02/MediaTek.GNU.Tools.2021.04-02.for.nanoMIPS.Bare.Metal.CentOS-6.x86.tar.gz) (.tar.gz)|[120M]|md5: c433d6d6fd706a676704015782b96a34<br/>sha256: 16db411b19f3723575363f47c8d86b85041527c18208aa30c98beb4b0b99a097|
|[Windows x86](../../releases/download/nanoMIPS-2021.04-02/MediaTek.GNU.Tools.2021.04-02.for.nanoMIPS.Bare.Metal.Windows.x86.tar.gz) (.tar.gz)|[90M]|md5: 7272a91c1a2440151e02d8f89a77a99d<br/>sha256: 13234e85084e9efc9ad877e49aebaac20c7c2376e9c07304179c88e17058b6c7|
|[Linux x64](../../releases/download/nanoMIPS-2021.04-02/MediaTek.GNU.Tools.2021.04-02.for.nanoMIPS.Bare.Metal.CentOS-6.x86_64.tar.gz) (.tar.gz)|[118M]|md5: a7da08cafbf38356ff63d8902bda4c47<br/>sha256: 491fd7070b64db6b88a40e6df6ee301eb44709cc5b9b5d1ad2168da3d82ae520|
|[Windows 64](../../releases/download/nanoMIPS-2021.04-02/MediaTek.GNU.Tools.2021.04-02.for.nanoMIPS.Bare.Metal.Windows.x86_64.tar.gz) (.tar.gz)|[93M]|md5: 194bbca8f1cadb3c009cd46ca9e646f5<br/>sha256: 4b0b2f5a767da9023b5df41a262a762c3c9532354aef051f599d8af6861085c5|
 |**MUSL/Linux Toolchain**|||
|[Linux x86](../../releases/download/nanoMIPS-2021.04-02/MediaTek.GNU.Tools.2021.04-02.for.nanoMIPS.Linux.CentOS-6.x86.tar.gz) (.tar.gz)|[130M]|md5: 079256f03d1f78097b4110017484996e<br/>sha256: 2d1462a70df614766c24f666871cb050614e07c50a38502783868a9d8d32e46a|
|[Windows x86](../../releases/download/nanoMIPS-2021.04-02/MediaTek.GNU.Tools.2021.04-02.for.nanoMIPS.Linux.Windows.x86.tar.gz) (.tar.gz)|[106M]|md5: 0df373185874a2d95ec89b059766034a<br/>sha256: d2d65b5c9da3de95caa1cd3d007357186335ff74128f39342812b931e7fce7b2|
|[Linux x64](../../releases/download/nanoMIPS-2021.04-02/MediaTek.GNU.Tools.2021.04-02.for.nanoMIPS.Linux.CentOS-6.x86_64.tar.gz) (.tar.gz)|[129M]|md5: a6763a27c133b17b21ff60a343e6afd8<br/>sha256: d32747bbaf5ed667afd34f9d54a08a0260b529e82c34ce4fba20390bdcd76610|
|[Windows 64](../../releases/download/nanoMIPS-2021.04-02/MediaTek.GNU.Tools.2021.04-02.for.nanoMIPS.Linux.Windows.x86_64.tar.gz) (.tar.gz)|[109M]|md5: 68cc3b826400a4aadd1a4b3bc6295099<br/>sha256: ddfd157c3a6b99ca702616487e0542deae4a356f7758f1ee61290f034dcb8c8c|


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2021.04-02.src.tar.gz](../../releases/download/nanoMIPS-2021.04-02/binutils-2021.04-02.src.tar.gz)|[51M]|md5: 68124df44b640c5ea9d19157ce401642<br/>sha256: 530672c1e5081b4027c5baac65e40c6cc64ee6da24aa2bb8b178ede0ba7f0b42|
|[gdb-2021.04-02.src.tar.gz](../../releases/download/nanoMIPS-2021.04-02/gdb-2021.04-02.src.tar.gz)|[51M]|md5: e753ced58166410ccaef19b0f5d0090f<br/>sha256: c52b9e2d133a4bef01da6ef233de685598a0c979430eb65907489bd71d54c5cb|
|[gold-2021.04-02.src.tar.gz](../../releases/download/nanoMIPS-2021.04-02/gold-2021.04-02.src.tar.gz)|[52M]|md5: d52184b77bb73d4470ca05a10d94d552<br/>sha256: 2e16c5f6200aaafbf799c1ea6bb5a7afbea88ecd60ecc4e2bdfc031d376a16f7|
|[newlib-2021.04-02.src.tar.gz](../../releases/download/nanoMIPS-2021.04-02/newlib-2021.04-02.src.tar.gz)|[19M]|md5: 8df4ff4f734c7a01a554cee5be9486d1<br/>sha256: 3aefca89b7d8c44cd7227afcb64d452ec3a1724a08d477caf6a3d7fb43e16ee5|
|[gcc-2021.04-02.src.tar.gz](../../releases/download/nanoMIPS-2021.04-02/gcc-2021.04-02.src.tar.gz)|[112M]|md5: d0a0708e608f102417263ba872d817dd<br/>sha256: fa3ed019bcad037f3ed7a70f0226fcbc1441b7287fdb8646e939a433a23749da|
|[smallclib-2021.04-02.src.tar.gz](../../releases/download/nanoMIPS-2021.04-02/smallclib-2021.04-02.src.tar.gz)|[1M]|md5: 5d522e398b4b1d6a5a51dfb57aca2495<br/>sha256: 4e6fd3277cae189d223fa188433cfe1aba8612df39466158ca0aa58da7d44ef3|
|[qemu-2021.04-02.src.tar.gz](../../releases/download/nanoMIPS-2021.04-02/qemu-2021.04-02.src.tar.gz)|[11M]|md5: a10f5164fd59bcb2f5afb5965c9bfb93<br/>sha256: b0b733f5403e608ea2fcfe9b6dc1de8542f2065f3105cf9faf2fa85f783b7092|
|[musl-2021.04-02.src.tar.gz](../../releases/download/nanoMIPS-2021.04-02/musl-2021.04-02.src.tar.gz)|[1M]|md5: 8f3384e434492c0e3dfa76c6b55bec6e<br/>sha256: e609148e052c1f6f559f6f32cce88b2d3fd7a3a763a25b20ef17a9d2166793d7|
|[packages-2021.04-02.src.tar.gz](../../releases/download/nanoMIPS-2021.04-02/packages-2021.04-02.src.tar.gz)|[189M]|md5: 12b34bc4cd4489409fad10d46da776f4<br/>sha256: c80e2239cb586de0e47894a92ad47c73f07d32548dd27ecbd25206e08c965f39|
|[python-2021.04-02.src.tar.gz](../../releases/download/nanoMIPS-2021.04-02/python-2021.04-02.src.tar.gz)|[16M]|md5: 75c71facc3c9f9c5a51f1e0da11d6762<br/>sha256: 7389c954cab2d3d460caf917af19550d89439416f592cd4b2ac2c798aaee7dba|


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
