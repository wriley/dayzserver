#!/usr/bin/python

import sys,re

if len(sys.argv) == 2:
  with open(sys.argv[1]) as f:
    content = f.readlines()
else:
  content = sys.stdin.readlines()

content = [x.strip('\n') for x in content]

# 22:52:23 "PVDZ_send: B 1-1-B:1 (Gatorcrock) REMOTE, Morphine, [B 1-1-B:1 (Gatorcrock) REMOTE,B 1-1-E:1 (Kerbo) REMOTE], 6"
regex = re.compile("PVDZ_send: .* \((.*)\) REMOTE, ([\w]+), \[.* \((.*)\) REMOTE,.* \((.*)\) REMOTE\]")

for line in content:
  result = regex.search(line)
  if result:
    source = result.group(4)
    target = result.group(3)
    item = result.group(2)
    helper = ""
    if source != target:
      helper = "MEDIC: "
    print("%s%s gave %s to %s" % (helper, source, item, target))
