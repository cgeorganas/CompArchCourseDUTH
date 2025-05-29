li			a1, 0x01000001

fcvt.s.w	f1, a1, rdn
fmv.x.w		a2, f1
li			a3, 0x4b800000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rup
fmv.x.w		a2, f1
li			a3, 0x4b800001
xor			a0, a2, a3

fcvt.s.w	f1, a1, rmm
fmv.x.w		a2, f1
li			a3, 0x4b800001
xor			a0, a2, a3



li			a1, 0xfeffffff

fcvt.s.w	f1, a1, rdn
fmv.x.w		a2, f1
li			a3, 0xcb800001
xor			a0, a2, a3

fcvt.s.w	f1, a1, rup
fmv.x.w		a2, f1
li			a3, 0xcb800000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rmm
fmv.x.w		a2, f1
li			a3, 0xcb800001
xor			a0, a2, a3
