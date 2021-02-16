# MediaTek nanoMIPS GNU toolchain v2019.03-07
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Published on February 16, 2021

* [Introduction](#introduction)
* [Release Notes](#release-notes)
* [Documentation](#documentation)
* [Component Versions](#component-versions)
* [Downloads](#downloads)
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
* None.

#### Other Changes
* Rebrand the release from MIPS to MediaTek.

#### Known issues
* The movep optimization can lead to bad code generation in some cases.  The compiler option -mno-movep-follow-copy-chains can be used to restrict interactions between adjacent optimization sites and avoid this issue.


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
|[Linux x86](../../releases/download/nanoMIPS-2019.03-07/MediaTek.GNU.Tools.2019.03-07.for.nanoMIPS.Bare.Metal.CentOS-6.x86.tar.gz) (.tar.gz)|[116M]|md5: 4fecedf4bec48c63fc5df1f8170300aa<br/>sha256: b4606497de686fd37921ce22bea201d160e4edf5461138dd0ac57e0c98342d12|
|[Windows x86](../../releases/download/nanoMIPS-2019.03-07/MediaTek.GNU.Tools.2019.03-07.for.nanoMIPS.Bare.Metal.Windows.x86.tar.gz) (.tar.gz)|[86M]|md5: 58dc7163a933cded779c4abbea8f5026<br/>sha256: 69bcdf67858dae677871db4a2a9ca0d34148e19e8dbea067bfece95a4d9811a7|
|[Linux x64](../../releases/download/nanoMIPS-2019.03-07/MediaTek.GNU.Tools.2019.03-07.for.nanoMIPS.Bare.Metal.CentOS-6.x86_64.tar.gz) (.tar.gz)|[114M]|md5: 7f4a03d642a68a599739b2e471713d9e<br/>sha256: 8a8d80ca86cafb6a23429b599306a4241aa92c0b63d4d534188eddf3d05a8200|
|[Windows 64](../../releases/download/nanoMIPS-2019.03-07/MediaTek.GNU.Tools.2019.03-07.for.nanoMIPS.Bare.Metal.Windows.x86_64.tar.gz) (.tar.gz)|[89M]|md5: 1ef0133198f1653a3bf074d5db36f5b0<br/>sha256: 87d5ca170e8f855a63cb2beb9dc2a684812d5ea1a005553180d1087b4adbdbae|
 |**MUSL/Linux Toolchain**|||
|[Linux x86](../../releases/download/nanoMIPS-2019.03-07/MediaTek.GNU.Tools.2019.03-07.for.nanoMIPS.Linux.CentOS-6.x86.tar.gz) (.tar.gz)|[130M]|md5: 6803ddad4c01dfbd2e2b59c69d21b0a8<br/>sha256: d950d477cb8ec7718a68a28912ee868dc5a24576e3325a324595aff1125489be|
|[Windows x86](../../releases/download/nanoMIPS-2019.03-07/MediaTek.GNU.Tools.2019.03-07.for.nanoMIPS.Linux.Windows.x86.tar.gz) (.tar.gz)|[106M]|md5: c4887a49eb30bcf7a487a518ffb10dec<br/>sha256: ebec8a2f0ba2ccb4678f8299ff0b212241fcbddcd26e7dacc593a0f65c4e96d7|
|[Linux x64](../../releases/download/nanoMIPS-2019.03-07/MediaTek.GNU.Tools.2019.03-07.for.nanoMIPS.Linux.CentOS-6.x86_64.tar.gz) (.tar.gz)|[129M]|md5: 6724f3ddb17760d45be17a30ffdab22f<br/>sha256: ba2e4f6afb55ba0101de00ad78f9aee62914897ef858505d9c3b54bb9c44bac7|
|[Windows 64](../../releases/download/nanoMIPS-2019.03-07/MediaTek.GNU.Tools.2019.03-07.for.nanoMIPS.Linux.Windows.x86_64.tar.gz) (.tar.gz)|[109M]|md5: 516db13d0df3fb02489cf8550de51c39<br/>sha256: 36006aff0727f392888467cb2d970a1452e2442324d65cb2de886b5a2a037021|


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2019.03-07.src.tar.gz](../../releases/download/nanoMIPS-2019.03-07/binutils-2019.03-07.src.tar.gz)|[51M]|md5: 83d6e2ef8ac1b095183ac4c5249e90a5<br/>sha256: 3bee3f7c0cd3419dc4fefba43dc11f15799f1593b85e4dd328e6b8b9eb78fe32|
|[gdb-2019.03-07.src.tar.gz](../../releases/download/nanoMIPS-2019.03-07/gdb-2019.03-07.src.tar.gz)|[51M]|md5: d8478f84bc38eaf9ef575a597781d48c<br/>sha256: 565b5a6818aa8627248cec44c35a4d54f097eab4c90a2e97bc5529a1723029b2|
|[gold-2019.03-07.src.tar.gz](../../releases/download/nanoMIPS-2019.03-07/gold-2019.03-07.src.tar.gz)|[52M]|md5: b5259ec57f0aadfcdb96046a96dcc8f8<br/>sha256: 0df87ee39cb5dbdfd9650388f060c2850cdaffd62794856100aaf9da2537be44|
|[newlib-2019.03-07.src.tar.gz](../../releases/download/nanoMIPS-2019.03-07/newlib-2019.03-07.src.tar.gz)|[19M]|md5: 0a74a8c6fdf5d8eea442581531ccbc49<br/>sha256: 60e453575f6702dbc646129a7dc91885c7e986342dfea598d2fa9ed8f1651d35|
|[gcc-2019.03-07.src.tar.gz](../../releases/download/nanoMIPS-2019.03-07/gcc-2019.03-07.src.tar.gz)|[112M]|md5: bd883c228b4c9883985243cdca8618cd<br/>sha256: daacf1c0613cf493a62f29d10e9f935ca7e72282363912e4a4faa4dddc1d8c3e|
|[smallclib-2019.03-07.src.tar.gz](../../releases/download/nanoMIPS-2019.03-07/smallclib-2019.03-07.src.tar.gz)|[1M]|md5: 08015e0a2cc093008bca43227aa278e0<br/>sha256: 9ef6f164a7bef77d73c09fda04f1fd8fa79bff75eab5662f26805f44234e8f34|
|[qemu-2019.03-07.src.tar.gz](../../releases/download/nanoMIPS-2019.03-07/qemu-2019.03-07.src.tar.gz)|[11M]|md5: d8006374312ecc2aabddc38cdb42642f<br/>sha256: 6dc6a14488a7a3e75e59ad34d020eeaf90866f6d9314059df70573e94cc74553|
|[musl-2019.03-07.src.tar.gz](../../releases/download/nanoMIPS-2019.03-07/musl-2019.03-07.src.tar.gz)|[1M]|md5: 733ca11f83e7e9b80f6ec3c7e26027df<br/>sha256: c12d2ac44c62d15739c4e926ed0303667d6f41a89a9ae1b3c078a24ab9b877fb|
|[packages-2019.03-07.src.tar.gz](../../releases/download/nanoMIPS-2019.03-07/packages-2019.03-07.src.tar.gz)|[189M]|md5: 15995cd06863d9b5484bba59e4cf3c02<br/>sha256: 8bea60272f50a0d4308cba4034c245b4a12538a660131b189ef6628597e7d1cd|
|[python-2019.03-07.src.tar.gz](../../releases/download/nanoMIPS-2019.03-07/python-2019.03-07.src.tar.gz)|[16M]|md5: b40a9b2bfa174e8cc41f9b6e1e5d0f7d<br/>sha256: 6e96c6d35108301cfefb26154bf5c5bef43fe97aa2efcf1b84b2befd4f970583|


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

The software included in this product contains copyrighted software that is licensed under the GPLv3. A copy of that license is included in the source. You may obtain the complete Corresponding Source code above.

Licenses for each component are installed as part of the package, are listed in the getting started guide and can be referred to again after the install.

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
