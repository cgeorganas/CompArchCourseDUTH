li		a1, 0xff00
li		a2, 0x00ff
li		a3, 0xffff
or		a4, a1, a2
xor		a0, a3, a4

li		a1, 0xf000
li		a2, 0x00ff
li		a3, 0xf0ff
or		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x645
li		a2, 0x645
li		a3, 0x645
or		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x734
li		a2, 0x734
li		a3, 0x734
or		a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0x12345678
li		a3, 0xffffffff
or		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x0
li		a2, 0x12345678
li		a3, 0x12345678
or		a4, a1, a2
xor		a0, a3, a4
