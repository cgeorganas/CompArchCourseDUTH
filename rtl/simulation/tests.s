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
