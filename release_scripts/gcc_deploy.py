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
import socket
from string import Template

# check python version
if (sys.version_info <= (3, 0)):
  print("ERROR: script needs at least python3")
  sys.exit(1)

# Set the version of the tools to release
if len(sys.argv) < 2:
  print("ERROR: Please specify version for toolchain tarball")
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
  x = re.search('SSH_AGENT_PID=([0-9]+);', txt)
  my_env['SSH_AGENT_PID'] = x.group(1)
  
scriptpath=os.path.dirname(os.path.realpath(__file__))

if os.path.exists(os.path.join("/mtkoss", "Modules", "4.2.4")):
  module_version="4.2.4"
else:
  module_version="3.2.6"

module_path=os.path.join("/mtkoss", "Modules", module_version)

for target in ["nanomips-elf"]:
  tarball = "MediaTek.GNU.Tools.%s.%s_x86_64-pc-linux-gnu.tgz" % (version, target)

  if not os.path.exists(os.path.join(os.getcwd(), tarball)):
    tarball = "MediaTek.GNU.Tools.%s.for.nanoMIPS.Bare.Metal.CentOS-6.x86_64.tar.gz" % version

  install_path=os.path.join("/mtkoss", "Thor", "gcc-elf")
  install_dir=os.path.join(install_path, version)

  linkpath=os.path.join(module_path, "x86_64", "modulefiles", "Thor", "gcc-elf")
  linkpath=os.path.join(linkpath, version)

  if os.path.isdir(install_dir) or os.path.isfile(linkpath):
    rd=input("Warning: Toolkit already deployed at %s. delete/redeploy? [D/R]: " % install_dir).lower().strip()
    print("Deleting " + install_dir)
    ret=subprocess.call(["ssh", user + "@" + socket.gethostname(), "rm", "-rf", install_dir], env=my_env)
    if os.path.islink(linkpath):
      print("Deleting " + linkpath)
      ret=subprocess.call(["ssh", user + "@" + socket.gethostname(), "rm", "-f", linkpath], env=my_env)
    if rd[:1] == 'd':
      continue

  tarball = os.path.join(os.getcwd(), tarball)
  try:
    os.stat(tarball)
  except OSError as e:
    print('Toolkit tarball file not found: ' + tarball)
    sys.exit(e)

  # tarball needs to be unpacked as the privileged user for installation
  ret = subprocess.call(["setfacl", "-m", "o:rX", tarball])
  if ret != 0:
    ret = subprocess.call(["chmod", "o+r", tarball])
  if ret != 0:
    print("WARNING: unable to grant read-access to %s, continuing with install anyway" % tarball)

  print("Installing %s GNU toolchain v%s" % (target, version))
  extractcmd = ["ssh", user + "@" + socket.gethostname(), "tar", "-x", "-C",
                install_path, "--strip-components=1", "-f",
                os.path.join(os.getcwd(), tarball)]
  ret=subprocess.call(extractcmd, env=my_env)

  if ret != 0:
    print("ERROR: Failed to deploy GNU toolchain to " + install_path)
    break
  else:
    print("Deployed GNU toolchain to " + install_path)

  moduletext="""#%Module1.0
while { [file type $ModulesCurrentModulefile] eq "link" } {
set ModulesCurrentModulefile [ file join [file dirname $ModulesCurrentModulefile] [file readlink $ModulesCurrentModulefile] ]
}
set toolsroot [file dirname [file normalize $ModulesCurrentModulefile]]
#module load dep/1 otherdep/2 # load module dependencies
prepend-path PATH $toolsroot/bin
"""
  f = open(version, mode='w')
  f.write(moduletext)
  f.close()
  ret = subprocess.call(["scp", version, 
                         user + "@" + socket.gethostname() + ":" + 
                         os.path.join(install_dir, version)], env=my_env)  
  os.remove(version)

  ret = subprocess.call(["ssh", user + "@" + socket.gethostname(),
                         "setfacl", "-R", "-m", "o:rX", install_dir], env=my_env)
  if ret != 0:
    ret = subprocess.call(["ssh", user + "@" + socket.gethostname(),
                           "chmod", "-R", "o+rX", install_dir], env=my_env)
  if ret != 0:
    print("WARNING: unable to grant read-access to %s" % install_dir)

  linktarget=os.path.join("..", "..", "..", "..", "..", "..", "Thor",
        "gcc-elf", version, version)
  cmd = ["ssh", user +  "@" + socket.gethostname(), "ln", "-s", linktarget, linkpath]
  ret=subprocess.call(cmd, env=my_env)
  if ret != 0:
    print("ERROR: Failed to link %s -> %s" % (linkpath, linktarget))
    break
  else:
    print("%s -> %s " %  (linkpath, linktarget))

sys.exit(ret)
