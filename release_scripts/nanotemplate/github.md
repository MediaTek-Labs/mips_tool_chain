# [![MTK Logo](https://cdn-www.mediatek.com/icons/mtklogo.svg)](https://www.mediatek.com) &nbsp;&nbsp; nanoMIPS GNU toolchain v2021.11-02
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Published on December 03, 2021

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

* Recognize `__builtin_clz` on bitwise complemented operand as the *CLO* instruction \[[BZ #5](http://mtksap70.mediatek.inc/bugzilla/show_bug.cgi?id=5)\].

* Emit *NOT* instruction in compiler for bitwise complement operations instead of *NOR*. Certain *NOT* instructions can be 16-bit encoded, depending on the register operands \[[BZ #3](http://mtksap70.mediatek.inc/bugzilla/show_bug.cgi?id=3)\].

* Enable linker relaxation from 32-bit *SAVE/RESTORE* instructions to 16-bit variants.

#### Bug Fixes

* Use *JRC.HB* instruction instead of just *JR* for functions with `use_hazard_barrier_return` attribute \[[BZ #1](http://mtksap70.mediatek.inc/bugzilla/show_bug.cgi?id=1)\].

* Fix jump-table optimization in GCC to utilize the full 16-bit jump-table range with scaling and prefer unsigned offset tables over signed \[[BZ #2](http://mtksap70.mediatek.inc/bugzilla/show_bug.cgi?id=2)\].

* Fix internal error in linker when using `--emit-relocs` with `--gc-sections` \[[BZ #7](http://mtksap70.mediatek.inc/bugzilla/show_bug.cgi?id=7)\].

* Fix assembler relaxation to utilize the full range of 16-bit branches [CR MOLY00715449](http://swits.mediatek.inc/moly/mtkRecord.wits?method=redirectPage&dbid=34269881&recordType=CR&action=View)\].

* Fix `-fdebug-prefix-map` option for LTO builds. Prevent the option from leaking in to *gnu.lto_opts* and apply its mapping early to byte-code \[[BZ #9](http://mtksap70.mediatek.inc/bugzilla/show_bug.cgi?id=9)\].

* Updates calls to `stat` syscall in MUSL to inspect `errno` in order to detect failures. Raw syscalls that do not modify `errno` were replaced with syscall wrappers that do in a previous change, however some call sites were not updated to reflect in change in semantics.

* Fix simulation of *SLTI/SLTIU* instructions in gdb simulator to not sign-extend immediate operands.


#### Other Changes

* Add linker relaxation from 32-bit *B\[EQ\|NE\]ZC* instructions to 16-bit \[[BZ #6](http://mtksap70.mediatek.inc/bugzilla/show_bug.cgi?id=6)\].

* Add a multilib variant of libsupc++ built with `-fno-exceptions` for the link-time command-line option `-nortti-libstdc++` \[[BZ #4](http://mtksap70.mediatek.inc/bugzilla/show_bug.cgi?id=4)\].

#### Known issues

* The relocation minimization pass in the assembler results in instructions with invalid branch targets in some cases[\[[BZ #17](http://mtksap70.mediatek.inc/bugzilla/show_bug.cgi?id=17)\]. This pass is disabled by default and it is advisable to keep it disabled until further notice.




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
|[Linux x64](../../releases/download/nanoMIPS-2021.11-02/MediaTek.GNU.Tools.2021.11-02.for.nanoMIPS.Bare.Metal.CentOS-6.x86_64.tar.gz) (.tar.gz)|[118M]|md5: f57a16e8852cbf0e502357aec929d3b9<br/>sha256: 0fe2b84001975910af1b337166a55d2f01eaccbb626fbcb1606f6a45231c0031|
|[Windows 64](../../releases/download/nanoMIPS-2021.11-02/MediaTek.GNU.Tools.2021.11-02.for.nanoMIPS.Bare.Metal.Windows.x86_64.tar.gz) (.tar.gz)|[94M]|md5: 31d17f6daae5e2bedc7d36ee5f46faf4<br/>sha256: 6c4f3055189c82107e2483ef400d372b6fcb04ead94f1afda5e462d58f21200b|
|[Linux x86](../../releases/download/nanoMIPS-2021.11-02/MediaTek.GNU.Tools.2021.11-02.for.nanoMIPS.Bare.Metal.CentOS-6.x86.tar.gz) (.tar.gz)|[121M]|md5: 251a924cefada74e88687d4d8cecb138<br/>sha256: 7dba9f8d822a2bceef1b87a64165c3853329e72efe3c129de134c07678c9b5cc|
|[Windows x86](../../releases/download/nanoMIPS-2021.11-02/MediaTek.GNU.Tools.2021.11-02.for.nanoMIPS.Bare.Metal.Windows.x86.tar.gz) (.tar.gz)|[91M]|md5: 274718ac718b485c769d89aa3117f167<br/>sha256: fd98dbbaa10708fc221a01bb33e319bed12a6eef8961ac0a375fb46c1c360c8b|
 |**MUSL/Linux Toolchain**|||
|[Linux x64](../../releases/download/nanoMIPS-2021.11-02/MediaTek.GNU.Tools.2021.11-02.for.nanoMIPS.Linux.CentOS-6.x86_64.tar.gz) (.tar.gz)|[129M]|md5: 5c1a9a5622153d16de4727a01d92af77<br/>sha256: 1d41f03e5c5b641801d1cef0d224a9e10a428434ff76202bb296cba56c3acdf6|
|[Windows 64](../../releases/download/nanoMIPS-2021.11-02/MediaTek.GNU.Tools.2021.11-02.for.nanoMIPS.Linux.Windows.x86_64.tar.gz) (.tar.gz)|[110M]|md5: dc0566a2c902eea6c981956bbf402004<br/>sha256: fb816f7252231c6d5d453106ff171ac013bf3a36cae1fc746b8256ed893aa9fe|
|[Linux x86](../../releases/download/nanoMIPS-2021.11-02/MediaTek.GNU.Tools.2021.11-02.for.nanoMIPS.Linux.CentOS-6.x86.tar.gz) (.tar.gz)|[130M]|md5: 3c527b8f5c6a3aafc90d5a0ae1432480<br/>sha256: df3e5de28eb280ea08c697d4bfd0b2c2124cad385bd4e54e310c9cad5f7e2b54|
|[Windows x86](../../releases/download/nanoMIPS-2021.11-02/MediaTek.GNU.Tools.2021.11-02.for.nanoMIPS.Linux.Windows.x86.tar.gz) (.tar.gz)|[106M]|md5: cbc21c3f9571d6ced9185f22d30b91e9<br/>sha256: 4ff381cdd0a38c38808bb0e6b2c3f359f8ac2153646b45e9dacde3ea6dd511a5|


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2021.11-02.src.tar.gz](../../releases/download/nanoMIPS-2021.11-02/binutils-2021.11-02.src.tar.gz)|[51M]|md5: cac44dcf275f91e86bd7800e8f822c47<br/>sha256: 03bb8e1ea8c77132a8fb31cd347f70b82493d4fb4566b1d9e6858eb503a28166|
|[gdb-2021.11-02.src.tar.gz](../../releases/download/nanoMIPS-2021.11-02/gdb-2021.11-02.src.tar.gz)|[51M]|md5: cd7dc7bccec345094e50f21703b3ac13<br/>sha256: 3e870a666c349c929aa0cd4119c28fd67ce8ab28fc6dbee8d941081f9766306f|
|[gold-2021.11-02.src.tar.gz](../../releases/download/nanoMIPS-2021.11-02/gold-2021.11-02.src.tar.gz)|[52M]|md5: 7cced0c043df3a8bbc245d8759e3a296<br/>sha256: 6cfa0f352db00eaedf9fbb894ce45eb43edcb0c641f1716f66d3044c64256717|
|[newlib-2021.11-02.src.tar.gz](../../releases/download/nanoMIPS-2021.11-02/newlib-2021.11-02.src.tar.gz)|[19M]|md5: a747f8d9bf6bd05d43a9ada0c83b2316<br/>sha256: cba1fb1184bd39577f77028c5490b0162d75cc2a624112befb43c70cc92dd718|
|[gcc-2021.11-02.src.tar.gz](../../releases/download/nanoMIPS-2021.11-02/gcc-2021.11-02.src.tar.gz)|[112M]|md5: 1e713b424de80d767f97c99023b46afc<br/>sha256: 78d83b7af01f51b229109eae2f4bef223b9cd3165d1d411aa7078572f2ca768b|
|[smallclib-2021.11-02.src.tar.gz](../../releases/download/nanoMIPS-2021.11-02/smallclib-2021.11-02.src.tar.gz)|[1M]|md5: 8308f78c9323e5d9f9ab37dffc02d010<br/>sha256: 2f4970fc839ed54ea78a1c5ee930b77274d61ca3f087bbf06ab506a68bd468f4|
|[qemu-2021.11-02.src.tar.gz](../../releases/download/nanoMIPS-2021.11-02/qemu-2021.11-02.src.tar.gz)|[11M]|md5: 7862126d82e0c7a6d3bf7e72afff4e91<br/>sha256: c98eddb3cf4a0f5ac06f46cf421a7931b305f41d3434c3e0c7e6f1f50a1caf6a|
|[musl-2021.11-02.src.tar.gz](../../releases/download/nanoMIPS-2021.11-02/musl-2021.11-02.src.tar.gz)|[1M]|md5: 35df398c20c588f113e9993d2650e6d9<br/>sha256: 006092876cc271989225be1a860ca3772625be162ed33daae08f1e23d9f7d2da|
|[packages-2021.11-02.src.tar.gz](../../releases/download/nanoMIPS-2021.11-02/packages-2021.11-02.src.tar.gz)|[189M]|md5: ef2c4d8a50d453e60f314712262e4127<br/>sha256: 23e9034041da67457635c3da370a29c45120d8557159d226db096505c4bcee45|
|[python-2021.11-02.src.tar.gz](../../releases/download/nanoMIPS-2021.11-02/python-2021.11-02.src.tar.gz)|[16M]|md5: 23be3057efc8e0d39b89321cb6866b98<br/>sha256: 9e80d55a898ca685ce8e31e029ba7a248d75df5e99f3b3d7cdfe68d2e3119787|


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
