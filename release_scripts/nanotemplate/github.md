# [![MTK Logo](https://cdn-www.mediatek.com/icons/mtklogo.svg)](https://www.mediatek.com) &nbsp;&nbsp; nanoMIPS GNU toolchain v2021.11-07
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Published on October 15, 2024

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
* The toolchain implements a 64-bit `time_t` type to avoid the Y2K38 issue. This must be explicitly enabled by passing the flag -muse-64bit-time_t  on the compiler command line and it has the following effects:
time_t as defined by #include <time.h> becomes 64-bit wide
  * Compiled defines macro `__nanomips_64bit_time_t__` which user code can use to detect this condition.
  * Library search paths in the link command get updated to use a standard C library with 64-bit time_t.
Note: Link command-lines that specify an explicit search path for the C library must be manually updated!
  * ABI Version field in the ELF header of output objects is incremented to 1 and  these objects can not be inter-linked with legacy objects that use a 32-bit time_t. A new linker option
 `-Wl,--allow-abi-mismatch`  can be used to force inter-linking with a broken time_t  ABI, if absolutely required.
  * Objects can be inspected with `nanomips-elf-llvm-readelf -h` and those built with the work-around enabled will exhibit an incremented ABI Version (1 instead of 0).
*Provide dummy interfaces for floating point (fenv/cfenv) headers. The nanoMIPS I7200 processor does not have hardware floating point capability. The library support provides is just sufficient to satisfy compile/link requirements for projects that refer to the interface.

#### Bug Fixes


#### Other Changes



#### Known issues

* The relocation-minimization pass in the assembler results in instructions with invalid branch targets in some cases. This pass is disabled by default and it is advisable to keep it disabled until further notice.

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
|[Linux x64](../../releases/download/nanoMIPS-2021.11-07/MediaTek.GNU.Tools.2021.11-07.for.nanoMIPS.Bare.Metal.CentOS-6.x86_64.tgz) (.tgz)|[131M]|md5: 3331a027b2096d7efc9c01eff6b12412<br/>sha256: fcdf0afb376c4ba5c9f323f0f43a6da75664e4c0f16db4735c8d08616d43f8cf|
|[Windows 64](../../releases/download/nanoMIPS-2021.11-07/MediaTek.GNU.Tools.2021.11-07.for.nanoMIPS.Bare.Metal.Windows.x86_64.tgz) (.tgz)|[109M]|md5: 0fd4476f0b03ee5c504bf03122944e21<br/>sha256: cae349f3844c31bac3c3e457e75e368996c9c491e1ada25363e8aab3eb536c66|
|[Linux x86](../../releases/download/nanoMIPS-2021.11-07/MediaTek.GNU.Tools.2021.11-07.for.nanoMIPS.Bare.Metal.CentOS-6.x86.tgz) (.tgz)|[136M]|md5: 6dfb96acbb1b34d2d2e2b839a3d87deb<br/>sha256: 187c6f4f7b0e6096f24d67ca50367d753b748157f2c750d2ac14e021e026bf52|
|[Windows x86](../../releases/download/nanoMIPS-2021.11-07/MediaTek.GNU.Tools.2021.11-07.for.nanoMIPS.Bare.Metal.Windows.x86.tgz) (.tgz)|[106M]|md5: 9cdc466ab80c070bf26aee07c44582c9<br/>sha256: 4b36af39eda5a226e24db94dedceedaaec8800da126f7072169a80dea08bbcb8|
 |**MUSL/Linux Toolchain**|||
|[Linux x64](../../releases/download/nanoMIPS-2021.11-07/MediaTek.GNU.Tools.2021.11-07.for.nanoMIPS.Linux.CentOS-6.x86_64.tgz) (.tgz)|[129M]|md5: 49610f7fb4d9975c7890f0abcd3826c2<br/>sha256: 739d177d01dc092b50ad07b2d8a5e04c03b8a61464fa2ba4f1cd03661a1e8f04|
|[Windows 64](../../releases/download/nanoMIPS-2021.11-07/MediaTek.GNU.Tools.2021.11-07.for.nanoMIPS.Linux.Windows.x86_64.tgz) (.tgz)|[110M]|md5: b1977bf5d71fa3e10d80e063efaa1693<br/>sha256: 663941257cf82199817936712a81e6afe8fd7f4f5a52395474917327785857b5|
|[Linux x86](../../releases/download/nanoMIPS-2021.11-07/MediaTek.GNU.Tools.2021.11-07.for.nanoMIPS.Linux.CentOS-6.x86.tgz) (.tgz)|[130M]|md5: 1c9ca78344ccc05065a0f0d8133a6456<br/>sha256: b5b7f39d6ed805a359d64e4d9f7a9fc05652b989ab21fefcdb402239494b35a5|
|[Windows x86](../../releases/download/nanoMIPS-2021.11-07/MediaTek.GNU.Tools.2021.11-07.for.nanoMIPS.Linux.Windows.x86.tgz) (.tgz)|[106M]|md5: a8d6299e78303d5136d6d18aca27ea29<br/>sha256: da327cc8217e323267721b71ff47fc338135f104f3285223d3ab1366bc2e1985|


#### Source Components
|Component|Size|Checksum|
|:--------|:---|:-------|
|[binutils-2021.11-07.src.tar.gz](../../releases/download/nanoMIPS-2021.11-07/binutils-2021.11-07.src.tar.gz)|[51M]|md5: b49fc252b915b5d19f5be92d608dff13<br/>sha256: 103763556c65a584fdd655258874765d41eb2ba6e40985dd3a2689fc1670a8db|
|[gdb-2021.11-07.src.tar.gz](../../releases/download/nanoMIPS-2021.11-07/gdb-2021.11-07.src.tar.gz)|[51M]|md5: 50b29bc9542f25351a591ba4ecbc0c22<br/>sha256: 27527090024fb68b81c4910e48dd634bf05c8e1ddb47700352f8a72bc05c3284|
|[gold-2021.11-07.src.tar.gz](../../releases/download/nanoMIPS-2021.11-07/gold-2021.11-07.src.tar.gz)|[52M]|md5: 68c1b2c9091aa3b153aa97cffc86b37c<br/>sha256: dca8d373463460da99c09cb92a88b3c6770f066d1824a8b6516436ace49a3b03|
|[newlib-2021.11-07.src.tar.gz](../../releases/download/nanoMIPS-2021.11-07/newlib-2021.11-07.src.tar.gz)|[20M]|md5: d70f15d9bb6ae760b27ea174abfc7afd<br/>sha256: f5e7bd326bf2185b0ac4bb7b8c6c7d606e6beaf2b80a752fb3a9b3c6af8729b0|
|[gcc-2021.11-07.src.tar.gz](../../releases/download/nanoMIPS-2021.11-07/gcc-2021.11-07.src.tar.gz)|[112M]|md5: e35c4137878e3510526c1ea22474c58a<br/>sha256: 3dd8062732f3668b87164f51309459fa2c48d76626ce495b98ab8e7e09cc3cec|
|[smallclib-2021.11-07.src.tar.gz](../../releases/download/nanoMIPS-2021.11-07/smallclib-2021.11-07.src.tar.gz)|[1M]|md5: fba6ac550bc49f509860e3e06ba6e447<br/>sha256: ead8234605f2daaf10fe8dc9f11a486c811f9155cb60207a55b4d0700031d677|
|[qemu-2021.11-07.src.tar.gz](../../releases/download/nanoMIPS-2021.11-07/qemu-2021.11-07.src.tar.gz)|[11M]|md5: f64003c4a44d90b98ca98f3ea14427bd<br/>sha256: f0d52dbd2d653108a5a75c1718476f0ae7c5895f913533d48785555b8dfaefc7|
|[musl-2021.11-07.src.tar.gz](../../releases/download/nanoMIPS-2021.11-07/musl-2021.11-07.src.tar.gz)|[1M]|md5: 99f82cd54b9cce1493abe6b1b9c14e2e<br/>sha256: 3627bc31278aca07114383b6c88d66ea4582e8f3ce88e262bd4f2227279ebe6d|
|[packages-2021.11-07.src.tar.gz](../../releases/download/nanoMIPS-2021.11-07/packages-2021.11-07.src.tar.gz)|[189M]|md5: 43cb183ecd5eb7c15eb09b83874d3db3<br/>sha256: e20f193f9d66280cfa7f5ac34b5c6184c984bdc23c969b9f068743311d82dc8f|
|[python-2021.11-07.src.tar.gz](../../releases/download/nanoMIPS-2021.11-07/python-2021.11-07.src.tar.gz)|[16M]|md5: 1ede895e9f32dbfcf5b7230a81f34d0a<br/>sha256: c8f98674db913b3a3d0c9356e21dcfc7a49de6e5dd72a330b154448a450ba511|


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
