#!/bin/env python3
import sys

if len(sys.argv) == 2:
    infile = sys.stdin
    outfile = open(sys.argv[1], 'wb')
elif len(sys.argv) == 3:
    infile = open(sys.argv[1], 'rt')
    outfile = open(sys.argv[2], 'wb')
else:
    print("You must provide at least one argument")
    exit(1)

for char in infile.read():
    # little/big is irrelevant since it's 1 byte
    outfile.write(int(char, 16).to_bytes(1, 'little'))
