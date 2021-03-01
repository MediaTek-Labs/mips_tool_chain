# [![MTK Logo](https://cdn-www.mediatek.com/icons/mtklogo.svg)](https://www.mediatek.com) &nbsp;&nbsp; nanoMIPS GNU toolchain v2021.02-01
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Published on February 28, 2021

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

* Add support for the *-mfunc-opt-list* command-line option to control optimizations on a per-function basis

* Allow linking against version of *libstdc++.a* built with *-fno-rtti* and *-fno-exceptions* with the link-time command-line option *-nortti-libstdc++*.

#### Bug Fixes

 * Fix bad code generation from movep optimization under certain conditions. Option *-mno-movep-follow-copy-chains* can be used to disable this part of the optimization, if the issue persists.

#### Other Changes

* Change newlib's internal *_dtoa_r* implementation to return a newly malloc'd string, instead
of reusing a static one. Callers of _dtoa_r are now expected to free the resulting string.
This enables the printf family of functions to safely format floating-point values in a
multi-threaded context, but is otherwise transparent to users.

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
|[Linux x86](../../releases/download/nanoMIPS-2021.02-01/MediaTek.GNU.Tools.2021.02-01.for.nanoMIPS.Bare.Metal.CentOS-6.x86.tar.gz) (.tar.gz)|[120M]|md5: 2af105592f8adb3eeaecb74ade36f99f<br/>sha256: 6c709eadbc8cd9d9856a4c078cf8c710cb939e9733b14d3d5867dffbc9f07c1a|
|[Windows x86](../../releases/download/nanoMIPS-2021.02-01/MediaTek.GNU.Tools.2021.02-01.for.nanoMIPS.Bare.Metal.Windows.x86.tar.gz) (.tar.gz)|[90M]|md5: 6b0851c1dd1bab202bafd5c60ddb295f<br/>sha256: a05be8c273f149665c612a315608277dcbb8a8b7cd800128855d52697d4475f7|
|[Linux x64](../../releases/download/nanoMIPS-2021.02-01/MediaTek.GNU.Tools.2021.02-01.for.nanoMIPS.Bare.Metal.CentOS-6.x86_64.tar.gz) (.tar.gz)|[118M]|md5: 166a2305d95bb69addae892e08da622a<br/>sha256: 932efb4c6c9d88abd6cc9ce9c8c3f2cd1dd927d374806dfad4059f7ab714a5e0|
|[Windows 64](../../releases/download/nanoMIPS-2021.02-01/MediaTek.GNU.Tools.2021.02-01.for.nanoMIPS.Bare.Metal.Windows.x86_64.tar.gz) (.tar.gz)|[93M]|md5: 60957161a23814911858a97d80791efa<br/>sha256: e1abc1e69ed9e9f494285d78c9904d921d0ca86523c3a5529ad6c4a3bda29bc5|
 |**MUSL/Linux Toolchain**|||
|[Linux x86](../../releases/download/nanoMIPS-2021.02-01/MediaTek.GNU.Tools.2021.02-01.for.nanoMIPS.Linux.CentOS-6.x86.tar.gz) (.tar.gz)|[130M]|md5: 6ee2c44a29ea3236779e74eef4b43a02<br/>sha256: 3e53f14b3948c66ea0e8c92bdc173110c56e782c42ba4fce9bb3d9c8b29297f9|
|[Windows x86](../../releases/download/nanoMIPS-2021.02-01/MediaTek.GNU.Tools.2021.02-01.for.nanoMIPS.Linux.Windows.x86.tar.gz) (.tar.gz)|[106M]|md5: 1f20bb8172077539a74407783fc5d262<br/>sha256: 8c1d2a53d8a5f3ff48432fd70448f58008bdda5900d78cf0459e4c54a85b40c5|
|[Linux x64](../../releases/download/nanoMIPS-2021.02-01/MediaTek.GNU.Tools.2021.02-01.for.nanoMIPS.Linux.CentOS-6.x86_64.tar.gz) (.tar.gz)|[129M]|md5: 99b68ac4c752e0ae22a3fbb0873dcb23<br/>sha256: ffcd71b8cfaaee5b733e5df5aade9d0a0fe218e91141fe3fa4bf13aaf232a8c7|
|[Windows 64](../../releases/download/nanoMIPS-2021.02-01/MediaTek.GNU.Tools.2021.02-01.for.nanoMIPS.Linux.Windows.x86_64.tar.gz) (.tar.gz)|[109M]|md5: c04c67697a3056e720249857ff897a15<br/>sha256: 4c899e51cff0745b1816e10c484b6e912e1cbce379e0f0c666dd1027bfcc1fa3|


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2021.02-01.src.tar.gz](../../releases/download/nanoMIPS-2021.02-01/binutils-2021.02-01.src.tar.gz)|[51M]|md5: ae790db7774fa3e72f2e1f8bd3460ffc<br/>sha256: ea9b79c1805c5051f0930f4db1cd07b9110d0e1fb7134b18c4a6e538656eba31|
|[gdb-2021.02-01.src.tar.gz](../../releases/download/nanoMIPS-2021.02-01/gdb-2021.02-01.src.tar.gz)|[51M]|md5: 80d4a3fc2ae08f79b6766f634dab0075<br/>sha256: 76ff22b40edb1af4784873e4086024524d19fc2e43469ed86e86c818a611dd8a|
|[gold-2021.02-01.src.tar.gz](../../releases/download/nanoMIPS-2021.02-01/gold-2021.02-01.src.tar.gz)|[52M]|md5: f4d6f06b3a5c20295e0ba2edf2afd657<br/>sha256: 8c8e82483e94d3c66e22e0fc374b382012f4dc08653d3633579baac9e6444367|
|[newlib-2021.02-01.src.tar.gz](../../releases/download/nanoMIPS-2021.02-01/newlib-2021.02-01.src.tar.gz)|[19M]|md5: dc301904c3bc076005fc957f5673973e<br/>sha256: 9b07de4057feaefc54b31ce4e51d1b9de591e81cf2e5027b31967a211bf1d22e|
|[gcc-2021.02-01.src.tar.gz](../../releases/download/nanoMIPS-2021.02-01/gcc-2021.02-01.src.tar.gz)|[112M]|md5: 86d17056a121f86dbc96c77b56691081<br/>sha256: af4cd85e78c510933634eb467935915642a31ce0bfc4a4f2759cb02087387cd5|
|[smallclib-2021.02-01.src.tar.gz](../../releases/download/nanoMIPS-2021.02-01/smallclib-2021.02-01.src.tar.gz)|[1M]|md5: 9d8702b0f555c765b8ad8efbdce6bd5c<br/>sha256: c208fb2ef73236a1ea98ca67c841aab3e49a24f4f88737ba250c928d262e25af|
|[qemu-2021.02-01.src.tar.gz](../../releases/download/nanoMIPS-2021.02-01/qemu-2021.02-01.src.tar.gz)|[11M]|md5: 765b363a59f1f0916867255bb4175579<br/>sha256: dc49020e8b4478b56cf6684f5592445c977c6d2095c9f64b701e80a6ac9964ea|
|[musl-2021.02-01.src.tar.gz](../../releases/download/nanoMIPS-2021.02-01/musl-2021.02-01.src.tar.gz)|[1M]|md5: 5e55bbd96ea9ade07034a578801703bc<br/>sha256: 20a285c7847733c0307f934023e88d2338c7b128323edd5504adf498360fed4d|
|[packages-2021.02-01.src.tar.gz](../../releases/download/nanoMIPS-2021.02-01/packages-2021.02-01.src.tar.gz)|[189M]|md5: f9745361e2f43928be331b05908dc096<br/>sha256: ff4965902171ed3cd610d2430c72f0c2b3d2de863b1261d273fd7a751432c61f|
|[python-2021.02-01.src.tar.gz](../../releases/download/nanoMIPS-2021.02-01/python-2021.02-01.src.tar.gz)|[16M]|md5: 3e9bff136d487bab41fa77d077c6b426<br/>sha256: a2ea83c3bbba276212c034ac931e29df3d567fdbd7455c1e26388fa44e1db3b8|


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
