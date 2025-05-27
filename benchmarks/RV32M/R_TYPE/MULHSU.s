li		a1, 0x00000000
li		a2, 0x00000000
li		a3, 0x00000000
mulhsu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000001
li		a2, 0x00000001
li		a3, 0x00000000
mulhsu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000003
li		a2, 0x00000007
li		a3, 0x00000000
mulhsu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000000
li		a2, 0xffff8000
li		a3, 0x00000000
mulhsu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x80000000
li		a2, 0x00000000
li		a3, 0x00000000
mulhsu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x80000000
li		a2, 0xffff8000
li		a3, 0x80004000
mulhsu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0xaaaaaaab
li		a2, 0x0002fe7d
li		a3, 0xffff0081
mulhsu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x0002fe7d
li		a2, 0xaaaaaaab
li		a3, 0x0001fefe
mulhsu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0xff000000
li		a2, 0xff000000
li		a3, 0xff010000
mulhsu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0xffffffff
li		a3, 0xffffffff
mulhsu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0x00000001
li		a3, 0xffffffff
mulhsu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000001
li		a2, 0xffffffff
li		a3, 0x00000000
mulhsu	a4, a1, a2
xor		a0, a3, a4
