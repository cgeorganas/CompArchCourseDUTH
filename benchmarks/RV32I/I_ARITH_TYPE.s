# This verification benchmark will set "a0" to a
# non zero value if the result does not match the expected value.



# "ADDI" benchmark

# Test 1
li		a1, 0x29
li		a3, 0x75
addi	a4, a1, 0x4c
xor		a0, a3, a4

# Test 2
li		a1, 0x3f
li		a3, 0x91
addi	a4, a1, 0x52
xor		a0, a3, a4

# Test 3
li		a1, 0x100
li		a3, 0x100
addi	a4, a1, 0x0
xor		a0, a3, a4

# Test 4
li		a1, 0xffffffff
li		a3, 0x0
addi	a4, a1, 0x1
xor		a0, a3, a4

# Test 5
li		a1, 0xffffffff
li		a3, 0x1
addi	a4, a1, 0x2
xor		a0, a3, a4

# Test 6
li		a1, 0xffffffff
li		a3, 0xfffffffe
addi	a4, a1, -1
xor		a0, a3, a4



# "SLTI" benchmark

# Test 1
li		a1, 0x2
li		a3, 0x0
slti	a4, a1, 0x1
xor		a0, a3, a4

# Test 2
li		a1, 0x1
li		a3, 0x1
slti	a4, a1, 0x2
xor		a0, a3, a4

# Test 3
li		a1, 0x363
li		a3, 0x0
slti	a4, a1, 0x275
xor		a0, a3, a4

# Test 4
li		a1, 0x264
li		a3, 0x1
slti	a4, a1, 0x784
xor		a0, a3, a4

# Test 5
li		a1, 0xffffffff
li		a3, 0x1
slti	a4, a1, 0x1
xor		a0, a3, a4

# Test 6
li		a1, 0xffffffff
li		a3, 0x0
slti	a4, a1, -2
xor		a0, a3, a4



# "SLTIU" benchmark

# Test 1
li		a1, 0x2
li		a3, 0x0
sltiu	a4, a1, 0x1
xor		a0, a3, a4

# Test 2
li		a1, 0x1
li		a3, 0x1
sltiu	a4, a1, 0x2
xor		a0, a3, a4

# Test 3
li		a1, 0x363
li		a3, 0x0
sltiu	a4, a1, 0x275
xor		a0, a3, a4

# Test 4
li		a1, 0x264
li		a3, 0x1
sltiu	a4, a1, 0x784
xor		a0, a3, a4

# Test 5
li		a1, 0xffffffff
li		a3, 0x0
sltiu	a4, a1, 0x1
xor		a0, a3, a4

# Test 6
li		a1, 0xffffffff
li		a3, 0x0
sltiu	a4, a1, -2
xor		a0, a3, a4



# "XORI" benchmark

# Test 1
li		a1, 0x0
li		a3, 0x1
xori	a4, a1, 0x1
xor		a0, a3, a4

# Test 2
li		a1, 0x1
li		a3, 0x2
xori	a4, a1, 0x3
xor		a0, a3, a4

# Test 3
li		a1, 0x378
li		a3, 0x0
xori	a4, a1, 0x378
xor		a0, a3, a4

# Test 4
li		a1, 0x284
li		a3, 0x284
xori	a4, a1, 0x0
xor		a0, a3, a4

# Test 5
li		a1, 0x33
li		a3, 0xcc
xori	a4, a1, 0xff
xor		a0, a3, a4

# Test 6
li		a1, 0x33
li		a3, 0x12
xori	a4, a1, 0x21
xor		a0, a3, a4



# "ORI" benchmark

# Test 1
li		a1, 0xff00
li		a3, 0xffff
ori		a4, a1, 0x00ff
xor		a0, a3, a4

# Test 2
li		a1, 0xf000
li		a3, 0xf0ff
ori		a4, a1, 0x00ff
xor		a0, a3, a4

# Test 3
li		a1, 0x45
li		a3, 0x45
ori		a4, a1, 0x45
xor		a0, a3, a4

# Test 4
li		a1, 0x34
li		a3, 0x34
ori		a4, a1, 0x34
xor		a0, a3, a4

# Test 5
li		a1, 0xfff
li		a3, 0xfff
ori		a4, a1, 0x123
xor		a0, a3, a4

# Test 6
li		a1, 0x0
li		a3, 0x123
ori		a4, a1, 0x123
xor		a0, a3, a4



# "ANDI" benchmark

# Test 1
li		a1, 0xff00
li		a3, 0x0000
andi	a4, a1, 0x00ff
xor		a0, a3, a4

# Test 2
li		a1, 0xfff0
li		a3, 0x00f0
andi	a4, a1, 0x00ff
xor		a0, a3, a4

# Test 3
li		a1, 0x74
li		a3, 0x74
andi	a4, a1, 0x74
xor		a0, a3, a4

# Test 4
li		a1, 0x14
li		a3, 0x14
andi	a4, a1, 0x14
xor		a0, a3, a4

# Test 5
li		a1, 0xfff
li		a3, 0x123
andi	a4, a1, 0x123
xor		a0, a3, a4

# Test 6
li		a1, 0x0
li		a3, 0x0
andi	a4, a1, 0x123
xor		a0, a3, a4



# "SLLI" benchmark

# Test 1
li		a1, 0x1
li		a3, 0x2
slli	a4, a1, 0x1
xor		a0, a3, a4

# Test 2
li		a1, 0x1234
li		a3, 0x12340
slli	a4, a1, 0x4
xor		a0, a3, a4

# Test 3
li		a1, 0xffffffff
li		a3, 0xfffffffc
slli	a4, a1, 0x2
xor		a0, a3, a4

# Test 4
li		a1, 0x11111111
li		a3, 0x80000000
slli	a4, a1, 0x1f
xor		a0, a3, a4

# Test 5
li		a1, 0x11111111
li		a3, 0x80000000
slli	a4, a1, 0x1f
xor		a0, a3, a4

# Test 6
li		a1, 0x80000000
li		a3, 0x0
slli	a4, a1, 0x1
xor		a0, a3, a4



# "SRLI" benchmark

# Test 1
li		a1, 0x2
li		a3, 0x1
srli	a4, a1, 0x1
xor		a0, a3, a4

# Test 2
li		a1, 0x12340
li		a3, 0x1234
srli	a4, a1, 0x4
xor		a0, a3, a4

# Test 3
li		a1, 0xffffffff
li		a3, 0x0fffffff
srli	a4, a1, 0x4
xor		a0, a3, a4

# Test 4
li		a1, 0x88888888
li		a3, 0x1
srli	a4, a1, 0x1f
xor		a0, a3, a4

# Test 5
li		a1, 0x88888888
li		a3, 0x1
srli	a4, a1, 0x1f
xor		a0, a3, a4

# Test 6
li		a1, 0x1
li		a3, 0x0
srli	a4, a1, 0x1
xor		a0, a3, a4



# "SRAI" benchmark

# Test 1
li		a1, 0x2
li		a3, 0x1
srai	a4, a1, 0x1
xor		a0, a3, a4

# Test 2
li		a1, 0x12340
li		a3, 0x1234
srai	a4, a1, 0x4
xor		a0, a3, a4

# Test 3
li		a1, 0xffffffff
li		a3, 0xffffffff
srai	a4, a1, 0x4
xor		a0, a3, a4

# Test 4
li		a1, 0x88888888
li		a3, 0xffffffff
srai	a4, a1, 0x1f
xor		a0, a3, a4

# Test 5
li		a1, 0x88888888
li		a3, 0xffffffff
srai	a4, a1, 0x1f
xor		a0, a3, a4

# Test 6
li		a1, 0x1
li		a3, 0x0
srai	a4, a1, 0x1
xor		a0, a3, a4
