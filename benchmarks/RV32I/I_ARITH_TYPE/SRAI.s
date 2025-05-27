li		a1, 0x2
li		a3, 0x1
srai	a4, a1, 0x1
xor		a0, a3, a4

li		a1, 0x12340
li		a3, 0x1234
srai	a4, a1, 0x4
xor		a0, a3, a4

li		a1, 0xffffffff
li		a3, 0xffffffff
srai	a4, a1, 0x4
xor		a0, a3, a4

li		a1, 0x88888888
li		a3, 0xffffffff
srai	a4, a1, 0x1f
xor		a0, a3, a4

li		a1, 0x88888888
li		a3, 0xffffffff
srai	a4, a1, 0x1f
xor		a0, a3, a4

li		a1, 0x1
li		a3, 0x0
srai	a4, a1, 0x1
xor		a0, a3, a4
