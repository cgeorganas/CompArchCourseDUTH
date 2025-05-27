li		a1, 0x00000000
li		a2, 0x00000000
li		a3, 0x00000000
mulh	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000001
li		a2, 0x00000001
li		a3, 0x00000000
mulh	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000003
li		a2, 0x00000007
li		a3, 0x00000000
mulh	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000000
li		a2, 0xffff8000
li		a3, 0x00000000
mulh	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x80000000
li		a2, 0x00000000
li		a3, 0x00000000
mulh	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x40000000
li		a2, 0x00000004
li		a3, 0x00000001
mulh	a4, a1, a2
xor		a0, a3, a4

li		a1, 0xaaaaaaab
li		a2, 0x0002fe7d
li		a3, 0xffff0081
mulh	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x0002fe7d
li		a2, 0xaaaaaaab
li		a3, 0xffff0081
mulh	a4, a1, a2
xor		a0, a3, a4

li		a1, 0xff000000
li		a2, 0xff000000
li		a3, 0x00010000
mulh	a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0xffffffff
li		a3, 0x00000000
mulh	a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0x00000001
li		a3, 0xffffffff
mulh	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000001
li		a2, 0xffffffff
li		a3, 0xffffffff
mulh	a4, a1, a2
xor		a0, a3, a4
