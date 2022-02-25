import sys

infile = open(sys.argv[1], 'rt')
outfile = open(sys.argv[2], 'wb')

for char in infile.read():
    # little/big is irrelevant since it's 1 byte
    outfile.write(int(char, 16).to_bytes(1, 'little'))
