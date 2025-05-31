li			a1, 2
fcvt.s.w	f1, a1

li			a2, 4
fcvt.s.w	f2, a2

fmul.s		f3, f1, f2
fcvt.w.s	a3, f3
