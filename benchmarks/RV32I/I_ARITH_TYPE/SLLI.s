li		a1, 0x1
li		a3, 0x2
slli	a4, a1, 0x1
xor		a0, a3, a4

li		a1, 0x1234
li		a3, 0x12340
slli	a4, a1, 0x4
xor		a0, a3, a4

li		a1, 0xffffffff
li		a3, 0xfffffffc
slli	a4, a1, 0x2
xor		a0, a3, a4

li		a1, 0x11111111
li		a3, 0x80000000
slli	a4, a1, 0x1f
xor		a0, a3, a4

li		a1, 0x11111111
li		a3, 0x80000000
slli	a4, a1, 0x1f
xor		a0, a3, a4

li		a1, 0x80000000
li		a3, 0x0
slli	a4, a1, 0x1
xor		a0, a3, a4
