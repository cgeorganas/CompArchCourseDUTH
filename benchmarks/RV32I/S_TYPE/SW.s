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
