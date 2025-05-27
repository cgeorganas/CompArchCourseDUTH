li		a1, 0x100

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
