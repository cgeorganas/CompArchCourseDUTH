li			a1, 0x1000001

fcvt.s.w	f1, a1, rdn
fmv.x.w		a2, f1

li			a3, 0x4b800000

xor			a0, a2, a3

fcvt.s.w	f1, a1, rup
fmv.x.w		a2, f1

li			a3, 0x4b800001

xor			a0, a2, a3
