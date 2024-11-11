# Prepare partial release of GNU components for LLVM+GNU composite toolchain

import hashlib
import os
import datetime
import sys
import re
import fnmatch
import shutil
import subprocess
import tarfile
import grp
from string import Template

# check python version
if (sys.version_info <= (3, 0)):
  print ("ERROR: script needs at least python3")
  sys.exit(1)

# Set the version of the tools to release
if len(sys.argv) < 2:
  print("ERROR: Please specify version number")
  sys.exit(1)

version = sys.argv[1]
if len(sys.argv) == 3:
  relnotes = sys.argv[2]
else:
  relnotes = None
today = datetime.date.today();

def md5sum(filename):
  f = open(filename, mode='rb')
  d = hashlib.md5()
  d.update(f.read())
  return d.hexdigest()

def sha256sum(filename):
  f = open(filename, mode='rb')
  d = hashlib.sha256()
  d.update(f.read())
  return d.hexdigest()

host_to_name = { "i686-pc-linux-gnu" : "CentOS-6.x86",
		 "x86_64-pc-linux-gnu" : "CentOS-6.x86_64",
		 "i686-w64-mingw32" : "Windows.x86",
		 "x86_64-w64-mingw32" : "Windows.x86_64" }

host_to_var = { "i686-pc-linux-gnu" : "Linux x86",
		"x86_64-pc-linux-gnu" : "Linux x64",
		"i686-w64-mingw32" : "Windows x86",
		"x86_64-w64-mingw32" : "Windows 64" }

target_to_name = { "nanomips-elf" : "Bare.Metal",
		   "nanomips-linux-musl" : "Linux" }

target_to_var = { "nanomips-elf" : "NE",
		  "nanomips-linux-musl" : "NLM" }

scriptpath=os.path.dirname(os.path.realpath(__file__))

if True:
  filename = "MediaTek.GNU.Tools.%s.nanomips-elf_x86_64-pc-linux-gnu.tgz" % version
  if not os.path.exists (filename):
    print ("ERROR: toolchain tarball missing : %s" % filename)
    sys.exit(1)

  components = ["binutils", "gdb", "gold", "newlib", "gcc", "smallclib", "qemu", "packages", "python"]
  for component in components:
    filenameraw = "%s-%s.src.tgz" % (component, version)
    filename = "src/%s" % (filenameraw)
    if not os.path.exists (filename):
      print ("ERROR: source package for %s (%s) missing" % (component, filename))
      sys.exit(1)

  host="x86_64-pc-linux-gnu"
  target="nanomips-elf"
  binaries=""
  filename = "MediaTek.GNU.Tools.%s.%s_%s.tgz" % (version, target, host)
  varsuffix = "%s %s" % (host_to_var[host], target_to_var[target])
  # Size in megabytes
  thesize = os.path.getsize(filename) >> 20
  # md5sum
  themd5 = md5sum(filename)
  # sha256sum
  thesha256 = sha256sum(filename)
  binaries = (binaries + "|[%s](../../releases/download/nanoMIPS-%s/%s) (.tgz)|[%sM]|md5: %s<br/>sha256: %s|\n"
          % (host_to_var[host], version, filename, thesize, themd5, thesha256))
  elf_binaries = binaries

  sources = ""
  for component in components:
    filenameraw = "%s-%s.src.tgz" % (component, version)
    filename = "src/%s" % (filenameraw)
    # Size in megabytes
    thesize = os.path.getsize(filename) >> 20
    if thesize == 0:
      thesize = 1
    # md5sum
    themd5 = md5sum(filename)
    # sha256sum
    thesha256 = sha256sum(filename)
    print("%s %s %s %s" %(filename,thesize,themd5,thesha256))
    sources = (sources + "|[%s](../../releases/download/nanoMIPS-%s/%s)|[%sM]|md5: %s<br/>sha256: %s|\n"
               % (filenameraw, version, filenameraw, thesize, themd5, thesha256))

  for component in components:
    filenameraw = "%s-%s.src.tgz" % (component, version)
    filename = "src/%s" % (filenameraw)
    shutil.move(filename, filenameraw)
  shutil.rmtree("src")

if True:
  f = open("%s/nanotemplate/github-partial.md.tmpl" % scriptpath, mode='r')
  template = Template(f.read())
  f.close()

  if relnotes:
    print("Reading release notes content from %s" % relnotes)
    f = open(relnotes, mode='r')
    content = f.read()
    f.close()
  else:
    content = ""
  # Force h4-level headings for sub-sections within release notes
  content = re.sub ("(\A|[^#])##?#? ", "\n#### ", content)

  sub={'DATE': today.strftime ("%B %d, %Y"),
       'VERSION': version,
       'RELEASENOTES' : content,
       'ELFBINARIES' : elf_binaries,
       'SOURCES' : sources}

  templatedir = os.path.join (scriptpath, "nanotemplate")
  md = os.path.join(templatedir, "github-partial.md")
  print("Updating %s/github-partial.md" % scriptpath)
  f = open("%s" % os.path.join(scriptpath, md), 'w')
  f.write(template.substitute(**sub))
  f.close()


  f = open(md, mode='r')
  content = f.read()
  f.close()
  content = content.replace("mtklogo.svg","https://cdn-www.mediatek.com/icons/mtklogo.svg")
  content = content.replace("http://mtksap70.mediatek.inc/bugzilla",
                            "https://github.com/MediaTek-Labs/nanomips-gnu-toolchain/issues")
  content = re.sub(r"(\[BZ #[0-9]+\])\([^)]*\)", r"\1", content)
  f = open(md, mode='w')
  f.write(content)
  f.close()
  shutil.copyfile(md, "nanoMIPS-%s.md" % version)

  print("Adding website changes to git")
  ret=subprocess.call(["git", "add", os.path.join("nanotemplate", "github-partial.md")], cwd = scriptpath)
  if ret == 0:
    ret=subprocess.call(["git", "commit", "-m", "nanoMIPS partial(GNU) toolchain release %s" % version], cwd = scriptpath)
