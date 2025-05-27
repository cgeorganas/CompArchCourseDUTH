li		a1, 0x2
li		a2, 0x1
li		a3, 0x1
srl		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x12340
li		a2, 0x4
li		a3, 0x1234
srl		a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0x4
li		a3, 0x0fffffff
srl		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x88888888
li		a2, 0x1f
li		a3, 0x1
srl		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x88888888
li		a2, 0xf1f
li		a3, 0x1
srl		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x1
li		a2, 0x1
li		a3, 0x0
srl		a4, a1, a2
xor		a0, a3, a4
