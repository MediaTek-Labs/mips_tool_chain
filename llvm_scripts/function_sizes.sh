#!/bin/sh
f="$1"
if  [ ! -f "$f" ]; then
  echo "Syntax: $0 elf_file"
  exit 2
fi

readelf -s "$1" \
  | awk 'BEGIN { size = 0; }
         /FUNC/ { size += $3; }
         END { print size; }'

