li			a1, 24

fcvt.s.w	f1, a1
fmv.x.w		a2, f1

li			a3, 0x41c00000

xor			a0, a2, a3
