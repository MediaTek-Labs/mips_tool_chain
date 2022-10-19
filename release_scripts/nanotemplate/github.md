# [![MTK Logo](https://cdn-www.mediatek.com/icons/mtklogo.svg)](https://www.mediatek.com) &nbsp;&nbsp; nanoMIPS GNU toolchain v2022.00-01-trial-6
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Published on October 19, 2022

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
* Remove support for LWD/SWD  instructions from all components.
#### Bug Fixes
* None
#### Other Changes
* Assembler support for ThorV2 is enabled by the command-line option `-march=thorv2`.
* Compiler support for ThorV2 is enabled by the command-line option `-march=thorv2`.
* GDB/simulator support for ThorV2 is enabled by the command-line option `--architecture=nanomips:thorv2`.
* QEMU support for ThorV2 is enabled by the command-line option `-cpu THORV2`.
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
|[Linux x64](../../releases/download/nanoMIPS-2022.00-01-trial-6/MediaTek.GNU.Tools.2022.00-01-trial-6.for.nanoMIPS.Bare.Metal.CentOS-6.x86_64.tgz) (.tgz)|[189M]|md5: 0a39e12913258f7f043dd7bf33837097<br/>sha256: aa445aa0a0196ab84e6fef480c93943b4f141d7b35059e87c4df1cf22723282d|
|[Windows 64](../../releases/download/nanoMIPS-2022.00-01-trial-6/MediaTek.GNU.Tools.2022.00-01-trial-6.for.nanoMIPS.Bare.Metal.Windows.x86_64.tgz) (.tgz)|[143M]|md5: 4e302d46dba96f77e0ad74dd2502f335<br/>sha256: 9d1574aad1a29073e9a6d06d179aad35f30efba46107c1623756dbca64ef34ac|
|[Linux x86](../../releases/download/nanoMIPS-2022.00-01-trial-6/MediaTek.GNU.Tools.2022.00-01-trial-6.for.nanoMIPS.Bare.Metal.CentOS-6.x86.tgz) (.tgz)|[194M]|md5: 4332012de4171f554ae8eceb2189a3f7<br/>sha256: 105fbf3d46026fad06010c790e7e4addd42e379fb189c0ff238a0539dff1d37f|
|[Windows x86](../../releases/download/nanoMIPS-2022.00-01-trial-6/MediaTek.GNU.Tools.2022.00-01-trial-6.for.nanoMIPS.Bare.Metal.Windows.x86.tgz) (.tgz)|[139M]|md5: 6684c866785922baffc370b698c46c58<br/>sha256: 60522ac5184c23d4f68ebcb8de8185cc6a9989738a14bcfcf335f29b66b4e2e3|
 |**MUSL/Linux Toolchain**|||
|[Linux x64](../../releases/download/nanoMIPS-2022.00-01-trial-6/MediaTek.GNU.Tools.2022.00-01-trial-6.for.nanoMIPS.Linux.CentOS-6.x86_64.tgz) (.tgz)|[207M]|md5: 97b9731071c049f0a76e4ad00de662a1<br/>sha256: 8ba9d3792b672b4816fd1b6ca4f670090ecff5eb83f9ffa1b90e1cae26c52024|
|[Windows 64](../../releases/download/nanoMIPS-2022.00-01-trial-6/MediaTek.GNU.Tools.2022.00-01-trial-6.for.nanoMIPS.Linux.Windows.x86_64.tgz) (.tgz)|[183M]|md5: 0aac675b6e1456d86f37b26dd5df7014<br/>sha256: 9585a7deee6283c3d8318d0c65f6d2b0acc9dca5dda0740a6ea96c09197a9522|
|[Linux x86](../../releases/download/nanoMIPS-2022.00-01-trial-6/MediaTek.GNU.Tools.2022.00-01-trial-6.for.nanoMIPS.Linux.CentOS-6.x86.tgz) (.tgz)|[210M]|md5: b9802977de46a34c3d37a9da3c3c8d94<br/>sha256: 6abbd8a8c6e50974f2b68048660f71a3711db6069cba3183e151eacdb9098fc1|
|[Windows x86](../../releases/download/nanoMIPS-2022.00-01-trial-6/MediaTek.GNU.Tools.2022.00-01-trial-6.for.nanoMIPS.Linux.Windows.x86.tgz) (.tgz)|[178M]|md5: 35eed9df44402839c5f2838cf8c9d2d4<br/>sha256: ade6ab6bb4806909537b3dd188db059a7f0559fef768709416ae06e40cb3292e|


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2022.00-01-trial-6.src.tgz](../../releases/download/nanoMIPS-2022.00-01-trial-6/binutils-2022.00-01-trial-6.src.tgz)|[51M]|md5: 0bbdb1504a4607d10101e444a8704334<br/>sha256: 4944c85bc5009d3975801f5a9e812613ee100df6c1431cc9c0f42787eb9933ed|
|[gdb-2022.00-01-trial-6.src.tgz](../../releases/download/nanoMIPS-2022.00-01-trial-6/gdb-2022.00-01-trial-6.src.tgz)|[51M]|md5: 86df0ceee2be74c7c306656500e00906<br/>sha256: 09f8035dd9816c60ad6ccc96fe6ed18ac23f56ea3d0567be3a2e54b4346f7b42|
|[gold-2022.00-01-trial-6.src.tgz](../../releases/download/nanoMIPS-2022.00-01-trial-6/gold-2022.00-01-trial-6.src.tgz)|[52M]|md5: 7fd90bac7a9ba74dd22ddc1726774b3d<br/>sha256: 6cb6d72943f243b0f4fca93c939bc8d368795d004cbe626eef8cf03c9da91e8f|
|[newlib-2022.00-01-trial-6.src.tgz](../../releases/download/nanoMIPS-2022.00-01-trial-6/newlib-2022.00-01-trial-6.src.tgz)|[21M]|md5: 5ef7d4af77fd052bb2a84ca7564a2994<br/>sha256: adc05138e65d730370ec4188c6ea10196cff6fd9ed283b95ee0e7a5965da7d34|
|[gcc-2022.00-01-trial-6.src.tgz](../../releases/download/nanoMIPS-2022.00-01-trial-6/gcc-2022.00-01-trial-6.src.tgz)|[119M]|md5: 6af83c5bade2655728bf611559ca90fc<br/>sha256: 76b4187cf79921c12494ef5ce817a3b57558fb9215973b1910146c645917ea5f|
|[smallclib-2022.00-01-trial-6.src.tgz](../../releases/download/nanoMIPS-2022.00-01-trial-6/smallclib-2022.00-01-trial-6.src.tgz)|[1M]|md5: 7a2a3f27cbdc862e207350f9a91d3e42<br/>sha256: 4d04783026cb5642c7c43780d7296e6ea8163279557f1cecb534a1c1d19533cc|
|[qemu-2022.00-01-trial-6.src.tgz](../../releases/download/nanoMIPS-2022.00-01-trial-6/qemu-2022.00-01-trial-6.src.tgz)|[90M]|md5: 4563f4400498e3b0ed7ec5ad31684455<br/>sha256: ed3fb43c1bb8037a00044f45a9f8dc36c26a3358b12a3c461d1b0c598642332d|
|[musl-2022.00-01-trial-6.src.tgz](../../releases/download/nanoMIPS-2022.00-01-trial-6/musl-2022.00-01-trial-6.src.tgz)|[1M]|md5: f0bd78b6874512c64fe4388d427b4881<br/>sha256: 057c4eb0f06da192c18ae3da67ae0b7090a21270e89988f6199508f58e46e144|
|[packages-2022.00-01-trial-6.src.tgz](../../releases/download/nanoMIPS-2022.00-01-trial-6/packages-2022.00-01-trial-6.src.tgz)|[192M]|md5: aec909df96168c95e24775c6fb5d7398<br/>sha256: ff8b8e73b1c073c3b69b99ef2e4801352d45d897fa3077e3d70f8dd03c366468|
|[python-2022.00-01-trial-6.src.tgz](../../releases/download/nanoMIPS-2022.00-01-trial-6/python-2022.00-01-trial-6.src.tgz)|[22M]|md5: 4d90815972949e0f6315add0bfe3ca7b<br/>sha256: 859298b5ac64de309adddbac46c7f1d00a3d6e12a7999d41fbd2c9d9ed24070b|


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
