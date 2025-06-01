# (+10) + (+2) = (+12)
li			a1, 0x41200000
li			a2, 0x40000000
li			a3, 0x41400000
li			a4, 0x41400000
jal			ra, fadd_func

# (+10) + (-2) = (+8)
li			a1, 0x41200000
li			a2, 0xc0000000
li			a3, 0x41000000
li			a4, 0x41000000
jal			ra, fadd_func

# (-10) + (+2) = (-8)
li			a1, 0xc1200000
li			a2, 0x40000000
li			a3, 0xc1000000
li			a4, 0xc1000000
jal			ra, fadd_func

# (-10) + (-2) = (-12)
li			a1, 0xc1200000
li			a2, 0xc0000000
li			a3, 0xc1400000
li			a4, 0xc1400000
jal			ra, fadd_func

jal			x0, fadd_end

fadd_func:
fmv.w.x		f1, a1
fmv.w.x		f2, a2
fadd.s		f3, f1, f2, rdn
fmv.x.w		a5, f3
xor			a0, a3, a5
fadd.s		f3, f2, f1, rdn
fmv.x.w		a5, f3
xor			a0, a3, a5
fadd.s		f3, f1, f2, rup
fmv.x.w		a5, f3
xor			a0, a4, a5
fadd.s		f3, f2, f1, rup
fmv.x.w		a5, f3
xor			a0, a4, a5
jr			ra

fadd_end:
nop
