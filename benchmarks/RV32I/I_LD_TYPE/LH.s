li		a1, 0x100
lui		a2, 0x81238
addi	a2, a2, 0x456
sw		a2, 0(a1)

lui		a4, 0xffff8
addi	a4, a4, 0x456

lh		a3, 0(a1)
xor		a0, a3, a4

lh		a3, 1(a1)
xor		a0, a3, a4

lui		a4, 0xffff8
addi	a4, a4, 0x123

lh		a3, 2(a1)
xor		a0, a3, a4

lh		a3, 3(a1)
xor		a0, a3, a4
