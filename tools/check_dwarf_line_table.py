#!/usr/bin/env python3

import os
import sys
import re
import subprocess

if len(sys.argv) != 2:
    print("Syntax: %s <elf>" % sys.argv[0])
    exit(2)

elf = sys.argv[1]


line_addresses = []
instruction_addresses = {}
bad_addresses = {}

# ---

print("Getting disassembly from %s..." % elf)
sys.stdout.flush()
p = subprocess.Popen(["nanomips-elf-objdump", "-w", "-d", elf], stdout=subprocess.PIPE)
bad_addr = None
for x in p.stdout.readlines():
    l = x.decode().rstrip()
    m = re.match("0*([0-9a-f]+):", l)
    if m:
        pc = int(m.group(1), 16)
        if bad_addr == None:
            bad_addr = pc + 2
        else:
            while bad_addr < pc:
                bad_addresses[bad_addr] = True
                bad_addr += 2
            bad_addr = pc + 2
        assert not pc in bad_addresses
        instruction_addresses[pc] = True


print("Got %d instruction addresses" % len(instruction_addresses))
sys.stdout.flush()

# ---

good = 0
bad = 0

print("Getting line info from %s..." % elf)
sys.stdout.flush()
p = subprocess.Popen(["nanomips-elf-llvm-dwarfdump", "--debug-line", elf], stdout=subprocess.PIPE)

for x in p.stdout.readlines():
    l = x.decode().rstrip()
    m = re.match("0x0*([0-9a-f]+)\s+[0-9]+.*", l)
    if m:
        addr = int(m.group(1), 16)
#        if addr in instruction_addresses:
#            good += 1
#        else:
#            bad += 1
#            print("Bad instruction address %s in '%s'" % (addr, l))
        if addr in bad_addresses:
            bad += 1
            print("Bad instruction address %s in '%s'" % (hex(addr), l))
        else:
            good += 1

print("Checked %d good addresses, %d bad addresses" % (good, bad))
