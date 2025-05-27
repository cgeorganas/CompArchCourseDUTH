li		a1, 0xff00
li		a3, 0xffff
ori		a4, a1, 0x00ff
xor		a0, a3, a4

li		a1, 0xf000
li		a3, 0xf0ff
ori		a4, a1, 0x00ff
xor		a0, a3, a4

li		a1, 0x45
li		a3, 0x45
ori		a4, a1, 0x45
xor		a0, a3, a4

li		a1, 0x34
li		a3, 0x34
ori		a4, a1, 0x34
xor		a0, a3, a4

li		a1, 0xfff
li		a3, 0xfff
ori		a4, a1, 0x123
xor		a0, a3, a4

li		a1, 0x0
li		a3, 0x123
ori		a4, a1, 0x123
xor		a0, a3, a4
