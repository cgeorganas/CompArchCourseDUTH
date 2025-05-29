li			a1, 0x40000000
fmv.w.x		f1, a1
fcvt.w.s	a2, f1
li			a3, 2
xor			a0, a2, a3

li			a1, 0x40800000
fmv.w.x		f1, a1
fcvt.w.s	a2, f1
li			a3, 4
xor			a0, a2, a3

li			a1, 0x41b80000
fmv.w.x		f1, a1
fcvt.w.s	a2, f1
li			a3, 23
xor			a0, a2, a3
