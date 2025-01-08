# [![MTK Logo](https://cdn-www.mediatek.com/icons/mtklogo.svg)](https://www.mediatek.com) &nbsp;&nbsp; nanoMIPS GNU toolchain v2024.11-02
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Published on January 08, 2025

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

#### Bug Fixes
* GOLD linker now correctly expands DSP BPOSGE32C  instruction in to 3 instructions using a trampoline, when the branch target is out of +16kB range.
* GDB simulator(nanomips-elf-run) will clear the DSP carry bit in the DSPcontrol register when there is no carry out of ADDSC instruction. Retaining the spurious carry can affect the correctness of a subsequent ADDWC  instruction.
* Fix encoding of DSP prepend instruction in GNU assembler.

#### Other Changes

#### Known Issues
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
|[Linux x64](../../releases/download/nanoMIPS-2024.11-02/MediaTek.GNU.Tools.2024.11-02.nanomips-elf_x86_64-pc-linux-gnu.tgz) (.tgz)|[170M]|md5: 50c06d9968aaa46e0ddc06852714001a<br/>sha256: 34c1301f9579d0c97c71a449f04384a365b2db0f1ef95e96f5494152e36f727e|


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2024.11-02.src.tgz](../../releases/download/nanoMIPS-2024.11-02/binutils-2024.11-02.src.tgz)|[51M]|md5: 69b839aea24c54f0b7e755f31e08b8a8<br/>sha256: 3d28480136aa86d853614686a8005e5b5e26e7317f41fbcecfe4bae3e161e15f|
|[gdb-2024.11-02.src.tgz](../../releases/download/nanoMIPS-2024.11-02/gdb-2024.11-02.src.tgz)|[51M]|md5: 45e18511a783f60ef4f9f372b0cad551<br/>sha256: 963bcc8dacc71cb19d75392f6a70040d47239ab2d56091cb0dbb3004255e38cf|
|[gold-2024.11-02.src.tgz](../../releases/download/nanoMIPS-2024.11-02/gold-2024.11-02.src.tgz)|[52M]|md5: f12c43fe0acce1e3e70d2f87f0050098<br/>sha256: ff2b14bae1d9697026c18ec4bf6de6a2116e0ccc1e8447f9424ba74d14809bc9|
|[newlib-2024.11-02.src.tgz](../../releases/download/nanoMIPS-2024.11-02/newlib-2024.11-02.src.tgz)|[21M]|md5: 52d136b522066068958e030d715314dd<br/>sha256: 409020ee436be5eb20d41d0821acb1ea627d727bb52f139b71acccef403091e7|
|[gcc-2024.11-02.src.tgz](../../releases/download/nanoMIPS-2024.11-02/gcc-2024.11-02.src.tgz)|[119M]|md5: 44b3ed79080455cb202903417cce4108<br/>sha256: 3013920d67d52d75da91e90215b2bf76440ff8760434300f3dddb1a575c36595|
|[smallclib-2024.11-02.src.tgz](../../releases/download/nanoMIPS-2024.11-02/smallclib-2024.11-02.src.tgz)|[1M]|md5: 79ad29f7b69df6af459a9879fd6693a2<br/>sha256: 4b8301f25aaa26639168ce3589e80874678e9c4ec1a672e7eedc376e70ca0759|
|[qemu-2024.11-02.src.tgz](../../releases/download/nanoMIPS-2024.11-02/qemu-2024.11-02.src.tgz)|[90M]|md5: 9499bdcf184ec71647937ff3de4e2673<br/>sha256: 262a07ec48884832323882ffb1d8d2ceee61fc3df2b88b470649779fdc06c6e6|
|[packages-2024.11-02.src.tgz](../../releases/download/nanoMIPS-2024.11-02/packages-2024.11-02.src.tgz)|[192M]|md5: 733b10eceabb99d4f67eac06e6bfa9c8<br/>sha256: 6ad35493fb18a965775a2fa5f3b9dc3afe36e8a09854a4455103f9a9c7dd4cec|
|[python-2024.11-02.src.tgz](../../releases/download/nanoMIPS-2024.11-02/python-2024.11-02.src.tgz)|[22M]|md5: 9975608efb1ea6492387f50fe516bbd0<br/>sha256: 2e27d7b9ecf548f7fc640725bd4affe62f3126154d4b34809641ce171a396b8a|


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
