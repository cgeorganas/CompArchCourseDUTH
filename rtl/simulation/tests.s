# This verification benchmark will set "a0" to a
# non zero value if the result does not match the expected value.



# "BEQ" benchmark

beq_bench:
li		a3, 1

li		a1, 0x1
lui		a2, 0x80000
beq		a1, a2, error

li		a1, 0x1
li		a2, 0x1
beq		a1, a2, bne_bench

beq		a7, a7, error



# "BNE" benchmark

bne_bench:
li		a3, 2

li		a1, 0x1
li		a2, 0x1
bne		a1, a2, error

li		a1, 0x1
lui		a2, 0x80000
bne		a1, a2, blt_bench

beq		a7, a7, error



# "BLT" benchmark

blt_bench:
li		a3, 3

li		a1, 0x1
lui		a2, 0x80000
blt		a1, a2, error

li		a1, 0x2
li		a2, 0x1
blt		a1, a2, error

li		a1, 0x1
li		a2, 0x1
blt		a1, a2, error

li		a1, 0x1
li		a2, 0x2
blt		a1, a2, bge_bench

beq		a7, a7, error



# "BGE" benchmark

bge_bench:
li		a3, 4

lui		a1, 0x80000
li		a2, 0x1
bge		a1, a2, error

li		a1, 0x1
li		a2, 0x2
bge		a1, a2, error

li		a1, 0x1
li		a2, 0x1
bge		a1, a2, label_b0

beq		a7, a7, error

label_b0:
li		a1, 0x2
li		a2, 0x1
bge		a1, a2, bltu_bench

beq		a7, a7, error



# "BLTU" benchmark

bltu_bench:
li		a3, 5

li		a1, 0x1
lui		a2, 0x80000
bltu		a1, a2, label_b1

beq		a7, a7, error

label_b1:
li		a1, 0x2
li		a2, 0x1
bltu	a1, a2, error

li		a1, 0x1
li		a2, 0x1
bltu	a1, a2, error

li		a1, 0x1
li		a2, 0x2
bltu	a1, a2, bgeu_bench

beq		a7, a7, error



# "BGEU" benchmark

bgeu_bench:
li		a3, 6

lui		a1, 0x80000
li		a2, 0x1
bgeu	a1, a2, label_b2

beq		a7, a7, error

label_b2:
li		a1, 0x1
li		a2, 0x2
bgeu	a1, a2, error

li		a1, 0x1
li		a2, 0x1
bgeu	a1, a2, label_b3

beq		a7, a7, error

label_b3:
li		a1, 0x2
li		a2, 0x1
bgeu	a1, a2, label_b4

error:
li		a0, 0x1

label_b4:
li		a3, 7
nop
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
# This verification benchmark will set "a0" to a
# non zero value if the result does not match the expected value.

auipc	a1, 0
jalr	a2, a1, 12
li		a0, 1
addi	a1, a1, 8
xor		a0, a1, a2

auipc	a1, 0
jalr	a2, a1, 20
li		a0, 1
li		a0, 1
li		a0, 1
addi	a1, a1, 8
xor		a0, a1, a2
# This verification benchmark will set "a0" to a
# non zero value if the result does not match the expected value.



# "LW" benchmark

li		a1, 0x10
lui		a2, 0x81238
addi	a2, a2, 0x456
sw		a2, 0(a1)

lw		a3, 0(a1)
xor		a0, a2, a3

lw		a3, 1(a1)
xor		a0, a2, a3

lw		a3, 2(a1)
xor		a0, a2, a3

lw		a3, 3(a1)
xor		a0, a2, a3



# "LH" benchmark

lh		a3, 0(a1)
lui		a4, 0xffff8
addi	a4, a4, 0x456
xor		a0, a3, a4

lh		a3, 1(a1)
xor		a0, a3, a4

lh		a3, 2(a1)
lui		a4, 0xffff8
addi	a4, a4, 0x123
xor		a0, a3, a4

lh		a3, 3(a1)
xor		a0, a3, a4



# "LHU" benchmark

lhu		a3, 0(a1)
lui		a4, 0x8
addi	a4, a4, 0x456
xor		a0, a3, a4

lhu		a3, 1(a1)
xor		a0, a3, a4

lhu		a3, 2(a1)
lui		a4, 0x8
addi	a4, a4, 0x123
xor		a0, a3, a4

lhu		a3, 3(a1)
xor		a0, a3, a4



# "LB" benchmark

lb		a3, 0(a1)
li		a4, 0x56
xor		a0, a3, a4

lb		a3, 1(a1)
lui		a4, 0xfffff
srai	a4, a4, 0x4
addi	a4, a4, 0x84
xor		a0, a3, a4

lb		a3, 2(a1)
li		a4, 0x23
xor		a0, a3, a4

lb		a3, 3(a1)
lui		a4, 0xfffff
srai	a4, a4, 0x4
addi	a4, a4, 0x81
xor		a0, a3, a4



# "LBU" benchmark

lbu		a3, 0(a1)
li		a4, 0x56
xor		a0, a3, a4

lbu		a3, 1(a1)
li		a4, 0x84
xor		a0, a3, a4

lbu		a3, 2(a1)
li		a4, 0x23
xor		a0, a3, a4

lbu		a3, 3(a1)
li		a4, 0x81
xor		a0, a3, a4
# This verification benchmark will set "a0" to a
# non zero value if the result does not match the expected value.



jal		a1, label_j0
label_j0:
la		a2, label_j0
sub		a0, a1, a2

jal		a1, label_j1
nop
label_j1:
la		a2, label_j1
addi	a2, a2, -4
sub		a0, a1, a2

jal		a1, label_j2
nop
nop
label_j2:
la		a2, label_j2
addi	a2, a2, -8
sub		a0, a1, a2
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



# "MUL" benchmark

# Test 1
li		a1, 0x00007e00
li		a2, 0xb6db6db7
li		a3, 0x00001200
mul		a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 0x00007fc0
li		a2, 0xb6db6db7
li		a3, 0x00001240
mul		a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, 0x00000000
li		a2, 0x00000000
li		a3, 0x00000000
mul		a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, 0x00000001
li		a2, 0x00000001
li		a3, 0x00000001
mul		a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 0x00000003
li		a2, 0x00000007
li		a3, 0x00000015
mul		a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 0x00000000
li		a2, 0xffff8000
li		a3, 0x00000000
mul		a4, a1, a2
xor		a0, a3, a4

# Test 7
li		a1, 0x80000000
li		a2, 0x00000000
li		a3, 0x00000000
mul		a4, a1, a2
xor		a0, a3, a4

# Test 8
li		a1, 0x80000000
li		a2, 0xffff8000
li		a3, 0x00000000
mul		a4, a1, a2
xor		a0, a3, a4

# Test 9
li		a1, 0xaaaaaaab
li		a2, 0x0002fe7d
li		a3, 0x0000ff7f
mul		a4, a1, a2
xor		a0, a3, a4

# Test 10
li		a1, 0x0002fe7d
li		a2, 0xaaaaaaab
li		a3, 0x0000ff7f
mul		a4, a1, a2
xor		a0, a3, a4

# Test 11
li		a1, 0xff000000
li		a2, 0xff000000
li		a3, 0x00000000
mul		a4, a1, a2
xor		a0, a3, a4

# Test 12
li		a1, 0xffffffff
li		a2, 0xffffffff
li		a3, 0x00000001
mul		a4, a1, a2
xor		a0, a3, a4

# Test 13
li		a1, 0xffffffff
li		a2, 0x00000001
li		a3, 0xffffffff
mul		a4, a1, a2
xor		a0, a3, a4

# Test 14
li		a1, 0x00000001
li		a2, 0xffffffff
li		a3, 0xffffffff
mul		a4, a1, a2
xor		a0, a3, a4



# "MULH" benchmark

# Test 1
li		a1, 0x00000000
li		a2, 0x00000000
li		a3, 0x00000000
mulh	a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 0x00000001
li		a2, 0x00000001
li		a3, 0x00000000
mulh	a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, 0x00000003
li		a2, 0x00000007
li		a3, 0x00000000
mulh	a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, 0x00000000
li		a2, 0xffff8000
li		a3, 0x00000000
mulh	a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 0x80000000
li		a2, 0x00000000
li		a3, 0x00000000
mulh	a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 0x40000000
li		a2, 0x00000004
li		a3, 0x00000001
mulh	a4, a1, a2
xor		a0, a3, a4

# Test 7
li		a1, 0xaaaaaaab
li		a2, 0x0002fe7d
li		a3, 0xffff0081
mulh	a4, a1, a2
xor		a0, a3, a4

# Test 8
li		a1, 0x0002fe7d
li		a2, 0xaaaaaaab
li		a3, 0xffff0081
mulh	a4, a1, a2
xor		a0, a3, a4

# Test 9
li		a1, 0xff000000
li		a2, 0xff000000
li		a3, 0x00010000
mulh	a4, a1, a2
xor		a0, a3, a4

# Test 10
li		a1, 0xffffffff
li		a2, 0xffffffff
li		a3, 0x00000000
mulh	a4, a1, a2
xor		a0, a3, a4

# Test 11
li		a1, 0xffffffff
li		a2, 0x00000001
li		a3, 0xffffffff
mulh	a4, a1, a2
xor		a0, a3, a4

# Test 12
li		a1, 0x00000001
li		a2, 0xffffffff
li		a3, 0xffffffff
mulh	a4, a1, a2
xor		a0, a3, a4



# "MULHSU" benchmark

# Test 1
li		a1, 0x00000000
li		a2, 0x00000000
li		a3, 0x00000000
mulhsu	a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 0x00000001
li		a2, 0x00000001
li		a3, 0x00000000
mulhsu	a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, 0x00000003
li		a2, 0x00000007
li		a3, 0x00000000
mulhsu	a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, 0x00000000
li		a2, 0xffff8000
li		a3, 0x00000000
mulhsu	a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 0x80000000
li		a2, 0x00000000
li		a3, 0x00000000
mulhsu	a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 0x80000000
li		a2, 0xffff8000
li		a3, 0x80004000
mulhsu	a4, a1, a2
xor		a0, a3, a4

# Test 7
li		a1, 0xaaaaaaab
li		a2, 0x0002fe7d
li		a3, 0xffff0081
mulhsu	a4, a1, a2
xor		a0, a3, a4

# Test 8
li		a1, 0x0002fe7d
li		a2, 0xaaaaaaab
li		a3, 0x0001fefe
mulhsu	a4, a1, a2
xor		a0, a3, a4

# Test 9
li		a1, 0xff000000
li		a2, 0xff000000
li		a3, 0xff010000
mulhsu	a4, a1, a2
xor		a0, a3, a4

# Test 10
li		a1, 0xffffffff
li		a2, 0xffffffff
li		a3, 0xffffffff
mulhsu	a4, a1, a2
xor		a0, a3, a4

# Test 11
li		a1, 0xffffffff
li		a2, 0x00000001
li		a3, 0xffffffff
mulhsu	a4, a1, a2
xor		a0, a3, a4

# Test 12
li		a1, 0x00000001
li		a2, 0xffffffff
li		a3, 0x00000000
mulhsu	a4, a1, a2
xor		a0, a3, a4



# "MULHU" benchmark

# Test 1
li		a1, 0x00000000
li		a2, 0x00000000
li		a3, 0x00000000
mulhu	a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 0x00000001
li		a2, 0x00000001
li		a3, 0x00000000
mulhu	a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, 0x00000003
li		a2, 0x00000007
li		a3, 0x00000000
mulhu	a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, 0x00000000
li		a2, 0xffff8000
li		a3, 0x00000000
mulhu	a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 0x80000000
li		a2, 0x00000000
li		a3, 0x00000000
mulhu	a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 0x80000000
li		a2, 0xffff8000
li		a3, 0x7fffc000
mulhu	a4, a1, a2
xor		a0, a3, a4

# Test 7
li		a1, 0xaaaaaaab
li		a2, 0x0002fe7d
li		a3, 0x0001fefe
mulhu	a4, a1, a2
xor		a0, a3, a4

# Test 8
li		a1, 0x0002fe7d
li		a2, 0xaaaaaaab
li		a3, 0x0001fefe
mulhu	a4, a1, a2
xor		a0, a3, a4

# Test 9
li		a1, 0xff000000
li		a2, 0xff000000
li		a3, 0xfe010000
mulhu	a4, a1, a2
xor		a0, a3, a4

# Test 10
li		a1, 0xffffffff
li		a2, 0xffffffff
li		a3, 0xfffffffe
mulhu	a4, a1, a2
xor		a0, a3, a4

# Test 11
li		a1, 0xffffffff
li		a2, 0x00000001
li		a3, 0x00000000
mulhu	a4, a1, a2
xor		a0, a3, a4

# Test 12
li		a1, 0x00000001
li		a2, 0xffffffff
li		a3, 0x00000000
mulhu	a4, a1, a2
xor		a0, a3, a4



# "DIV" benchmark

# Test 1
li		a1, 20
li		a2, 6
li		a3, 3
div		a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 20
li		a2, -6
li		a3, -3
div		a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, -20
li		a2, 6
li		a3, -3
div		a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, -20
li		a2, -6
li		a3, 3
div		a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 20
li		a2, 1
li		a3, 20
div		a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 20
li		a2, 20
li		a3, 1
div		a4, a1, a2
xor		a0, a3, a4

# Test 7
li		a1, 20
li		a2, 4
li		a3, 5
div		a4, a1, a2
xor		a0, a3, a4

# Test 8
li		a1, 20
li		a2, 21
li		a3, 0
div		a4, a1, a2
xor		a0, a3, a4

# Test 9
li		a1, 62975
li		a2, 83
li		a3, 758
div		a4, a1, a2
xor		a0, a3, a4

# Test 10
li		a1, 1
li		a2, 0
li		a3, -1
div		a4, a1, a2
xor		a0, a3, a4

# Test 11
li		a1, 34
li		a2, 0
li		a3, -1
div		a4, a1, a2
xor		a0, a3, a4

# Test 12
lui		a1, 0x80000
li		a2, 2
lui		a3, 0xc0000
div		a4, a1, a2
xor		a0, a3, a4

# Test 13
lui		a1, 0x80000
lui		a2, 0x40000
li		a3, -2
div		a4, a1, a2
xor		a0, a3, a4

# Test 14
lui		a1, 0x80000
li		a2, -1
lui		a3, 0x80000
div		a4, a1, a2
xor		a0, a3, a4



# "DIVU" benchmark

# Test 1
li		a1, 20
li		a2, 6
li		a3, 3
divu	a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 20
li		a2, -6
li		a3, 0
divu	a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, -20
li		a2, 6
li		a3, 715827879
divu	a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, -20
li		a2, -6
li		a3, 0
divu	a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 20
li		a2, 1
li		a3, 20
divu	a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 20
li		a2, 20
li		a3, 1
divu	a4, a1, a2
xor		a0, a3, a4

# Test 7
li		a1, 20
li		a2, 4
li		a3, 5
divu	a4, a1, a2
xor		a0, a3, a4

# Test 8
li		a1, 20
li		a2, 21
li		a3, 0
divu	a4, a1, a2
xor		a0, a3, a4

# Test 9
li		a1, 62975
li		a2, 83
li		a3, 758
divu	a4, a1, a2
xor		a0, a3, a4

# Test 10
li		a1, 1
li		a2, 0
li		a3, -1
divu	a4, a1, a2
xor		a0, a3, a4

# Test 11
li		a1, 34
li		a2, 0
li		a3, -1
divu	a4, a1, a2
xor		a0, a3, a4

# Test 12
lui		a1, 0x80000
li		a2, 2
lui		a3, 0x40000
divu	a4, a1, a2
xor		a0, a3, a4

# Test 13
lui		a1, 0x80000
lui		a2, 0x40000
li		a3, 2
divu	a4, a1, a2
xor		a0, a3, a4

# Test 14
lui		a1, 0x80000
li		a2, -1
lui		a3, 0
divu	a4, a1, a2
xor		a0, a3, a4



# "REM" benchmark

# Test 1
li		a1, 20
li		a2, 6
li		a3, 2
rem		a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 20
li		a2, -6
li		a3, 2
rem		a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, -20
li		a2, 6
li		a3, -2
rem		a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, -20
li		a2, -6
li		a3, -2
rem		a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 20
li		a2, 1
li		a3, 0
rem		a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 20
li		a2, 20
li		a3, 0
rem		a4, a1, a2
xor		a0, a3, a4

# Test 7
li		a1, 20
li		a2, 4
li		a3, 0
rem		a4, a1, a2
xor		a0, a3, a4

# Test 8
li		a1, 20
li		a2, 21
li		a3, 20
rem		a4, a1, a2
xor		a0, a3, a4

# Test 9
li		a1, 62975
li		a2, 83
li		a3, 61
rem		a4, a1, a2
xor		a0, a3, a4

# Test 10
li		a1, 1
li		a2, 0
li		a3, 1
rem		a4, a1, a2
xor		a0, a3, a4

# Test 11
li		a1, 34
li		a2, 0
li		a3, 34
rem		a4, a1, a2
xor		a0, a3, a4

# Test 12
lui		a1, 0x80000
li		a2, 2
li		a3, 0
rem		a4, a1, a2
xor		a0, a3, a4

# Test 13
lui		a1, 0x80000
lui		a2, 0x40000
li		a3, 0
rem		a4, a1, a2
xor		a0, a3, a4

# Test 14
lui		a1, 0x80000
li		a2, -1
li		a3, 0
rem		a4, a1, a2
xor		a0, a3, a4



# "REMU" benchmark

# Test 1
li		a1, 20
li		a2, 6
li		a3, 2
remu	a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 20
li		a2, -6
li		a3, 20
remu	a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, -20
li		a2, 6
li		a3, 2
remu	a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, -20
li		a2, -6
li		a3, -20
remu	a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 20
li		a2, 1
li		a3, 0
remu	a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 20
li		a2, 20
li		a3, 0
remu	a4, a1, a2
xor		a0, a3, a4

# Test 7
li		a1, 20
li		a2, 4
li		a3, 0
remu	a4, a1, a2
xor		a0, a3, a4

# Test 8
li		a1, 20
li		a2, 21
li		a3, 20
remu	a4, a1, a2
xor		a0, a3, a4

# Test 9
li		a1, 62975
li		a2, 83
li		a3, 61
remu	a4, a1, a2
xor		a0, a3, a4

# Test 10
li		a1, 1
li		a2, 0
li		a3, 1
remu	a4, a1, a2
xor		a0, a3, a4

# Test 11
li		a1, 34
li		a2, 0
li		a3, 34
remu	a4, a1, a2
xor		a0, a3, a4

# Test 12
lui		a1, 0x80000
li		a2, 2
li		a3, 0
remu	a4, a1, a2
xor		a0, a3, a4

# Test 13
lui		a1, 0x80000
lui		a2, 0x40000
li		a3, 0
remu	a4, a1, a2
xor		a0, a3, a4

# Test 14
lui		a1, 0x80000
li		a2, -1
lui		a3, 0x80000
remu	a4, a1, a2
xor		a0, a3, a4
# This verification benchmark will set "a0" to a
# non zero value if the result does not match the expected value.



# "SW" benchmark

li		a1, 0x100

lui		a2, 0x12345
addi	a2, a2, 0x678
sw		a2, 0(a1)
lw		a3, 0(a1)
xor		a0, a2, a3

sw		a2, 1(a1)
lw		a3, 0(a1)
xor		a0, a2, a3

sw		a2, 2(a1)
lw		a3, 0(a1)
xor		a0, a2, a3

sw		a2, 3(a1)
lw		a3, 0(a1)
xor		a0, a2, a3

lui		a2, 0x691a9
addi	a2, a2, 0x18d
sw		a2, 0(a1)
lw		a3, 0(a1)
xor		a0, a2, a3

sw		a2, 1(a1)
lw		a3, 0(a1)
xor		a0, a2, a3

sw		a2, 2(a1)
lw		a3, 0(a1)
xor		a0, a2, a3

sw		a2, 3(a1)
lw		a3, 0(a1)
xor		a0, a2, a3



# "SH" benchmark

lui		a2, 0x55555
addi	a2, a2, 0x555
sw		a2, 0(a1)

lui		a2, 0x2
addi	a2, a2, 0x222
sh		a2, 0(a1)
lw		a3, 0(a1)
lui		a4, 0x55552
addi	a4, a4, 0x222
xor		a0, a3, a4

sh		a2, 1(a1)
lw		a3, 0(a1)
xor		a0, a3, a4

lui		a2, 0x11110
srai	a2, a2, 0x10
sh		a2, 2(a1)
lw		a3, 0(a1)
lui		a4, 0x11112
addi	a4, a4, 0x222
xor		a0, a3, a4

sh		a2, 3(a1)
lw		a3, 0(a1)
xor		a0, a3, a4



# "SB" benchmark

li		a2, 0x0
sw		a2, 0(a1)

li		a2, 0x11
sb		a2, 0(a1)
lw		a3, 0(a1)
li		a4, 0x11
xor		a0, a3, a4

li		a2, 0x22
sb		a2, 1(a1)
lw		a3, 0(a1)
lui		a4, 0x2
addi	a4, a4, 0x211
xor		a0, a3, a4

li		a2, 0x33
sb		a2, 2(a1)
lw		a3, 0(a1)
lui		a4, 0x332
addi	a4, a4, 0x211
xor		a0, a3, a4

li		a2, 0x44
sb		a2, 3(a1)
lw		a3, 0(a1)
lui		a4, 0x44332
addi	a4, a4, 0x211
xor		a0, a3, a4
# This verification benchmark will set "a0" to a
# non zero value if the result does not match the expected value.


# "AUIPC" benchmark

auipc	a1, 0
auipc	a2, 0
addi	a1, a1, 4
xor		a0, a1, a2

auipc	a1, 0
nop
auipc	a2, 0
addi	a1, a1, 8
xor		a0, a1, a2

auipc	a1, 0x1
auipc	a2, 0
addi	a1, a1, 4
lui		a3, 0x1
add		a2, a2, a3
xor		a0, a1, a2
# This verification benchmark will set "a0" to a
# non zero value if the result does not match the expected value.


# "LUI" benchmark

li		a1, 0xaaa
lui		a1, 0x12345

addi	a2, x0, 0x123
slli	a2, a2, 8
addi	a2, a2, 0x45
slli	a2, a2, 12

xor		a0, a1, a2
