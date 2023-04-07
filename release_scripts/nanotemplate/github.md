# [![MTK Logo](https://cdn-www.mediatek.com/icons/mtklogo.svg)](https://www.mediatek.com) &nbsp;&nbsp; nanoMIPS GNU toolchain v2022.10-02
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Published on April 07, 2023

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
* None

#### Bug Fixes
* Output relocations sorted by the `r_offset` field in object files \[[BZ #65]\].

#### Other Changes
* None

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
|[Linux x64](../../releases/download/nanoMIPS-2022.10-02/MediaTek.GNU.Tools.2022.10-02.for.nanoMIPS.Bare.Metal.CentOS-6.x86_64.tgz) (.tgz)|[188M]|md5: fb9e063b401ad1f4fc3e1ec94b5e7d9e<br/>sha256: 9edce7bc725b9a47bcee09961acc9ccfbe5bb9434f2ce70d1dd41d90290bd596|
|[Windows 64](../../releases/download/nanoMIPS-2022.10-02/MediaTek.GNU.Tools.2022.10-02.for.nanoMIPS.Bare.Metal.Windows.x86_64.tgz) (.tgz)|[143M]|md5: 8f6862aa7358f1270acd5a0f06d7b9d7<br/>sha256: 6470501ca676b8f7b110f9c7f65384d46067181e5f5491246f01afc78fbfc1a5|
|[Linux x86](../../releases/download/nanoMIPS-2022.10-02/MediaTek.GNU.Tools.2022.10-02.for.nanoMIPS.Bare.Metal.CentOS-6.x86.tgz) (.tgz)|[194M]|md5: 00c375279854c3f8075be5ae5ec280ed<br/>sha256: 9e9d2d391aec07f38f439e629b8371b0d24096f728e383ba18fb262857dcb176|
|[Windows x86](../../releases/download/nanoMIPS-2022.10-02/MediaTek.GNU.Tools.2022.10-02.for.nanoMIPS.Bare.Metal.Windows.x86.tgz) (.tgz)|[139M]|md5: 10d4b5c463f9b5246e8540eef9a9e27b<br/>sha256: e6c3f4852beeadc25bc0324eb1c7125e0a84ca91ca35dce67fc229aea28284f2|
 |**MUSL/Linux Toolchain**|||
|[Linux x64](../../releases/download/nanoMIPS-2022.10-02/MediaTek.GNU.Tools.2022.10-02.for.nanoMIPS.Linux.CentOS-6.x86_64.tgz) (.tgz)|[207M]|md5: 0b7956523cdd88d8b5866fdfbd17b667<br/>sha256: 267e47a9640baccb4fcca8114964b02833e4d718fce4ea88911314426ec9b20e|
|[Windows 64](../../releases/download/nanoMIPS-2022.10-02/MediaTek.GNU.Tools.2022.10-02.for.nanoMIPS.Linux.Windows.x86_64.tgz) (.tgz)|[183M]|md5: fff656d6e9c00524296af786d0007658<br/>sha256: 20cf31a8f1450a04b97c86346f63ce2b078bf22627d20aca19aee18e123665fc|
|[Linux x86](../../releases/download/nanoMIPS-2022.10-02/MediaTek.GNU.Tools.2022.10-02.for.nanoMIPS.Linux.CentOS-6.x86.tgz) (.tgz)|[210M]|md5: 7760ff1ba7403c222bfe4b78e289db8c<br/>sha256: 07f7896b2f19dbf4a85ca0e7bbea8e753066ba71ca028827b3aaa8d18d00fe89|
|[Windows x86](../../releases/download/nanoMIPS-2022.10-02/MediaTek.GNU.Tools.2022.10-02.for.nanoMIPS.Linux.Windows.x86.tgz) (.tgz)|[178M]|md5: 6a9de3623117063878d10220ac7035ec<br/>sha256: b30beed4b4edaba27c57230595504bae419b0b86485561639141ecdceb9d1b00|


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2022.10-02.src.tgz](../../releases/download/nanoMIPS-2022.10-02/binutils-2022.10-02.src.tgz)|[51M]|md5: 3a77bb121f7e79c1aa0a611090aaa905<br/>sha256: 7e155aea152befc7cc0cf1d448d20e8c811db3d46adac6684dc04edaad8c83a7|
|[gdb-2022.10-02.src.tgz](../../releases/download/nanoMIPS-2022.10-02/gdb-2022.10-02.src.tgz)|[51M]|md5: 267004ee90089e5ee97cdf6898834b73<br/>sha256: e758bfb1c3eb1b35d1b2993d376a21dcdecbc9417a1921a391cd31830586edc1|
|[gold-2022.10-02.src.tgz](../../releases/download/nanoMIPS-2022.10-02/gold-2022.10-02.src.tgz)|[52M]|md5: 99a29664be05a913b88eeb32bc51c840<br/>sha256: 0b90bb851af7baa0a9b5144257dce867174ca15700daa61089246fb6983daecd|
|[newlib-2022.10-02.src.tgz](../../releases/download/nanoMIPS-2022.10-02/newlib-2022.10-02.src.tgz)|[21M]|md5: fd33d7f8565b0bdac258070969610ebb<br/>sha256: 0db1c7a362997e10198166dc70f8fe68199bc4731e1ddc2b8ade658eb9d321b4|
|[gcc-2022.10-02.src.tgz](../../releases/download/nanoMIPS-2022.10-02/gcc-2022.10-02.src.tgz)|[119M]|md5: 7cb49ec3b08da977d1d197b99b2a609e<br/>sha256: cef108d9c956eb24c73ed2dc62d161fff219c036479498ec682dbbe7dfe06ce3|
|[smallclib-2022.10-02.src.tgz](../../releases/download/nanoMIPS-2022.10-02/smallclib-2022.10-02.src.tgz)|[1M]|md5: 5ba24c4eac3aeb14e8c19e0b3f7a8be2<br/>sha256: 8bf1866a4e3cdde807e8483c8e348f21127b55352fc4cff47611f379ba6e248e|
|[qemu-2022.10-02.src.tgz](../../releases/download/nanoMIPS-2022.10-02/qemu-2022.10-02.src.tgz)|[90M]|md5: 2f165441abe0abb5b3c5272337ab01e3<br/>sha256: 84d92a0752acb7613356eea6c925e3b2505ab06167ef7e1a6484c79ad9573197|
|[musl-2022.10-02.src.tgz](../../releases/download/nanoMIPS-2022.10-02/musl-2022.10-02.src.tgz)|[1M]|md5: c1aa63fdbfffadaf8538c5d20465b278<br/>sha256: c5a6ff10ee6d41f457541cb8d5aa62e6ba9a858782f36b65f9ec5307a2232afb|
|[packages-2022.10-02.src.tgz](../../releases/download/nanoMIPS-2022.10-02/packages-2022.10-02.src.tgz)|[192M]|md5: 0744ed90facc41f0bfc71906ad11e3d2<br/>sha256: fd72a6c0d79f73f091ced659b58d1891b7812d2865feb03ae75d809ef40a22de|
|[python-2022.10-02.src.tgz](../../releases/download/nanoMIPS-2022.10-02/python-2022.10-02.src.tgz)|[22M]|md5: 931716c26a23f0b7d295e9ce89360f94<br/>sha256: 0598b57727aaa3bf409ccc676a4e155ea2c4388b39bb6059d75e419ec05e0809|


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
