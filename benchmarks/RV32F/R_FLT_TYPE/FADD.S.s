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

# (Rand) + (+0) = (Rand)
li			a1, 0x516b7038
li			a2, 0x00000000
li			a3, 0x516b7038
li			a4, 0x516b7038
jal			ra, fadd_func

# (Rand) + (-0) = (Rand)
li			a1, 0x516b7038
li			a2, 0x80000000
li			a3, 0x516b7038
li			a4, 0x516b7038
jal			ra, fadd_func

# (+Inf) + (Rand) = (+Inf)
li			a1, 0x7f800000
li			a2, 0x4f9502f9
li			a3, 0x7f800000
li			a4, 0x7f800000
jal			ra, fadd_func

# (-Inf) + (Rand) = (-Inf)
li			a1, 0xff800000
li			a2, 0x4f9502f9
li			a3, 0xff800000
li			a4, 0xff800000
jal			ra, fadd_func

# (+Inf) + (+Inf) = (+Inf)
li			a1, 0x7f800000
li			a2, 0x7f800000
li			a3, 0x7f800000
li			a4, 0x7f800000
jal			ra, fadd_func

# (-Inf) + (-Inf) = (-Inf)
li			a1, 0xff800000
li			a2, 0xff800000
li			a3, 0xff800000
li			a4, 0xff800000
jal			ra, fadd_func

# (+Inf) + (-Inf) = qNaN
li			a1, 0x7f800000
li			a2, 0xff800000
li			a3, 0x7fc00001
li			a4, 0x7fc00001
jal			ra, fadd_func

# NaN + (Rand) = NaN
li			a1, 0x7f922e2e
li			a2, 0x47392800
li			a3, 0x7f922e2e
li			a4, 0x7f922e2e
jal			ra, fadd_func

# (Large) + (Small) ~= (Large)
li			a1, 0x53800000
li			a2, 0x3f800000
li			a3, 0x53800000
li			a4, 0x53800001
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
