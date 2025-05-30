li			a4, 1
li			a1, 0x00000000
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 2
li			a1, 0x80000000
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 3
li			a1, 0x00000001
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3

li			a2, 0x00000001
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3



li			a4, 4
li			a1, 0x80000001
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3

li			a2, 0xffffffff
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3



li			a4, 5
li			a1, 0x0015b229
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3

li			a2, 0x00000001
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3



li			a4, 6
li			a1, 0x8015b229
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3

li			a2, 0xffffffff
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3



li			a4, 7
li			a1, 0x007fffff
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3

li			a2, 0x00000001
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3



li			a4, 8
li			a1, 0x807fffff
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3

li			a2, 0xffffffff
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3



li			a4, 9
li			a1, 0x00800000
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3

li			a2, 0x00000001
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3



li			a4, 10
li			a1, 0x80800000
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3

li			a2, 0xffffffff
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3



li			a4, 11
li			a1, 0x25951248
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3

li			a2, 0x00000001
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3



li			a4, 12
li			a1, 0xa5951248
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3

li			a2, 0xffffffff
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3



li			a4, 13
li			a1, 0x3dffffff
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3

li			a2, 0x00000001
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3



li			a4, 14
li			a1, 0xbdffffff
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3

li			a2, 0xffffffff
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3



li			a4, 15
li			a1, 0x3e000000
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3

li			a2, 0x00000001
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3



li			a4, 16
li			a1, 0xbe000000
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3

li			a2, 0xffffffff
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3



li			a4, 17
li			a1, 0x478bd288
fmv.w.x		f1, a1

li			a2, 0x000117a5
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3

li			a2, 0x000117a6
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3



li			a4, 18
li			a1, 0xc78bd288
fmv.w.x		f1, a1

li			a2, 0xfffee85b
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3

li			a2, 0xfffee85a
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3



li			a4, 19
li			a1, 0x4effffff
fmv.w.x		f1, a1

li			a2, 0x7fffff80
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 20
li			a1, 0xceffffff
fmv.w.x		f1, a1

li			a2, 0x80000080
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 21
li			a1, 0x4f000000
fmv.w.x		f1, a1

li			a2, 0x7fffffff
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 22
li			a1, 0xcf000000
fmv.w.x		f1, a1

li			a2, 0x80000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 23
li			a1, 0x4f295780
fmv.w.x		f1, a1

li			a2, 0x7fffffff
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 24
li			a1, 0xcf295780
fmv.w.x		f1, a1

li			a2, 0x80000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 25
li			a1, 0x4f7fffff
fmv.w.x		f1, a1

li			a2, 0x7fffffff
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 26
li			a1, 0xcf7fffff
fmv.w.x		f1, a1

li			a2, 0x80000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 27
li			a1, 0x4f800000
fmv.w.x		f1, a1

li			a2, 0x7fffffff
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 28
li			a1, 0xcf800000
fmv.w.x		f1, a1

li			a2, 0x80000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 29
li			a1, 0x5e0d4a80
fmv.w.x		f1, a1

li			a2, 0x7fffffff
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 30
li			a1, 0xde0d4a80
fmv.w.x		f1, a1

li			a2, 0x80000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 31
li			a1, 0x7f7fffff
fmv.w.x		f1, a1

li			a2, 0x7fffffff
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 32
li			a1, 0xff7fffff
fmv.w.x		f1, a1

li			a2, 0x80000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 33
li			a1, 0x7f800000
fmv.w.x		f1, a1

li			a2, 0x7fffffff
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 34
li			a1, 0xff800000
fmv.w.x		f1, a1

li			a2, 0x80000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 35
li			a1, 0x7fc00001
fmv.w.x		f1, a1

li			a2, 0x7fffffff
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 36
li			a1, 0xffc00001
fmv.w.x		f1, a1

li			a2, 0x80000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 37
li			a1, 0x7f800001
fmv.w.x		f1, a1

li			a2, 0x7fffffff
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 38
li			a1, 0xff800001
fmv.w.x		f1, a1

li			a2, 0x80000000
fcvt.w.s	a3, f1, rne
xor			a0, a2, a3
fcvt.w.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.w.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.w.s	a3, f1, rup
xor			a0, a2, a3
fcvt.w.s	a3, f1, rmm
xor			a0, a2, a3

