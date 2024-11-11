# [![MTK Logo](https://cdn-www.mediatek.com/icons/mtklogo.svg)](https://www.mediatek.com) &nbsp;&nbsp; nanoMIPS GNU toolchain v2024.09-03
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Published on November 12, 2024

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
* The toolchain implements a 64-bit `time_t` type to avoid the Y2K38 issue. This must be explicitly enabled by passing the flag -muse-64bit-time_t  on the compiler command line and it has the following effects:
time_t as defined by #include <time.h> becomes 64-bit wide
  * Compiler defines macro `__nanomips_64bit_time_t__` which user code can use to detect this condition.
  * Library search paths in the link command get updated to use a standard C library with 64-bit time_t.
    * Note: Link command-lines that specify an explicit search path for the C library must be manually updated!
  * ABI Version field in the ELF header of output objects is incremented to 1 and  these objects can not be inter-linked with legacy objects that use a 32-bit time_t. A new linker option
 `-Wl,--allow-abi-mismatch`  can be used to force inter-linking with a broken time_t  ABI, if absolutely required.
  * Objects can be inspected with `nanomips-elf-readelf -h` and those built with the work-around enabled will exhibit an incremented ABI Version (1 instead of 0).

#### Bug Fixes


#### Other Changes


#### Known issues

* The relocation-minimization pass in the assembler results in instructions with invalid branch targets in some cases. This pass is disabled by default and it is advisable to keep it disabled until further notice.


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
|[Linux x64](../../releases/download/nanoMIPS-2024.09-03/MediaTek.GNU.Tools.2024.09-03.nanomips-elf_x86_64-pc-linux-gnu.tgz) (.tgz)|[171M]|md5: 9b9ab249a85f056c555fc261880a7b67<br/>sha256: bdf77a448612cf5bbf36da924193a1b54385782a20743de30fcfe10366db840e|


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2024.09-03.src.tgz](../../releases/download/nanoMIPS-2024.09-03/binutils-2024.09-03.src.tgz)|[51M]|md5: 0123c1c3b4609f21e97517b76ba1af54<br/>sha256: 9f940360c94f7822436f93c57d7591e6c770f5c1a72279832c820580745a99a2|
|[gdb-2024.09-03.src.tgz](../../releases/download/nanoMIPS-2024.09-03/gdb-2024.09-03.src.tgz)|[51M]|md5: 407857b2f24bcb584c30571ed1e94bc5<br/>sha256: 812545a3c21525c36fdb4a862ec720d5c9c5324f499c9f523b1e2b4b2d717500|
|[gold-2024.09-03.src.tgz](../../releases/download/nanoMIPS-2024.09-03/gold-2024.09-03.src.tgz)|[52M]|md5: 5589036d213ea2dcc55a5813b7f1c755<br/>sha256: 29ce33441bbb1dd7ce44cb00ecb14b70c832e6527aff3f22b48de494e11143e6|
|[newlib-2024.09-03.src.tgz](../../releases/download/nanoMIPS-2024.09-03/newlib-2024.09-03.src.tgz)|[21M]|md5: 2b6b42a33ccbf2f93758dc369d260221<br/>sha256: 70b3ac64197f39e3069afae720592057cb75ee67f331ff8921d4afdd7b33c070|
|[gcc-2024.09-03.src.tgz](../../releases/download/nanoMIPS-2024.09-03/gcc-2024.09-03.src.tgz)|[119M]|md5: 3a6082e1fe5d14964486b1e44989e496<br/>sha256: 49748fc93ca45de9bbd3fb733f35ae4175084de08d844747df12cab218416309|
|[smallclib-2024.09-03.src.tgz](../../releases/download/nanoMIPS-2024.09-03/smallclib-2024.09-03.src.tgz)|[1M]|md5: 11e39d70a6d77c900536dcc3d5a2f37e<br/>sha256: 9318a678ae2a1566f35c1f5b4dc510e7f738593e5cefefc1a001995ea7b0a6e6|
|[qemu-2024.09-03.src.tgz](../../releases/download/nanoMIPS-2024.09-03/qemu-2024.09-03.src.tgz)|[90M]|md5: 39e74ce21af3a74f33d846bc2a6473cc<br/>sha256: af3360be8f82309f558f00fda876287ed85ff499337b47517baf2c45c6d8440f|
|[packages-2024.09-03.src.tgz](../../releases/download/nanoMIPS-2024.09-03/packages-2024.09-03.src.tgz)|[192M]|md5: e91ea45c748a7631aa41ad8aba136677<br/>sha256: c241c9f2771ce9495046dacf133e94499a3680c4c49c8e0ff7bfa6f17419edb6|
|[python-2024.09-03.src.tgz](../../releases/download/nanoMIPS-2024.09-03/python-2024.09-03.src.tgz)|[22M]|md5: 4372b816c98027050e9c8bb7d2d9b3be<br/>sha256: f58cf539a311126180951ca2cd5c5d67ac26000d6a3ba9738d06fb5bb99d8c28|


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
