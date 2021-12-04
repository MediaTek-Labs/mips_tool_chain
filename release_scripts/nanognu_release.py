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
  for target in ["nanomips-elf", "nanomips-linux-musl"]:
    for host in ["i686-pc-linux-gnu", "i686-w64-mingw32", "x86_64-pc-linux-gnu", "x86_64-w64-mingw32"]:
      if not os.path.exists ("%s_%s.tgz" % (target, host)):
        print ("ERROR: Toolkit tarball file missing %s_%s.tgz" % (target, host))
        sys.exit(1)
      filename = "MediaTek.GNU.Tools.%s.for.nanoMIPS.%s.%s.tar.gz" % (version, target_to_name[target], host_to_name[host])
      if os.path.exists (filename):
        print ("ERROR: Toolkit tarball destination already exists %s" % filename)
        sys.exit(1)

  components = ["binutils", "gdb", "gold", "newlib", "gcc", "smallclib", "qemu", "musl", "packages", "python"]
  for component in components:
    filenameraw = "%s-%s.src.tar.gz" % (component, version)
    filename = "src/%s" % (filenameraw)
    if not os.path.exists (filename):
      print ("ERROR: source package for %s (%s) missing" % (component, filename))
      sys.exit(1)

  for target in ["nanomips-elf", "nanomips-linux-musl"]:
    binaries=""
    for host in ["x86_64-pc-linux-gnu", "x86_64-w64-mingw32", "i686-pc-linux-gnu", "i686-w64-mingw32"]:
      filename = "MediaTek.GNU.Tools.%s.for.nanoMIPS.%s.%s.tar.gz" % (version, target_to_name[target], host_to_name[host])
      os.rename("%s_%s.tgz" % (target, host), filename)
      varsuffix = "%s %s" % (host_to_var[host], target_to_var[target])
      # Size in megabytes
      thesize = os.path.getsize(filename) >> 20
      # md5sum
      themd5 = md5sum(filename)
      # sha256sum
      thesha256 = sha256sum(filename)
      binaries = (binaries + "|[%s](../../releases/download/nanoMIPS-%s/%s) (.tar.gz)|[%sM]|md5: %s<br/>sha256: %s|\n"
                  % (host_to_var[host], version, filename, thesize, themd5, thesha256))
    if target is "nanomips-elf":
      elf_binaries = binaries
    else:
      linux_binaries = binaries

  sources = ""
  for component in components:
    filenameraw = "%s-%s.src.tar.gz" % (component, version)
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
    filenameraw = "%s-%s.src.tar.gz" % (component, version)
    filename = "src/%s" % (filenameraw)
    shutil.move(filename, filenameraw)
  shutil.rmtree("src")

if True:
  f = open("%s/nanotemplate/github.md.tmpl" % scriptpath, mode='r')
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
       'LINUXBINARIES' : linux_binaries,
       'SOURCES' : sources}

  # if os.path.exists ("docs"):
  #   found = False
  #   newnotes += "\t\t<h3 id=\"" + version + "Docs\">" + version + " Documentation Updates</h3>\n"
  #   newnotes += "\t\t<ul>\n"
  #   for doc in os.listdir ("docs"):
  #     if fnmatch.fnmatch(doc, '*.pdf'):
  #       found = True
  #       [dname,dver] = os.path.basename(doc).split('0', 1)
  #       dname = dname.replace('_', ' ')
  #       if "DN" in dver:
  #         dver = (dver.split ("DN", 1))[0].replace('_','.')
  #       else:
  #         dver = (dver.split (".", 1))[0].replace('_','.')
  #       newnotes += "\t\t<li><a href=\"../" + version + "/docs/" + doc + "\">" + dname + ", " + dver + "</a></li>\n"
  #   if not found:
  #     newnotes += "\t\t<li>None</li>\n"
  #   newnotes += "\t\t</ul>\n"

  print("Updating %s/github.md" % scriptpath)
  f = open("%s/nanotemplate/github.md" % scriptpath, 'w')
  f.write(template.substitute(**sub))
  f.close()

if True:
  rel_path="/worktmp/releases"

  templatedir = os.path.join (scriptpath, "nanotemplate")
  print("Copy release website from %s" % templatedir)
  html = os.path.join (rel_path, "tag", "nanoMIPS-%s" % version)
  md = os.path.join(templatedir, "github.md")
  ret=subprocess.call (["pandoc", "-f", "markdown+raw_html",
                        "-t", "html",
                        "-o", html,
                        md])

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
  shutil.copyfile(md, os.path.join (rel_path, "tag", "nanoMIPS-%s.md" % version))

  print("Fix ownership & permissions")
  if os.stat(os.getcwd()).st_uid != os.getuid():
    ret=subprocess.call (["sudo", "chown", "-R", os.getlogin()+":srv_md_shaolin", os.getcwd()])
  else:
    ret=subprocess.call (["chgrp", "-R", "srv_md_shaolin", os.getcwd()])
  if ret != 0:
    print("ERROR: Failed to change ownership of " + os.getcwd())
  ret = subprocess.call (["chmod", "-R", "g+w,o-w", os.getcwd()])
  if ret != 0:
    print("ERROR: Failed to set permissions on " + os.getcwd())

  if os.access(rel_path, os.X_OK | os.W_OK):
    print("Copy toolchain to " + rel_path)
    shutil.copytree(os.getcwd(), os.path.join(rel_path, "download", "nanoMIPS-%s" % version))
  else:
    print("No write permissions on %s, not copying toolchain to release area" % mipsswrel_path)

#   mipsswinst_path = "/projects/mipssw/toolchains"
#   if os.access(mipsswinst_path, os.X_OK | os.W_OK):
#     tf = tarfile.open("MediaTek.GNU.Tools.Package.%s.for.nanoMIPS.Bare.Metal.CentOS-6.x86_64.tar.gz" % version,
#                       'r|gz')
#     print("Extracting x86_64 elf toolchain to " + os.path.join(mipsswinst_path, 'nanomips-elf', version))
#     if tf:
#       tf.extractall(mipsswinst_path)
#       subprocess.call (["chmod", "-R", "g+w,o-w", os.path.join(mipsswinst_path, 'nanomips-elf', version)])

#     tf = tarfile.open("MediaTek.GNU.Tools.Package.%s.for.nanoMIPS.Linux.CentOS-6.x86_64.tar.gz" % version,
#                       'r|gz')
#     print("Extracting x86_64 linux toolchain to " + os.path.join(mipsswinst_path, 'nanomips-linux-musl',  version))
#     if tf:
#       tf.extractall(mipsswinst_path)
#       subprocess.call (["chmod", "-R", "g+w,o-w", os.path.join(mipsswinst_path, 'nanomips-linux-musl', version)])
#   else:
#     print("No write permissions on %s, not installing x86_64 toolchains" % mipsswinst_path)
  for target in ["nanomips-elf", "nanomips-linux-musl"]:
    install_path=os.path.join("/mtkoss", "Thor", "gcc-%s" % target.split('-')[1])
    tarball=os.path.join(rel_path, "download", "nanoMIPS-%s" % version,
                         "MediaTek.GNU.Tools.%s.for.nanoMIPS.%s.%s.tar.gz"
                         % (version, target_to_name[target], host_to_name["x86_64-pc-linux-gnu"]))
    extractcmd = ["ssh", "srv_tcbuild001@localhost", "tar", "-x", "-C",
                  install_path, "--strip-components=1", "-f", tarball]
    print (extractcmd)
    ret=subprocess.call(extractcmd)
    if ret != 0:
      print ("ERROR: Failed to deploy %s toolchain to %s" % (target_to_name[target], install_path))
      break
    else:
      print ("Deployed %s toolchain to %s" % (target_to_name[target], install_path))
    
    rootmodule=os.path.join("/mtkoss", "Thor", "gcc-elf", "2019.03-07", "2019.03-07")
    versionmodule=os.path.join("/mtkoss", "Thor", "gcc-%s" % target.split('-')[1], version, version)
    cmd = ["ssh", "srv_tcbuild001@localhost", "cp", rootmodule, versionmodule]
    ret=subprocess.call(cmd)
#    shutil.copyfile(rootmodule, versionmodule)
    linkpath=os.path.join("/mtkoss", "Modules", "3.2.6", "x86_64", "modulefiles", "Thor",
        "gcc-%s" % target.split('-')[1], version)
    linktarget=os.path.join("..", "..", "..", "..", "..", "..", "Thor",
        "gcc-%s" % target.split('-')[1], version, version)
    cmd = ["ssh", "srv_tcbuild001@localhost", "ln", "-s", linktarget, linkpath]
    ret=subprocess.call(cmd)
    if ret != 0:
      print ("ERROR: Failed to link %s -> %s" % (linkpath, linktarget))
      break
    else:
      print ("%s -> %s " %  (linkpath, linktarget))
    linkpath=os.path.join("/mtkoss", "Thor", "gcc-%s" % target.split('-')[1], version, "linux")
    linktarget=os.path.join("..",  version)
    cmd = ["ssh", "srv_tcbuild001@localhost", "ln", "-s", linktarget, linkpath]
    ret=subprocess.call(cmd)
    if ret != 0:
      print ("ERROR: Failed to link %s -> %s" % (linkpath, linktarget))
      break
    else:
      print ("%s -> %s " %  (linkpath, linktarget))

  print("Adding website changes to git")
  ret=subprocess.call(["git", "add", os.path.join("nanotemplate", "github.md")], cwd = scriptpath)
  if ret == 0:
    ret=subprocess.call(["git", "commit", "-m", "nanoMIPS toolchain release %s" % version], cwd = scriptpath)
