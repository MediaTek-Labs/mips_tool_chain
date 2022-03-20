# [![MTK Logo](https://cdn-www.mediatek.com/icons/mtklogo.svg)](https://www.mediatek.com) &nbsp;&nbsp; nanoMIPS GNU toolchain v2022.03-01
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Published on March 21, 2022

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

* Update GCC from v6.3.0 to v11.2.0
** GCC now defaults to GNU C17 for compiling C code and to C++17 for compiling C++ code.
** GCC now defaults to DWARF version 5 for debug information structures, excluding line tables. Support libraries are still built with `-gdwarf-4` to maintain compatibility with the rest of the toolchain.
** GCC now defaults to `-fno-common`.  Multiple tentative definitions result in errors at link stage.
** GCC now preserves auxiliary debug information created by the language front-end when doing LTO which increases final debug information size but eases debugging experience.
** A new `nanomips-elf-lto-dump` has been added. It dumps various information about LTO byte-code object files.
** Various enhancements to existing GCC warnings as well the introduction of the new ones enabled by default as `-Wignored-attributes`, `-Wshift-count-negative`, `-Wstringop-*`, `-Wfree-nonheap-object` and `-Wbuiltin-declaration-mismatch`.
* Update binutils from v2.29 to v2.37
* Update newlib from v2.5.0 to v4.2.0
* Update qemu from v2.5 to v6.2.0


#### Bug Fixes

* C99 inlining semantics is now properly implemented by the GCC. Non-static functions having `inline` keyword that do not end up inlined by the GCC, require out of line definition and can cause missing symbol errors at the link stage if one is not provided in another object file. Proper fix in most cases is to apply `static` keyword to such functions.


#### Other Changes

* Internal LTO format has changed. LTO object files created with the prior versions of the toolchain cannot be linked with this release.


#### Known issues

* The `-fstack-check` feature is not supported.
* The `-mfunc-opt-list` does not support `noipa` attribute.
* Dereferencing a pointer explicitly marked with aligned attribute less than the pointer's natural alignment, may produce unaligned access at runtime if passed as argument to a function.

Refer to the [upstream release notes for GCC 11.2](https://gcc.gnu.org/gcc-11/changes.html) for more details.


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
|[Linux x64](../../releases/download/nanoMIPS-2022.03-01/MediaTek.GNU.Tools.2022.03-01.for.nanoMIPS.Bare.Metal.CentOS-6.x86_64.tar.gz) (.tar.gz)|[168M]|md5: 16abf95c4909d7d187392ebc6c32e2c4<br/>sha256: 72b700af37e6be7c92a5dc5e9a12f9236023a09866292b93253a956fc9204286|
|[Windows 64](../../releases/download/nanoMIPS-2022.03-01/MediaTek.GNU.Tools.2022.03-01.for.nanoMIPS.Bare.Metal.Windows.x86_64.tar.gz) (.tar.gz)|[122M]|md5: eb5d860f121987a9d11065c395266681<br/>sha256: 2358613dca04daea05cb732a53521f91796199ba76519d4b88417f18d0b33e7f|
|[Linux x86](../../releases/download/nanoMIPS-2022.03-01/MediaTek.GNU.Tools.2022.03-01.for.nanoMIPS.Bare.Metal.CentOS-6.x86.tar.gz) (.tar.gz)|[171M]|md5: f21d3316650fb3431981c002312a03d0<br/>sha256: 68c05ac1522dc2c2c64a645b1f490460812ba607bc51a7d144587c6a41b60b23|
|[Windows x86](../../releases/download/nanoMIPS-2022.03-01/MediaTek.GNU.Tools.2022.03-01.for.nanoMIPS.Bare.Metal.Windows.x86.tar.gz) (.tar.gz)|[118M]|md5: 764ba0045137afa06dd88d1b3b678f8e<br/>sha256: 8951a500da066b375e747a7e819e0832c4fce44b615dbd3fe02d980b59e79b55|
 |**MUSL/Linux Toolchain**|||
|[Linux x64](../../releases/download/nanoMIPS-2022.03-01/MediaTek.GNU.Tools.2022.03-01.for.nanoMIPS.Linux.CentOS-6.x86_64.tar.gz) (.tar.gz)|[184M]|md5: 6bb0b8a36b53762441cd5c16878b6fd0<br/>sha256: 26dc4cc9b81d652757e6543f9c3c1f1932a3611e337a6727610c74de8750327e|
|[Windows 64](../../releases/download/nanoMIPS-2022.03-01/MediaTek.GNU.Tools.2022.03-01.for.nanoMIPS.Linux.Windows.x86_64.tar.gz) (.tar.gz)|[147M]|md5: 9a2576852dda88e3724d297a833e1dc5<br/>sha256: b906c0bd0b624ae7ed5770a3d8da71cb302bde44baa88ce1a7a1c8eae9d917ec|
|[Linux x86](../../releases/download/nanoMIPS-2022.03-01/MediaTek.GNU.Tools.2022.03-01.for.nanoMIPS.Linux.CentOS-6.x86.tar.gz) (.tar.gz)|[186M]|md5: 6859e59668b92ae644bd595712ec8d2a<br/>sha256: 8f487b3016ac8c18e0acf3f5620f4428e255a470dda009c88f9af7d9f21d7f19|
|[Windows x86](../../releases/download/nanoMIPS-2022.03-01/MediaTek.GNU.Tools.2022.03-01.for.nanoMIPS.Linux.Windows.x86.tar.gz) (.tar.gz)|[142M]|md5: 38fd8ae3b0d16519aef947a8d2d8b093<br/>sha256: 8b0aa8d4750af234e08ff544cf1ea1ca426b8dd266990a9c41c60c1467f0683d|


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2022.03-01.src.tar.gz](../../releases/download/nanoMIPS-2022.03-01/binutils-2022.03-01.src.tar.gz)|[51M]|md5: 9c534173e7323807548babed97cf225e<br/>sha256: eb825018b62e70e666ea2a9abdb35c7354e5abf5229137d6496c173647e57bb6|
|[gdb-2022.03-01.src.tar.gz](../../releases/download/nanoMIPS-2022.03-01/gdb-2022.03-01.src.tar.gz)|[51M]|md5: f24202cf90d1aae0912eed36432291f7<br/>sha256: 142102f6c5c8a372b641c7ef97ef3386d97acc5080ac2b7f4540955c3820ab89|
|[gold-2022.03-01.src.tar.gz](../../releases/download/nanoMIPS-2022.03-01/gold-2022.03-01.src.tar.gz)|[52M]|md5: 90ccdd0fd2c7fde03cf58be032c2a58e<br/>sha256: 0e324dad66f26bd09bdac0cfb7a1eddf42da634f5abd3b2063d220f719ba1ba8|
|[newlib-2022.03-01.src.tar.gz](../../releases/download/nanoMIPS-2022.03-01/newlib-2022.03-01.src.tar.gz)|[21M]|md5: b6bec7cb08f9dd7b456672b6d82d083a<br/>sha256: 89e71a1053b84df54f7e10d65f3355671f79859d2b97fe3e3a3037e6f9d89ebd|
|[gcc-2022.03-01.src.tar.gz](../../releases/download/nanoMIPS-2022.03-01/gcc-2022.03-01.src.tar.gz)|[119M]|md5: e1163f1a2032a0ed1799460fd953c1f4<br/>sha256: bae9cf646817ca999db4ef4e2a5929a46abdf0b007a196c1a050228ad5879aad|
|[smallclib-2022.03-01.src.tar.gz](../../releases/download/nanoMIPS-2022.03-01/smallclib-2022.03-01.src.tar.gz)|[1M]|md5: 6e907b59949edbb0bbc72e1339ae4dcd<br/>sha256: 83bb6d15a13a9354a924ad7fbd7ae1e919cc5be003944108a8a88323dedc9b03|
|[qemu-2022.03-01.src.tar.gz](../../releases/download/nanoMIPS-2022.03-01/qemu-2022.03-01.src.tar.gz)|[90M]|md5: 4f22a3d705255a13edc5145e4d2c74df<br/>sha256: 7d896e824ab64d0608e62731e36778d23a0d89420485245218e153fa7fa87bac|
|[musl-2022.03-01.src.tar.gz](../../releases/download/nanoMIPS-2022.03-01/musl-2022.03-01.src.tar.gz)|[1M]|md5: 3f4d763384966fc243e3b0ebeb3cd5bf<br/>sha256: 25127ad0737fad18eb2713c67f04db6ec4aefe2a3281c83e66932fe2381bcf7c|
|[packages-2022.03-01.src.tar.gz](../../releases/download/nanoMIPS-2022.03-01/packages-2022.03-01.src.tar.gz)|[192M]|md5: 1fba8e5f262cb60800142a9735d2ac5d<br/>sha256: e227b97c9ba16781559feba47e03d98c17dd169d30fd6769d318f8bec18f46bd|
|[python-2022.03-01.src.tar.gz](../../releases/download/nanoMIPS-2022.03-01/python-2022.03-01.src.tar.gz)|[22M]|md5: 307abaaa75bd376ba1f43cb4e7162f7c<br/>sha256: 8f2206a574854320c1c49d20225b5df3ad673ea673afc2d0d8c098509232138c|


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
