# Subnormal * normal 1
li			a1, 0x00057ae0
li			a2, 0x3f000000
li			a3, 0x0002bd70
li			a4, 0x0002bd70
jal			ra, fp_mult

# Subnormal * normal 2
li			a1, 0x00057ae0
li			a2, 0x3e800000
li			a3, 0x00015eb8
li			a4, 0x00015eb8
jal			ra, fp_mult

# Subnormal * normal 3
li			a1, 0x00057ae0
li			a2, 0x3e000000
li			a3, 0x0000af5c
li			a4, 0x0000af5c
jal			ra, fp_mult

# Subnormal * normal 4
li			a1, 0x007fffff
li			a2, 0x3f800000
li			a3, 0x007fffff
li			a4, 0x007fffff
jal			ra, fp_mult

# Subnormal * normal 5
li			a1, 0x007fffff
li			a2, 0x3f800001
li			a3, 0x007fffff
li			a4, 0x00800000
jal			ra, fp_mult

# Subnormal * normal 6
li			a1, 0x007fffff
li			a2, 0x3f800001
li			a3, 0x007fffff
li			a4, 0x00800000
jal			ra, fp_mult

jal			x0, end

fp_mult:
fmv.w.x		f1, a1
fmv.w.x		f2, a2
fmul.s		f3, f1, f2, rdn
fmv.x.w		a5, f3
xor			a0, a3, a5
fmul.s		f3, f2, f1, rdn
fmv.x.w		a5, f3
xor			a0, a3, a5
fmul.s		f3, f1, f2, rup
fmv.x.w		a5, f3
xor			a0, a4, a5
fmul.s		f3, f2, f1, rup
fmv.x.w		a5, f3
xor			a0, a4, a5
jr			ra

end:
nop
