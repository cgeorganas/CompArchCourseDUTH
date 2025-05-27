li		a1, 0xff00
li		a3, 0x0000
andi	a4, a1, 0x00ff
xor		a0, a3, a4

li		a1, 0xfff0
li		a3, 0x00f0
andi	a4, a1, 0x00ff
xor		a0, a3, a4

li		a1, 0x74
li		a3, 0x74
andi	a4, a1, 0x74
xor		a0, a3, a4

li		a1, 0x14
li		a3, 0x14
andi	a4, a1, 0x14
xor		a0, a3, a4

li		a1, 0xfff
li		a3, 0x123
andi	a4, a1, 0x123
xor		a0, a3, a4

li		a1, 0x0
li		a3, 0x0
andi	a4, a1, 0x123
xor		a0, a3, a4
