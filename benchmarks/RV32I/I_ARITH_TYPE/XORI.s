li		a1, 0x0
li		a3, 0x1
xori	a4, a1, 0x1
xor		a0, a3, a4

li		a1, 0x1
li		a3, 0x2
xori	a4, a1, 0x3
xor		a0, a3, a4

li		a1, 0x378
li		a3, 0x0
xori	a4, a1, 0x378
xor		a0, a3, a4

li		a1, 0x284
li		a3, 0x284
xori	a4, a1, 0x0
xor		a0, a3, a4

li		a1, 0x33
li		a3, 0xcc
xori	a4, a1, 0xff
xor		a0, a3, a4

li		a1, 0x33
li		a3, 0x12
xori	a4, a1, 0x21
xor		a0, a3, a4
