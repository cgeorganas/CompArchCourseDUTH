li		a1, 0xff00
li		a2, 0x00ff
li		a3, 0x0000
and		a4, a1, a2
xor		a0, a3, a4

li		a1, 0xfff0
li		a2, 0x00ff
li		a3, 0x00f0
and		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x474
li		a2, 0x474
li		a3, 0x474
and		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x141
li		a2, 0x141
li		a3, 0x141
and		a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0x12345678
li		a3, 0x12345678
and		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x0
li		a2, 0x12345678
li		a3, 0x0
and		a4, a1, a2
xor		a0, a3, a4
