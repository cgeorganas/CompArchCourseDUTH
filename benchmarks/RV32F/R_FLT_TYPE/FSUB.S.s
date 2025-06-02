# (+10) - (+2) = (+8)
li			a1, 0x41200000
li			a2, 0x40000000
li			a3, 0x41000000
li			a4, 0x41000000
jal			ra, fsub_func

# (+2) - (+10) = (-8)
li			a1, 0x40000000
li			a2, 0x41200000
li			a3, 0xc1000000
li			a4, 0xc1000000
jal			ra, fsub_func

# (+10) - (-2) = (+12)
li			a1, 0x41200000
li			a2, 0xc0000000
li			a3, 0x41400000
li			a4, 0x41400000
jal			ra, fsub_func

# (-2) - (+10) = (-12)
li			a1, 0xc0000000
li			a2, 0x41200000
li			a3, 0xc1400000
li			a4, 0xc1400000
jal			ra, fsub_func

# (-10) - (+2) = (-12)
li			a1, 0xc1200000
li			a2, 0x40000000
li			a3, 0xc1400000
li			a4, 0xc1400000
jal			ra, fsub_func

# (+2) - (-10) = (+12)
li			a1, 0x40000000
li			a2, 0xc1200000
li			a3, 0x41400000
li			a4, 0x41400000
jal			ra, fsub_func

# (-10) - (-2) = (-8)
li			a1, 0xc1200000
li			a2, 0xc0000000
li			a3, 0xc1000000
li			a4, 0xc1000000
jal			ra, fsub_func

# (-2) - (-10) = (+8)
li			a1, 0xc0000000
li			a2, 0xc1200000
li			a3, 0x41000000
li			a4, 0x41000000
jal			ra, fsub_func

# (Rand) - (+0) = (Rand)
li			a1, 0x516b7038
li			a2, 0x00000000
li			a3, 0x516b7038
li			a4, 0x516b7038
jal			ra, fsub_func

# (+0) - (Rand) = (-Rand)
li			a1, 0x00000000
li			a2, 0x516b7038
li			a3, 0xd16b7038
li			a4, 0xd16b7038
jal			ra, fsub_func

# (Rand) - (-0) = (Rand)
li			a1, 0x516b7038
li			a2, 0x80000000
li			a3, 0x516b7038
li			a4, 0x516b7038
jal			ra, fsub_func

# (-0) - (Rand) = (-Rand)
li			a1, 0x80000000
li			a2, 0x516b7038
li			a3, 0xd16b7038
li			a4, 0xd16b7038
jal			ra, fsub_func

# (+Inf) - (Rand) = (+Inf)
li			a1, 0x7f800000
li			a2, 0x4f9502f9
li			a3, 0x7f800000
li			a4, 0x7f800000
jal			ra, fsub_func

# (Rand) - (+Inf) = (-Inf)
li			a1, 0x4f9502f9
li			a2, 0x7f800000
li			a3, 0xff800000
li			a4, 0xff800000
jal			ra, fsub_func

# (-Inf) - (Rand) = (-Inf)
li			a1, 0xff800000
li			a2, 0x4f9502f9
li			a3, 0xff800000
li			a4, 0xff800000
jal			ra, fsub_func

# (Rand) - (-Inf) = (+Inf)
li			a1, 0x4f9502f9
li			a2, 0xff800000
li			a3, 0x7f800000
li			a4, 0x7f800000
jal			ra, fsub_func

# (+Inf) - (+Inf) = qNaN
li			a1, 0x7f800000
li			a2, 0x7f800000
li			a3, 0x7fc00001
li			a4, 0x7fc00001
jal			ra, fsub_func

# (-Inf) - (-Inf) = qNaN
li			a1, 0xff800000
li			a2, 0xff800000
li			a3, 0x7fc00001
li			a4, 0x7fc00001
jal			ra, fsub_func

# (+Inf) - (-Inf) = (+Inf)
li			a1, 0x7f800000
li			a2, 0xff800000
li			a3, 0x7f800000
li			a4, 0x7f800000
jal			ra, fsub_func

# (-Inf) - (+Inf) = (-Inf)
li			a1, 0xff800000
li			a2, 0x7f800000
li			a3, 0xff800000
li			a4, 0xff800000
jal			ra, fsub_func

# NaN - (Rand) = NaN
li			a1, 0x7f922e2e
li			a2, 0x47392800
li			a3, 0x7f922e2e
li			a4, 0x7f922e2e
jal			ra, fsub_func

# (Rand) - NaN = NaN
li			a1, 0x47392800
li			a2, 0x7f922e2e
li			a3, 0x7f922e2e
li			a4, 0x7f922e2e
jal			ra, fsub_func

# (Large) - (Small) ~= (Large)
li			a1, 0x53800000
li			a2, 0x3f800000
li			a3, 0x537fffff
li			a4, 0x53800000
jal			ra, fsub_func

# (Small) - (Large) ~= (-Large)
li			a1, 0x3f800000
li			a2, 0x53800000
li			a3, 0xd3800000
li			a4, 0xd37fffff
jal			ra, fsub_func

# Overflow 1
li			a1, 0x7f7fff80
li			a2, 0xff7fff80
li			a3, 0x7f800000
li			a4, 0x7f800000
jal			ra, fsub_func

# Overflow 2
li			a1, 0xff7fff80
li			a2, 0x7f7fff80
li			a3, 0xff800000
li			a4, 0xff800000
jal			ra, fsub_func

# Subnormal - Subnormal = Normal
li			a1, 0x007fffff
li			a2, 0x80000001
li			a3, 0x00800000
li			a4, 0x00800000
jal			ra, fsub_func

# Normal - Subnormal = Subnormal 1
li			a1, 0x00800000
li			a2, 0x00000001
li			a3, 0x007fffff
li			a4, 0x007fffff
jal			ra, fsub_func

# Normal - Subnormal = Subnormal 2
li			a1, 0x00800000
li			a2, 0x007fffff
li			a3, 0x00000001
li			a4, 0x00000001
jal			ra, fsub_func

# Normal - Subnormal = Subnormal 3
li			a1, 0x00800000
li			a2, 0x00000fff
li			a3, 0x007ff001
li			a4, 0x007ff001
jal			ra, fsub_func

# Normal - Subnormal = Subnormal 4
li			a1, 0x00800000
li			a2, 0x00000800
li			a3, 0x007ff800
li			a4, 0x007ff800
jal			ra, fsub_func

# Normal - Normal = Subnormal
li			a1, 0x08800001
li			a2, 0x08800000
li			a3, 0x00010000
li			a4, 0x00010000
jal			ra, fsub_func

# (Rand) - (Rand) = (+0)
li			a1, 0x46947000
li			a2, 0x46947000
li			a3, 0x00000000
li			a4, 0x00000000
jal			ra, fsub_func

# (+0) - (+0) = (+0)
li			a1, 0x00000000
li			a2, 0x00000000
li			a3, 0x00000000
li			a4, 0x00000000
jal			ra, fsub_func

# (+0) - (-0) = (+0)
li			a1, 0x00000000
li			a2, 0x80000000
li			a3, 0x00000000
li			a4, 0x00000000
jal			ra, fsub_func

# (-0) - (+0) = (-0)
li			a1, 0x80000000
li			a2, 0x00000000
li			a3, 0x80000000
li			a4, 0x80000000
jal			ra, fsub_func

# (-0) - (-0) = (+0)
li			a1, 0x80000000
li			a2, 0x80000000
li			a3, 0x00000000
li			a4, 0x00000000
jal			ra, fsub_func

jal			x0, fsub_end

fsub_func:
fmv.w.x		f1, a1
fmv.w.x		f2, a2
fsub.s		f3, f1, f2, rdn
fmv.x.w		a5, f3
xor			a0, a3, a5
fsub.s		f3, f1, f2, rup
fmv.x.w		a5, f3
xor			a0, a4, a5
jr			ra

fsub_end:
nop
