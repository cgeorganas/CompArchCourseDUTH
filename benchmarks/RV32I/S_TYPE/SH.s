li		a1, 0x100

lui		a2, 0x55555
addi	a2, a2, 0x555
sw		a2, 0(a1)

lui		a2, 0x2
addi	a2, a2, 0x222

lui		a4, 0x55552
addi	a4, a4, 0x222

sh		a2, 0(a1)
lw		a3, 0(a1)
xor		a0, a3, a4

sh		a2, 1(a1)
lw		a3, 0(a1)
xor		a0, a3, a4

lui		a2, 0x11110
srai	a2, a2, 0x10

lui		a4, 0x11112
addi	a4, a4, 0x222

sh		a2, 2(a1)
lw		a3, 0(a1)
xor		a0, a3, a4

sh		a2, 3(a1)
lw		a3, 0(a1)
xor		a0, a3, a4
