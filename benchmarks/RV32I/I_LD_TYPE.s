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
