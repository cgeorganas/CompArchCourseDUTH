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
