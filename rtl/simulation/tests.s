# Normal
li			a1, 0x5499160e
li			a2, 0x570783c4
li			a3, 0x6c2212d9
li			a4, 0x6c2212da
jal			ra, fp_mult

# Pos * pos zero
li			a1, 0x5499160e
li			a2, 0x00000000
li			a3, 0x00000000
li			a4, 0x00000000
jal			ra, fp_mult

# Pos * neg zero
li			a1, 0x5499160e
li			a2, 0x80000000
li			a3, 0x80000000
li			a4, 0x80000000
jal			ra, fp_mult

# Neg * pos zero
li			a1, 0xd499160e
li			a2, 0x00000000
li			a3, 0x80000000
li			a4, 0x80000000
jal			ra, fp_mult

# Neg * neg zero
li			a1, 0xd499160e
li			a2, 0x80000000
li			a3, 0x00000000
li			a4, 0x00000000
jal			ra, fp_mult

# Pos * pos inf
li			a1, 0x5499160e
li			a2, 0x7f800000
li			a3, 0x7f800000
li			a4, 0x7f800000
jal			ra, fp_mult

# Pos * neg inf
li			a1, 0x5499160e
li			a2, 0xff800000
li			a3, 0xff800000
li			a4, 0xff800000
jal			ra, fp_mult

# Neg * pos inf
li			a1, 0xd499160e
li			a2, 0x7f800000
li			a3, 0xff800000
li			a4, 0xff800000
jal			ra, fp_mult

# Neg * neg inf
li			a1, 0xd499160e
li			a2, 0xff800000
li			a3, 0x7f800000
li			a4, 0x7f800000
jal			ra, fp_mult

# Pos overflow
li			a1, 0x7e5693a4
li			a2, 0x7e5693a4
li			a3, 0x7f800000
li			a4, 0x7f800000
jal			ra, fp_mult

# Neg overflow
li			a1, 0xfe5693a4
li			a2, 0x7e5693a4
li			a3, 0xff800000
li			a4, 0xff800000
jal			ra, fp_mult

# Pos zero * pos inf
li			a1, 0x00000000
li			a2, 0x7f800000
li			a3, 0x7fc00001
li			a4, 0x7fc00001
jal			ra, fp_mult

# Pos zero * neg inf
li			a1, 0x00000000
li			a2, 0xff800000
li			a3, 0x7fc00001
li			a4, 0x7fc00001
jal			ra, fp_mult

# Neg zero * pos inf
li			a1, 0x80000000
li			a2, 0x7f800000
li			a3, 0x7fc00001
li			a4, 0x7fc00001
jal			ra, fp_mult

# Neg zero * neg inf
li			a1, 0x80000000
li			a2, 0xff800000
li			a3, 0x7fc00001
li			a4, 0x7fc00001
jal			ra, fp_mult

# Subnormal staying subnormals 1
li			a1, 0x00057ae0
li			a2, 0x3f000000 # 0.5
li			a3, 0x0002bd70
li			a4, 0x0002bd70
jal			ra, fp_mult

# Subnormal staying subnormals 2
li			a1, 0x00057ae0
li			a2, 0x3e800000 # 0.25
li			a3, 0x00015eb8
li			a4, 0x00015eb8
jal			ra, fp_mult

# Subnormal staying subnormals 3
li			a1, 0x00057ae0
li			a2, 0x3e000000 # 0.125
li			a3, 0x0000af5c
li			a4, 0x0000af5c
jal			ra, fp_mult

# # Subnormal staying subnormals 4
# li			a1, 0x00000800
# li			a2, 0x40000000 # 2
# li			a3, 0x00001000
# li			a4, 0x00001000
# jal			ra, fp_mult

# Subnormal times one
li			a1, 0x007fffff
li			a2, 0x3f800000 # 1
li			a3, 0x007fffff
li			a4, 0x007fffff
jal			ra, fp_mult

# Subnormal barely exiting subnormals
li			a1, 0x007fffff
li			a2, 0x3f800001 # 1.00000001
li			a3, 0x007fffff
li			a4, 0x00800000
jal			ra, fp_mult

# Subnormal exiting subnormals 1
li			a1, 0x007fffff
li			a2, 0x40000000 # 2
li			a3, 0x00fffffe
li			a4, 0x00fffffe
jal			ra, fp_mult

# Subnormal exiting subnormals 2
li			a1, 0x007fffff
li			a2, 0x40800000 # 4
li			a3, 0x017ffffe
li			a4, 0x017ffffe
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
