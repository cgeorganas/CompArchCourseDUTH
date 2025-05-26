# This verification benchmark will set "a0" to a
# non zero value if the result does not match the expected value.



# "ADD" benchmark

# Test 1
li		a1, 0x29
li		a2, 0x4c
li		a3, 0x75
add		a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 0x3f
li		a2, 0x52
li		a3, 0x91
add		a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, 0x100
li		a2, 0x0
li		a3, 0x100
add		a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, 0xffffffff
li		a2, 0x1
li		a3, 0x0
add		a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 0xffffffff
li		a2, 0x2
li		a3, 0x1
add		a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 0xffffffff
li		a2, 0xffffffff
li		a3, 0xfffffffe
add		a4, a1, a2
xor		a0, a3, a4



# "SUB" benchmark

# Test 1
li		a1, 0x93
li		a2, 0x55
li		a3, 0x3e
sub		a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 0x63
li		a2, 0x68
li		a3, 0xfffffffb
sub		a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, 0x100
li		a2, 0x0
li		a3, 0x100
sub		a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, 0x0
li		a2, 0x1
li		a3, 0xffffffff
sub		a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 0x0
li		a2, 0xf
li		a3, 0xfffffff1
sub		a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 0x1234
li		a2, 0x1234
li		a3, 0x0
sub		a4, a1, a2
xor		a0, a3, a4



# "SLL" benchmark

# Test 1
li		a1, 0x1
li		a2, 0x1
li		a3, 0x2
sll		a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 0x1234
li		a2, 0x4
li		a3, 0x12340
sll		a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, 0xffffffff
li		a2, 0x2
li		a3, 0xfffffffc
sll		a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, 0x11111111
li		a2, 0x1f
li		a3, 0x80000000
sll		a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 0x11111111
li		a2, 0xf1f
li		a3, 0x80000000
sll		a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 0x80000000
li		a2, 0x1
li		a3, 0x0
sll		a4, a1, a2
xor		a0, a3, a4



# "SLT" benchmark

# Test 1
li		a1, 0x2
li		a2, 0x1
li		a3, 0x0
slt		a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 0x1
li		a2, 0x2
li		a3, 0x1
slt		a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, 0x363
li		a2, 0x275
li		a3, 0x0
slt		a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, 0x264
li		a2, 0x784
li		a3, 0x1
slt		a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 0xffffffff
li		a2, 0x1
li		a3, 0x1
slt		a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 0xffffffff
li		a2, 0xfffffffe
li		a3, 0x0
slt		a4, a1, a2
xor		a0, a3, a4



# "SLTU" benchmark

# Test 1
li		a1, 0x2
li		a2, 0x1
li		a3, 0x0
sltu	a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 0x1
li		a2, 0x2
li		a3, 0x1
sltu	a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, 0x363
li		a2, 0x275
li		a3, 0x0
sltu	a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, 0x264
li		a2, 0x784
li		a3, 0x1
sltu	a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 0xffffffff
li		a2, 0x1
li		a3, 0x0
sltu	a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 0xffffffff
li		a2, 0xfffffffe
li		a3, 0x0
sltu	a4, a1, a2
xor		a0, a3, a4



# "XOR" benchmark

# Test 1
li		a1, 0x0
li		a2, 0x1
li		a3, 0x1
xor		a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 0x1
li		a2, 0x3
li		a3, 0x2
xor		a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, 0x378
li		a2, 0x378
li		a3, 0x0
xor		a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, 0x284
li		a2, 0x0
li		a3, 0x284
xor		a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 0x33333333
li		a2, 0xcccccccc
li		a3, 0xffffffff
xor		a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 0x33333333
li		a2, 0x22221111
li		a3, 0x11112222
xor		a4, a1, a2
xor		a0, a3, a4



# "SRL" benchmark

# Test 1
li		a1, 0x2
li		a2, 0x1
li		a3, 0x1
srl		a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 0x12340
li		a2, 0x4
li		a3, 0x1234
srl		a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, 0xffffffff
li		a2, 0x4
li		a3, 0x0fffffff
srl		a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, 0x88888888
li		a2, 0x1f
li		a3, 0x1
srl		a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 0x88888888
li		a2, 0xf1f
li		a3, 0x1
srl		a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 0x1
li		a2, 0x1
li		a3, 0x0
srl		a4, a1, a2
xor		a0, a3, a4



# "SRA" benchmark

# Test 1
li		a1, 0x2
li		a2, 0x1
li		a3, 0x1
sra		a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 0x12340
li		a2, 0x4
li		a3, 0x1234
sra		a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, 0xffffffff
li		a2, 0x4
li		a3, 0xffffffff
sra		a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, 0x88888888
li		a2, 0x1f
li		a3, 0xffffffff
sra		a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 0x88888888
li		a2, 0xf1f
li		a3, 0xffffffff
sra		a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 0x1
li		a2, 0x1
li		a3, 0x0
sra		a4, a1, a2
xor		a0, a3, a4



# "OR" benchmark

# Test 1
li		a1, 0xff00
li		a2, 0x00ff
li		a3, 0xffff
or		a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 0xf000
li		a2, 0x00ff
li		a3, 0xf0ff
or		a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, 0x645
li		a2, 0x645
li		a3, 0x645
or		a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, 0x734
li		a2, 0x734
li		a3, 0x734
or		a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 0xffffffff
li		a2, 0x12345678
li		a3, 0xffffffff
or		a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 0x0
li		a2, 0x12345678
li		a3, 0x12345678
or		a4, a1, a2
xor		a0, a3, a4



# "AND" benchmark

# Test 1
li		a1, 0xff00
li		a2, 0x00ff
li		a3, 0x0000
and		a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 0xfff0
li		a2, 0x00ff
li		a3, 0x00f0
and		a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, 0x474
li		a2, 0x474
li		a3, 0x474
and		a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, 0x141
li		a2, 0x141
li		a3, 0x141
and		a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 0xffffffff
li		a2, 0x12345678
li		a3, 0x12345678
and		a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 0x0
li		a2, 0x12345678
li		a3, 0x0
and		a4, a1, a2
xor		a0, a3, a4
