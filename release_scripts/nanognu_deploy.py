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
import pwd
import urllib
import urllib.request
import urllib.error
from string import Template

# check python version
if (sys.version_info <= (3, 0)):
  print ("ERROR: script needs at least python3")
  sys.exit(1)

# Set the version of the tools to release
if len(sys.argv) < 2:
  print("ERROR: Please specify version number")
  sys.exit(1)
else:
  version = sys.argv[1]

if len(sys.argv) < 3:
  print("ERROR: Please specify Unix username with install rights")
  sys.exit(1)
else:
  user = sys.argv[2]
  try:
    pwd.getpwnam(user)
  except Exception as e:
    print(e)
    sys.exit(1)

my_env = os.environ
# if SSH_AGENT_PID is not already set, try to read from .keyring or start
# a new agent
if 'SSH_AGENT_PID' not in my_env:
  if os.path.isfile(os.path.join(os.environ['HOME'], '.keyring')):
    f = open(os.path.join(os.environ['HOME'], '.keyring'), mode='r')
    txt = f.read()
    f.close()
  else:
    txt = subprocess.check_output["ssh-agent", "-s"]
    f = open(os.path.join(os.environ['HOME'], '.keyring'), mode='w')
    f.write(txt)
    f.close()
  x = re.search ('SSH_AGENT_PID=([0-9]+);', txt)
  my_env['SSH_AGENT_PID'] = x.group(1)
  
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


for target in ["nanomips-elf", "nanomips-linux-musl"]:
  host='x86_64-pc-linux-gnu'
  tarball = "MediaTek.GNU.Tools.%s.for.nanoMIPS.%s.%s.tar.gz" % (version, target_to_name[target], host_to_name[host])
  release_url="http://mtksap70.mediatek.inc/releases/download/nanoMIPS-%s/%s" % (version, tarball)
  req=urllib.request.Request(release_url)

  install_path=os.path.join("/mtkoss", "Thor", "gcc-%s" % target.split('-')[1])
  install_dir=os.path.join(install_path, version)
  linkpath=os.path.join("/mtkoss", "Modules", "3.2.6", "x86_64", "modulefiles", "Thor",
                          "gcc-%s" % target.split('-')[1], version)
  if os.path.isdir(install_dir) or os.path.isfile(linkpath):
    rd=input("Warning: Toolkit already deployed at %s. delete/redeploy? [D/R]: " % install_dir).lower().strip()
    print ("Deleting " + install_dir)
    ret=subprocess.call(["ssh", user + "@localhost", "rm", "-rf", install_dir], env=my_env)
    if os.path.islink(linkpath):
      print ("Deleting " + linkpath)
      ret=subprocess.call(["ssh", user + "@localhost", "rm", "-f", linkpath], env=my_env)
    if rd[:1] == 'd':
      continue

  tarball = os.path.join("/tmp", tarball)
  if os.path.exists (tarball):
    yn=input("Warning: Toolkit tarball already exists, overwrite? [Y/N]: ").lower().strip()
    if yn[:1] == 'y':
      os.remove(tarball)
      
  if not os.path.exists(tarball):
    try:
      u=urllib.request.urlopen(req)
    except urllib.error.URLError as e:
      print ("ERROR: Unable to get file %s from release URL" % tarball)
      sys.exit(1)
    else:
      print ("Dowloading %s" % release_url)
      f = open(tarball, "wb")
      f.write(u.read())
      f.close()

  ret = subprocess.call(["setfacl", "-m", "u:%s:r" % user, tarball])
  if ret != 0:
    ret = subprocess.call(["chmod", "o+r", tarball])
  if ret != 0:
    print("WARNING: unable to grant read-access to %s, continuing with install anyway")

  print("Installing %s toolchain v%s" % (target, version))
  extractcmd = ["ssh", user + "@localhost", "tar", "-x", "-C",
                install_path, "--strip-components=1", "-f",
                os.path.join (os.getcwd(), tarball)]
  ret=subprocess.call(extractcmd, env=my_env)

  if ret != 0:
    print ("ERROR: Failed to deploy %s toolchain to %s" % (target_to_name[target], install_path))
    break
  else:
    print ("Deployed %s toolchain to %s" % (target_to_name[target], install_path))
    os.remove(tarball)

  ret = subprocess.call(["setfacl", "-R", "-m", "o:rX", install_dir])
  if ret != 0:
    ret = subprocess.call(["chmod", "-R", "o+rX", install_dir)
  if ret != 0:
    print("WARNING: unable to grant read-access to %s" % install_dir)

  rootmodule=os.path.join("/mtkoss", "Thor", "gcc-elf", "2019.03-07", "2019.03-07")
  versionmodule=os.path.join("/mtkoss", "Thor", "gcc-%s" % target.split('-')[1], version, version)
  cmd = ["ssh", user + "@localhost", "cp", rootmodule, versionmodule]
  ret=subprocess.call(cmd, env=my_env)
  linkpath=os.path.join("/mtkoss", "Modules", "3.2.6", "x86_64", "modulefiles", "Thor",
        "gcc-%s" % target.split('-')[1], version)
  linktarget=os.path.join("..", "..", "..", "..", "..", "..", "Thor",
        "gcc-%s" % target.split('-')[1], version, version)
  cmd = ["ssh", user + "@localhost", "ln", "-s", linktarget, linkpath]
  ret=subprocess.call(cmd, env=my_env)
  if ret != 0:
    print ("ERROR: Failed to link %s -> %s" % (linkpath, linktarget))
    break
  else:
    print ("%s -> %s " %  (linkpath, linktarget))
  linkpath=os.path.join("/mtkoss", "Thor", "gcc-%s" % target.split('-')[1], version, "linux")
  linktarget=os.path.join("..",  version)
  cmd = ["ssh", user + "@localhost", "ln", "-s", linktarget, linkpath]
  ret=subprocess.call(cmd, env=my_env)
  if ret != 0:
    print ("ERROR: Failed to link %s -> %s" % (linkpath, linktarget))
    break
  else:
    print ("%s -> %s " %  (linkpath, linktarget))

sys.exit(ret)
