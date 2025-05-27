li		a1, 0x2
li		a2, 0x1
li		a3, 0x0
sltu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x1
li		a2, 0x2
li		a3, 0x1
sltu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x363
li		a2, 0x275
li		a3, 0x0
sltu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x264
li		a2, 0x784
li		a3, 0x1
sltu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0x1
li		a3, 0x0
sltu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0xfffffffe
li		a3, 0x0
sltu	a4, a1, a2
xor		a0, a3, a4
