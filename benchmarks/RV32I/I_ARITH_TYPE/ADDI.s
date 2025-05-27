li		a1, 0x29
li		a3, 0x75
addi	a4, a1, 0x4c
xor		a0, a3, a4

li		a1, 0x3f
li		a3, 0x91
addi	a4, a1, 0x52
xor		a0, a3, a4

li		a1, 0x100
li		a3, 0x100
addi	a4, a1, 0x0
xor		a0, a3, a4

li		a1, 0xffffffff
li		a3, 0x0
addi	a4, a1, 0x1
xor		a0, a3, a4

li		a1, 0xffffffff
li		a3, 0x1
addi	a4, a1, 0x2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a3, 0xfffffffe
addi	a4, a1, -1
xor		a0, a3, a4
