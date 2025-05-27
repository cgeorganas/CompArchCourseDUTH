li		a1, 0x1
li		a2, 0x1
li		a3, 0x2
sll		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x1234
li		a2, 0x4
li		a3, 0x12340
sll		a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0x2
li		a3, 0xfffffffc
sll		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x11111111
li		a2, 0x1f
li		a3, 0x80000000
sll		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x11111111
li		a2, 0xf1f
li		a3, 0x80000000
sll		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x80000000
li		a2, 0x1
li		a3, 0x0
sll		a4, a1, a2
xor		a0, a3, a4
