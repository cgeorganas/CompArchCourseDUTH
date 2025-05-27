li		a1, 0x100
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
