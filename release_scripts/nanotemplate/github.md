# [![MTK Logo](https://cdn-www.mediatek.com/icons/mtklogo.svg)](https://www.mediatek.com) &nbsp;&nbsp; nanoMIPS GNU toolchain v2021.00-01-trial-2
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Published on December 15, 2021

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
* GCC now defaults to GNU C17 for compiling C code and to C++17 for compiling C++ code.
* GCC now defaults to DWARF version 5 for debug information structures, excluding line tables. Support libraries are still built with `-gdwarf-4` to maintain compatibility with the rest of the toolchain.
* GCC now defaults to `-fno-common`.  Multiple tentative definitions result in errors at link stage.
* GCC now preserves auxiliary debug information created by the language front-end when doing LTO which increases final debug information size but eases debugging experience.
* A new `nanomips-elf-lto-dump` has been added. It dumps various information about LTO byte-code object files.
* Various enhancements to existing GCC warnings as well the introduction of the new ones enabled by default, such as `-Wignored-attributes`, `-Wshift-count-negative`, `-Wstringop-*`, `-Wfree-nonheap-object` and `-Wbuiltin-declaration-mismatch`.

#### Bug Fixes
* C99 inlining semantics is now properly implemented by the GCC. Non-static functions having `inline` keyword that do not end up inlined by GCC, require out of line definition and can cause missing symbol errors at the link stage if one is not provided in another object file. Proper fix in most cases is to apply `static` keyword to such functions.

#### Other Changes

* Internal LTO format has changed. LTO object files created with the prior versions of the toolchain cannot be linked with object files compiled with this release.


#### Known issues

* `-fstack-check` feature is not supported.
* Option `-mfunc-opt-list` does not support the `noipa` attribute.


Refer to the [upstream release notes for GCC 11](https://gcc.gnu.org/gcc-11/changes.html) for more details.


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
|GCC|	11.2.0|
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
|[Linux x64](../../releases/download/nanoMIPS-2021.00-01-trial-2/MediaTek.GNU.Tools.2021.00-01-trial-2.for.nanoMIPS.Bare.Metal.CentOS-6.x86_64.tar.gz) (.tar.gz)|[144M]|md5: 89f2075b7ab0aaa5bcb713a75942a7cb<br/>sha256: 74885f698932fd564187f1ebf08dc0c9f9587d6e2222fc1f5e8d0ea3837a82e7|
|[Windows 64](../../releases/download/nanoMIPS-2021.00-01-trial-2/MediaTek.GNU.Tools.2021.00-01-trial-2.for.nanoMIPS.Bare.Metal.Windows.x86_64.tar.gz) (.tar.gz)|[119M]|md5: a0a9a9aa3d4e78f0a8581883b157ac2d<br/>sha256: 73b33605863d6a08c050c7df471129f3131f1374dee7fb3264ae3556d33e262e|
|[Linux x86](../../releases/download/nanoMIPS-2021.00-01-trial-2/MediaTek.GNU.Tools.2021.00-01-trial-2.for.nanoMIPS.Bare.Metal.CentOS-6.x86.tar.gz) (.tar.gz)|[148M]|md5: 5603e53ec2adaf6ee5d3aa07426bf54c<br/>sha256: 4220b5573e1c4f356f66b4f324c62b4c43c49d0082a38311b2ed3ac4573f4ed3|
|[Windows x86](../../releases/download/nanoMIPS-2021.00-01-trial-2/MediaTek.GNU.Tools.2021.00-01-trial-2.for.nanoMIPS.Bare.Metal.Windows.x86.tar.gz) (.tar.gz)|[115M]|md5: d6f114a42af561cf6f1ab691e3c95b02<br/>sha256: 9bbbd806b004706d27c7cf76afadf5b8b902657e0c0466c98554f76f135b43fc|
 |**MUSL/Linux Toolchain**|||
|[Linux x64](../../releases/download/nanoMIPS-2021.00-01-trial-2/MediaTek.GNU.Tools.2021.00-01-trial-2.for.nanoMIPS.Linux.CentOS-6.x86_64.tar.gz) (.tar.gz)|[160M]|md5: d34d31a0569a0faae413a80d5944f801<br/>sha256: e7d488535c9c38e1ac7a12ee6852643f7dc2a870210d53ec3d379ea8446d00f3|
|[Windows 64](../../releases/download/nanoMIPS-2021.00-01-trial-2/MediaTek.GNU.Tools.2021.00-01-trial-2.for.nanoMIPS.Linux.Windows.x86_64.tar.gz) (.tar.gz)|[145M]|md5: a8655102522add63e50372ffaf994b15<br/>sha256: 5f13a575fc447bfea6faa75b2b1e4f5a52d0e35b3bbac208ab6e428d3c45ec84|
|[Linux x86](../../releases/download/nanoMIPS-2021.00-01-trial-2/MediaTek.GNU.Tools.2021.00-01-trial-2.for.nanoMIPS.Linux.CentOS-6.x86.tar.gz) (.tar.gz)|[163M]|md5: ac70083b1f2db56922514c6705ed4249<br/>sha256: a166bb39b5d864584ad752145f4c03722a81c8c8ddc4d75c7ea4dd9df606a860|
|[Windows x86](../../releases/download/nanoMIPS-2021.00-01-trial-2/MediaTek.GNU.Tools.2021.00-01-trial-2.for.nanoMIPS.Linux.Windows.x86.tar.gz) (.tar.gz)|[140M]|md5: eac27ba7eaba8873850f41bd8608f982<br/>sha256: 107d674ccf361411bd3bbeb3eb395f2937b177aab71a634d08c2831ab6c82283|


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2021.00-01-trial-2.src.tar.gz](../../releases/download/nanoMIPS-2021.00-01-trial-2/binutils-2021.00-01-trial-2.src.tar.gz)|[51M]|md5: 1300f8471f61e3111147bb35869ecc1d<br/>sha256: c3a5ef057e35cd58dc6eccfa453ca1f8ef8eb51ca3a8537a4eb0c2a0d6deb3d0|
|[gdb-2021.00-01-trial-2.src.tar.gz](../../releases/download/nanoMIPS-2021.00-01-trial-2/gdb-2021.00-01-trial-2.src.tar.gz)|[51M]|md5: 48f9bf839f1fc1c9f45ebb65445845ca<br/>sha256: 3950b3e4cb0d4a77fd317b03ca72ee936bddb48c0de64163331caf471a492078|
|[gold-2021.00-01-trial-2.src.tar.gz](../../releases/download/nanoMIPS-2021.00-01-trial-2/gold-2021.00-01-trial-2.src.tar.gz)|[52M]|md5: 0f40e8245e6eb1f0c3adb4576cf4d89d<br/>sha256: 65e6d948a1358c963089e09bb7e0b16de84adf3dc69ddcf370b6e8a52e65760a|
|[newlib-2021.00-01-trial-2.src.tar.gz](../../releases/download/nanoMIPS-2021.00-01-trial-2/newlib-2021.00-01-trial-2.src.tar.gz)|[19M]|md5: 790ea084aff7a579fd0fd496331972a8<br/>sha256: 9d62eff0be28a2a41d93bf157c547a13718e33cbbc997bbb122b081ebaeae35f|
|[gcc-2021.00-01-trial-2.src.tar.gz](../../releases/download/nanoMIPS-2021.00-01-trial-2/gcc-2021.00-01-trial-2.src.tar.gz)|[119M]|md5: 4ccdfedf4cdb2c33ce7478af685e7b0c<br/>sha256: 66598ea8b34fd9decb29c6bee8a5eca33983a07232b0a3897a4c3f819528c746|
|[smallclib-2021.00-01-trial-2.src.tar.gz](../../releases/download/nanoMIPS-2021.00-01-trial-2/smallclib-2021.00-01-trial-2.src.tar.gz)|[1M]|md5: 2f5fd0a66dcd2bccc00d3cae3b930705<br/>sha256: 16ea1dbeba55836a4c88182416d322ac44c034c9f6ac685ad237de3eca681669|
|[qemu-2021.00-01-trial-2.src.tar.gz](../../releases/download/nanoMIPS-2021.00-01-trial-2/qemu-2021.00-01-trial-2.src.tar.gz)|[11M]|md5: 90781a7ab3366441e8e0ee93018944e0<br/>sha256: af18899331fe47a427216b64433866cc38d962f1c97ee4e1cd43158929e9b3e0|
|[musl-2021.00-01-trial-2.src.tar.gz](../../releases/download/nanoMIPS-2021.00-01-trial-2/musl-2021.00-01-trial-2.src.tar.gz)|[1M]|md5: e7afe235fcda9a5f72af70ffb2f7a8d3<br/>sha256: 94db116023076d9f50cbb2f914e370c12b9d011bae51986b1e5c51e05935fc66|
|[packages-2021.00-01-trial-2.src.tar.gz](../../releases/download/nanoMIPS-2021.00-01-trial-2/packages-2021.00-01-trial-2.src.tar.gz)|[189M]|md5: 14cdb9d1b444492f6b1e48ff80bb2d7e<br/>sha256: 501825cc71c3150d47aef88d8e367d29c0ed7b4db48e3d62aa7253ed656c8ac0|
|[python-2021.00-01-trial-2.src.tar.gz](../../releases/download/nanoMIPS-2021.00-01-trial-2/python-2021.00-01-trial-2.src.tar.gz)|[16M]|md5: 707db137765e9769374ee3234f3c4c6c<br/>sha256: e0b444209388676be13774ca7fdf2f13985bb9fcd292e716aae3e03d4a54d79e|


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
