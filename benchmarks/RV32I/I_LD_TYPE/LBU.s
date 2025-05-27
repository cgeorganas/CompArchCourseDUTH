li		a1, 0x100
lui		a2, 0x81238
addi	a2, a2, 0x456
sw		a2, 0(a1)

li		a4, 0x56

lbu		a3, 0(a1)
xor		a0, a3, a4

li		a4, 0x84

lbu		a3, 1(a1)
xor		a0, a3, a4

li		a4, 0x23

lbu		a3, 2(a1)
xor		a0, a3, a4

li		a4, 0x81

lbu		a3, 3(a1)
xor		a0, a3, a4
