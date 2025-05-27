li		a1, 0x2
li		a3, 0x0
slti	a4, a1, 0x1
xor		a0, a3, a4

li		a1, 0x1
li		a3, 0x1
slti	a4, a1, 0x2
xor		a0, a3, a4

li		a1, 0x363
li		a3, 0x0
slti	a4, a1, 0x275
xor		a0, a3, a4

li		a1, 0x264
li		a3, 0x1
slti	a4, a1, 0x784
xor		a0, a3, a4

li		a1, 0xffffffff
li		a3, 0x1
slti	a4, a1, 0x1
xor		a0, a3, a4

li		a1, 0xffffffff
li		a3, 0x0
slti	a4, a1, -2
xor		a0, a3, a4
