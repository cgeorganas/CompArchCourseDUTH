li		a1, 20
li		a2, 6
li		a3, 2
rem		a4, a1, a2
xor		a0, a3, a4

li		a1, 20
li		a2, -6
li		a3, 2
rem		a4, a1, a2
xor		a0, a3, a4

li		a1, -20
li		a2, 6
li		a3, -2
rem		a4, a1, a2
xor		a0, a3, a4

li		a1, -20
li		a2, -6
li		a3, -2
rem		a4, a1, a2
xor		a0, a3, a4

li		a1, 20
li		a2, 1
li		a3, 0
rem		a4, a1, a2
xor		a0, a3, a4

li		a1, 20
li		a2, 20
li		a3, 0
rem		a4, a1, a2
xor		a0, a3, a4

li		a1, 20
li		a2, 4
li		a3, 0
rem		a4, a1, a2
xor		a0, a3, a4

li		a1, 20
li		a2, 21
li		a3, 20
rem		a4, a1, a2
xor		a0, a3, a4

li		a1, 62975
li		a2, 83
li		a3, 61
rem		a4, a1, a2
xor		a0, a3, a4

li		a1, 1
li		a2, 0
li		a3, 1
rem		a4, a1, a2
xor		a0, a3, a4

li		a1, 34
li		a2, 0
li		a3, 34
rem		a4, a1, a2
xor		a0, a3, a4

lui		a1, 0x80000
li		a2, 2
li		a3, 0
rem		a4, a1, a2
xor		a0, a3, a4

lui		a1, 0x80000
lui		a2, 0x40000
li		a3, 0
rem		a4, a1, a2
xor		a0, a3, a4

lui		a1, 0x80000
li		a2, -1
li		a3, 0
rem		a4, a1, a2
xor		a0, a3, a4
li		a1, 0x00000000
li		a2, 0x00000000
li		a3, 0x00000000
mulhsu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000001
li		a2, 0x00000001
li		a3, 0x00000000
mulhsu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000003
li		a2, 0x00000007
li		a3, 0x00000000
mulhsu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000000
li		a2, 0xffff8000
li		a3, 0x00000000
mulhsu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x80000000
li		a2, 0x00000000
li		a3, 0x00000000
mulhsu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x80000000
li		a2, 0xffff8000
li		a3, 0x80004000
mulhsu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0xaaaaaaab
li		a2, 0x0002fe7d
li		a3, 0xffff0081
mulhsu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x0002fe7d
li		a2, 0xaaaaaaab
li		a3, 0x0001fefe
mulhsu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0xff000000
li		a2, 0xff000000
li		a3, 0xff010000
mulhsu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0xffffffff
li		a3, 0xffffffff
mulhsu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0x00000001
li		a3, 0xffffffff
mulhsu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000001
li		a2, 0xffffffff
li		a3, 0x00000000
mulhsu	a4, a1, a2
xor		a0, a3, a4
li		a1, 0x00000000
li		a2, 0x00000000
li		a3, 0x00000000
mulhu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000001
li		a2, 0x00000001
li		a3, 0x00000000
mulhu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000003
li		a2, 0x00000007
li		a3, 0x00000000
mulhu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000000
li		a2, 0xffff8000
li		a3, 0x00000000
mulhu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x80000000
li		a2, 0x00000000
li		a3, 0x00000000
mulhu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x80000000
li		a2, 0xffff8000
li		a3, 0x7fffc000
mulhu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0xaaaaaaab
li		a2, 0x0002fe7d
li		a3, 0x0001fefe
mulhu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x0002fe7d
li		a2, 0xaaaaaaab
li		a3, 0x0001fefe
mulhu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0xff000000
li		a2, 0xff000000
li		a3, 0xfe010000
mulhu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0xffffffff
li		a3, 0xfffffffe
mulhu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0x00000001
li		a3, 0x00000000
mulhu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000001
li		a2, 0xffffffff
li		a3, 0x00000000
mulhu	a4, a1, a2
xor		a0, a3, a4
li		a1, 0x00000000
li		a2, 0x00000000
li		a3, 0x00000000
mulh	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000001
li		a2, 0x00000001
li		a3, 0x00000000
mulh	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000003
li		a2, 0x00000007
li		a3, 0x00000000
mulh	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000000
li		a2, 0xffff8000
li		a3, 0x00000000
mulh	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x80000000
li		a2, 0x00000000
li		a3, 0x00000000
mulh	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x40000000
li		a2, 0x00000004
li		a3, 0x00000001
mulh	a4, a1, a2
xor		a0, a3, a4

li		a1, 0xaaaaaaab
li		a2, 0x0002fe7d
li		a3, 0xffff0081
mulh	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x0002fe7d
li		a2, 0xaaaaaaab
li		a3, 0xffff0081
mulh	a4, a1, a2
xor		a0, a3, a4

li		a1, 0xff000000
li		a2, 0xff000000
li		a3, 0x00010000
mulh	a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0xffffffff
li		a3, 0x00000000
mulh	a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0x00000001
li		a3, 0xffffffff
mulh	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000001
li		a2, 0xffffffff
li		a3, 0xffffffff
mulh	a4, a1, a2
xor		a0, a3, a4
li		a1, 20
li		a2, 6
li		a3, 2
remu	a4, a1, a2
xor		a0, a3, a4

li		a1, 20
li		a2, -6
li		a3, 20
remu	a4, a1, a2
xor		a0, a3, a4

li		a1, -20
li		a2, 6
li		a3, 2
remu	a4, a1, a2
xor		a0, a3, a4

li		a1, -20
li		a2, -6
li		a3, -20
remu	a4, a1, a2
xor		a0, a3, a4

li		a1, 20
li		a2, 1
li		a3, 0
remu	a4, a1, a2
xor		a0, a3, a4

li		a1, 20
li		a2, 20
li		a3, 0
remu	a4, a1, a2
xor		a0, a3, a4

li		a1, 20
li		a2, 4
li		a3, 0
remu	a4, a1, a2
xor		a0, a3, a4

li		a1, 20
li		a2, 21
li		a3, 20
remu	a4, a1, a2
xor		a0, a3, a4

li		a1, 62975
li		a2, 83
li		a3, 61
remu	a4, a1, a2
xor		a0, a3, a4

li		a1, 1
li		a2, 0
li		a3, 1
remu	a4, a1, a2
xor		a0, a3, a4

li		a1, 34
li		a2, 0
li		a3, 34
remu	a4, a1, a2
xor		a0, a3, a4

lui		a1, 0x80000
li		a2, 2
li		a3, 0
remu	a4, a1, a2
xor		a0, a3, a4

lui		a1, 0x80000
lui		a2, 0x40000
li		a3, 0
remu	a4, a1, a2
xor		a0, a3, a4

lui		a1, 0x80000
li		a2, -1
lui		a3, 0x80000
remu	a4, a1, a2
xor		a0, a3, a4
li		a1, 20
li		a2, 6
li		a3, 3
div		a4, a1, a2
xor		a0, a3, a4

li		a1, 20
li		a2, -6
li		a3, -3
div		a4, a1, a2
xor		a0, a3, a4

li		a1, -20
li		a2, 6
li		a3, -3
div		a4, a1, a2
xor		a0, a3, a4

li		a1, -20
li		a2, -6
li		a3, 3
div		a4, a1, a2
xor		a0, a3, a4

li		a1, 20
li		a2, 1
li		a3, 20
div		a4, a1, a2
xor		a0, a3, a4

li		a1, 20
li		a2, 20
li		a3, 1
div		a4, a1, a2
xor		a0, a3, a4

li		a1, 20
li		a2, 4
li		a3, 5
div		a4, a1, a2
xor		a0, a3, a4

li		a1, 20
li		a2, 21
li		a3, 0
div		a4, a1, a2
xor		a0, a3, a4

li		a1, 62975
li		a2, 83
li		a3, 758
div		a4, a1, a2
xor		a0, a3, a4

li		a1, 1
li		a2, 0
li		a3, -1
div		a4, a1, a2
xor		a0, a3, a4

li		a1, 34
li		a2, 0
li		a3, -1
div		a4, a1, a2
xor		a0, a3, a4

lui		a1, 0x80000
li		a2, 2
lui		a3, 0xc0000
div		a4, a1, a2
xor		a0, a3, a4

lui		a1, 0x80000
lui		a2, 0x40000
li		a3, -2
div		a4, a1, a2
xor		a0, a3, a4

lui		a1, 0x80000
li		a2, -1
lui		a3, 0x80000
div		a4, a1, a2
xor		a0, a3, a4
li		a1, 0x00007e00
li		a2, 0xb6db6db7
li		a3, 0x00001200
mul		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00007fc0
li		a2, 0xb6db6db7
li		a3, 0x00001240
mul		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000000
li		a2, 0x00000000
li		a3, 0x00000000
mul		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000001
li		a2, 0x00000001
li		a3, 0x00000001
mul		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000003
li		a2, 0x00000007
li		a3, 0x00000015
mul		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000000
li		a2, 0xffff8000
li		a3, 0x00000000
mul		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x80000000
li		a2, 0x00000000
li		a3, 0x00000000
mul		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x80000000
li		a2, 0xffff8000
li		a3, 0x00000000
mul		a4, a1, a2
xor		a0, a3, a4

li		a1, 0xaaaaaaab
li		a2, 0x0002fe7d
li		a3, 0x0000ff7f
mul		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x0002fe7d
li		a2, 0xaaaaaaab
li		a3, 0x0000ff7f
mul		a4, a1, a2
xor		a0, a3, a4

li		a1, 0xff000000
li		a2, 0xff000000
li		a3, 0x00000000
mul		a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0xffffffff
li		a3, 0x00000001
mul		a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0x00000001
li		a3, 0xffffffff
mul		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x00000001
li		a2, 0xffffffff
li		a3, 0xffffffff
mul		a4, a1, a2
xor		a0, a3, a4
li		a1, 20
li		a2, 6
li		a3, 3
divu	a4, a1, a2
xor		a0, a3, a4

li		a1, 20
li		a2, -6
li		a3, 0
divu	a4, a1, a2
xor		a0, a3, a4

li		a1, -20
li		a2, 6
li		a3, 715827879
divu	a4, a1, a2
xor		a0, a3, a4

li		a1, -20
li		a2, -6
li		a3, 0
divu	a4, a1, a2
xor		a0, a3, a4

li		a1, 20
li		a2, 1
li		a3, 20
divu	a4, a1, a2
xor		a0, a3, a4

li		a1, 20
li		a2, 20
li		a3, 1
divu	a4, a1, a2
xor		a0, a3, a4

li		a1, 20
li		a2, 4
li		a3, 5
divu	a4, a1, a2
xor		a0, a3, a4

li		a1, 20
li		a2, 21
li		a3, 0
divu	a4, a1, a2
xor		a0, a3, a4

li		a1, 62975
li		a2, 83
li		a3, 758
divu	a4, a1, a2
xor		a0, a3, a4

li		a1, 1
li		a2, 0
li		a3, -1
divu	a4, a1, a2
xor		a0, a3, a4

li		a1, 34
li		a2, 0
li		a3, -1
divu	a4, a1, a2
xor		a0, a3, a4

lui		a1, 0x80000
li		a2, 2
lui		a3, 0x40000
divu	a4, a1, a2
xor		a0, a3, a4

lui		a1, 0x80000
lui		a2, 0x40000
li		a3, 2
divu	a4, a1, a2
xor		a0, a3, a4

lui		a1, 0x80000
li		a2, -1
lui		a3, 0
divu	a4, a1, a2
xor		a0, a3, a4
li		a1, 0x100

lui		a2, 0x12345
addi	a2, a2, 0x678
fmv.w.x	f2, a2

fsw		f2, 0(a1)
lw		a3, 0(a1)
xor		a0, a2, a3

fsw		f2, 1(a1)
lw		a3, 0(a1)
xor		a0, a2, a3

fsw		f2, 2(a1)
lw		a3, 0(a1)
xor		a0, a2, a3

fsw		f2, 3(a1)
lw		a3, 0(a1)
xor		a0, a2, a3

lui		a2, 0x691a9
addi	a2, a2, 0x18d
fmv.w.x	f2, a2

fsw		f2, 0(a1)
lw		a3, 0(a1)
xor		a0, a2, a3

fsw		f2, 1(a1)
lw		a3, 0(a1)
xor		a0, a2, a3

fsw		f2, 2(a1)
lw		a3, 0(a1)
xor		a0, a2, a3

fsw		f2, 3(a1)
lw		a3, 0(a1)
xor		a0, a2, a3
li		a1, 0x100
fmv.w.x	f1, a1
fmv.x.w	a2, f1
xor		a0, a1, a2

lui		a1, 0x12345
addi	a1, a1, 0x678
fmv.w.x	f1, a1
fmv.x.w	a2, f1
xor		a0, a1, a2
# Normal 1
li			a1, 0x40000000
li			a2, 0x40800000
li			a3, 0x41000000
li			a4, 0x41000000
jal			ra, fp_mult

# Normal 2
li			a1, 0x40000000
li			a2, 0xc0800000
li			a3, 0xc1000000
li			a4, 0xc1000000
jal			ra, fp_mult

# Normal 3
li			a1, 0xc0000000
li			a2, 0x40800000
li			a3, 0xc1000000
li			a4, 0xc1000000
jal			ra, fp_mult

# Normal 4
li			a1, 0xc0000000
li			a2, 0xc0800000
li			a3, 0x41000000
li			a4, 0x41000000
jal			ra, fp_mult

# Normal 5
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

# Overflow
li			a1, 0x7e5693a4
li			a2, 0x7e5693a4
li			a3, 0x7f800000
li			a4, 0x7f800000
jal			ra, fp_mult

# Borderline overflow
li			a1, 0x7effffff
li			a2, 0x40000000 # 2
li			a3, 0x7f7fffff
li			a4, 0x7f7fffff
jal			ra, fp_mult

# Underflow
li			a1, 0x00800000
li			a2, 0x00800000
li			a3, 0x00000000
li			a4, 0x00000001
jal			ra, fp_mult

# Borderline underflow
li			a1, 0x00000002
li			a2, 0x3f000000 # 0.5
li			a3, 0x00000001
li			a4, 0x00000001
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

# Subnormal staying subnormals 4
li			a1, 0x00000800
li			a2, 0x40000000 # 2
li			a3, 0x00001000
li			a4, 0x00001000
jal			ra, fp_mult

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

# Subnormal exiting subnormals 3
li			a1, 0x007fffff
li			a2, 0x40c00000 # 6
li			a3, 0x01bffffe
li			a4, 0x01bfffff
jal			ra, fp_mult

# Subnormal exiting subnormals 4
li			a1, 0x007fffff
li			a2, 0x41000000 # 8
li			a3, 0x01fffffe
li			a4, 0x01fffffe
jal			ra, fp_mult

# Normal barely entering subnormals
li			a1, 0x00fffffe
li			a2, 0x3f000000 # 0.5
li			a3, 0x007fffff
li			a4, 0x007fffff
jal			ra, fp_mult

# Normal entering subnormals 1
li			a1, 0x00fffff8
li			a2, 0x3e000000 # 0.125
li			a3, 0x001fffff
li			a4, 0x001fffff
jal			ra, fp_mult

# Normal entering subnormals 2
li			a1, 0x1f000000
li			a2, 0x1f000000
li			a3, 0x00080000
li			a4, 0x00080000
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
li			a1, 0

fcvt.s.wu	f1, a1, rne
fmv.x.w		a2, f1
li			a3, 0
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rtz
fmv.x.w		a2, f1
li			a3, 0
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rdn
fmv.x.w		a2, f1
li			a3, 0
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rup
fmv.x.w		a2, f1
li			a3, 0
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rmm
fmv.x.w		a2, f1
li			a3, 0
xor			a0, a2, a3



li			a1, 24

fcvt.s.wu	f1, a1, rne
fmv.x.w		a2, f1
li			a3, 0x41c00000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rtz
fmv.x.w		a2, f1
li			a3, 0x41c00000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rdn
fmv.x.w		a2, f1
li			a3, 0x41c00000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rup
fmv.x.w		a2, f1
li			a3, 0x41c00000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rmm
fmv.x.w		a2, f1
li			a3, 0x41c00000
xor			a0, a2, a3



li			a1, -24

fcvt.s.wu	f1, a1, rne
fmv.x.w		a2, f1
li			a3, 0x4f800000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rtz
fmv.x.w		a2, f1
li			a3, 0x4f7fffff
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rdn
fmv.x.w		a2, f1
li			a3, 0x4f7fffff
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rup
fmv.x.w		a2, f1
li			a3, 0x4f800000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rmm
fmv.x.w		a2, f1
li			a3, 0x4f800000
xor			a0, a2, a3



li			a1, 0x01000001

fcvt.s.wu	f1, a1, rne
fmv.x.w		a2, f1
li			a3, 0x4b800000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rtz
fmv.x.w		a2, f1
li			a3, 0x4b800000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rdn
fmv.x.w		a2, f1
li			a3, 0x4b800000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rup
fmv.x.w		a2, f1
li			a3, 0x4b800001
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rmm
fmv.x.w		a2, f1
li			a3, 0x4b800001
xor			a0, a2, a3



li			a1, 0xfeffffff

fcvt.s.wu	f1, a1, rne
fmv.x.w		a2, f1
li			a3, 0x4f7f0000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rtz
fmv.x.w		a2, f1
li			a3, 0x4f7effff
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rdn
fmv.x.w		a2, f1
li			a3, 0x4f7effff
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rup
fmv.x.w		a2, f1
li			a3, 0x4f7f0000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rmm
fmv.x.w		a2, f1
li			a3, 0x4f7f0000
xor			a0, a2, a3



li			a1, 0x7fffffc0

fcvt.s.wu	f1, a1, rne
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rtz
fmv.x.w		a2, f1
li			a3, 0x4effffff
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rdn
fmv.x.w		a2, f1
li			a3, 0x4effffff
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rup
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rmm
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3



li			a1, 0x80000040

fcvt.s.wu	f1, a1, rne
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rtz
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rdn
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rup
fmv.x.w		a2, f1
li			a3, 0x4f000001
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rmm
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3



li			a1, 0x7fffffff

fcvt.s.wu	f1, a1, rne
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rtz
fmv.x.w		a2, f1
li			a3, 0x4effffff
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rdn
fmv.x.w		a2, f1
li			a3, 0x4effffff
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rup
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rmm
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3



li			a1, 0x80000001

fcvt.s.wu	f1, a1, rne
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rtz
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rdn
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rup
fmv.x.w		a2, f1
li			a3, 0x4f000001
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rmm
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3



li			a1, 0x80000000

fcvt.s.wu	f1, a1, rne
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rtz
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rdn
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rup
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rmm
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3



li			a1, 0xffffffff

fcvt.s.wu	f1, a1, rne
fmv.x.w		a2, f1
li			a3, 0x4f800000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rtz
fmv.x.w		a2, f1
li			a3, 0x4f7fffff
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rdn
fmv.x.w		a2, f1
li			a3, 0x4f7fffff
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rup
fmv.x.w		a2, f1
li			a3, 0x4f800000
xor			a0, a2, a3

fcvt.s.wu	f1, a1, rmm
fmv.x.w		a2, f1
li			a3, 0x4f800000
xor			a0, a2, a3
li			a1, 0

fcvt.s.w	f1, a1, rne
fmv.x.w		a2, f1
li			a3, 0
xor			a0, a2, a3

fcvt.s.w	f1, a1, rtz
fmv.x.w		a2, f1
li			a3, 0
xor			a0, a2, a3

fcvt.s.w	f1, a1, rdn
fmv.x.w		a2, f1
li			a3, 0
xor			a0, a2, a3

fcvt.s.w	f1, a1, rup
fmv.x.w		a2, f1
li			a3, 0
xor			a0, a2, a3

fcvt.s.w	f1, a1, rmm
fmv.x.w		a2, f1
li			a3, 0
xor			a0, a2, a3



li			a1, 24

fcvt.s.w	f1, a1, rne
fmv.x.w		a2, f1
li			a3, 0x41c00000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rtz
fmv.x.w		a2, f1
li			a3, 0x41c00000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rdn
fmv.x.w		a2, f1
li			a3, 0x41c00000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rup
fmv.x.w		a2, f1
li			a3, 0x41c00000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rmm
fmv.x.w		a2, f1
li			a3, 0x41c00000
xor			a0, a2, a3



li			a1, -24

fcvt.s.w	f1, a1, rne
fmv.x.w		a2, f1
li			a3, 0xc1c00000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rtz
fmv.x.w		a2, f1
li			a3, 0xc1c00000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rdn
fmv.x.w		a2, f1
li			a3, 0xc1c00000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rup
fmv.x.w		a2, f1
li			a3, 0xc1c00000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rmm
fmv.x.w		a2, f1
li			a3, 0xc1c00000
xor			a0, a2, a3



li			a1, 0x01000001

fcvt.s.w	f1, a1, rne
fmv.x.w		a2, f1
li			a3, 0x4b800000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rtz
fmv.x.w		a2, f1
li			a3, 0x4b800000
xor			a0, a2, a3

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

fcvt.s.w	f1, a1, rne
fmv.x.w		a2, f1
li			a3, 0xcb800000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rtz
fmv.x.w		a2, f1
li			a3, 0xcb800000
xor			a0, a2, a3

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



li			a1, 0x7fffffc0

fcvt.s.w	f1, a1, rne
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rtz
fmv.x.w		a2, f1
li			a3, 0x4effffff
xor			a0, a2, a3

fcvt.s.w	f1, a1, rdn
fmv.x.w		a2, f1
li			a3, 0x4effffff
xor			a0, a2, a3

fcvt.s.w	f1, a1, rup
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rmm
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3



li			a1, 0x80000040

fcvt.s.w	f1, a1, rne
fmv.x.w		a2, f1
li			a3, 0xcf000000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rtz
fmv.x.w		a2, f1
li			a3, 0xceffffff
xor			a0, a2, a3

fcvt.s.w	f1, a1, rdn
fmv.x.w		a2, f1
li			a3, 0xcf000000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rup
fmv.x.w		a2, f1
li			a3, 0xceffffff
xor			a0, a2, a3

fcvt.s.w	f1, a1, rmm
fmv.x.w		a2, f1
li			a3, 0xcf000000
xor			a0, a2, a3



li			a1, 0x7fffffff

fcvt.s.w	f1, a1, rne
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rtz
fmv.x.w		a2, f1
li			a3, 0x4effffff
xor			a0, a2, a3

fcvt.s.w	f1, a1, rdn
fmv.x.w		a2, f1
li			a3, 0x4effffff
xor			a0, a2, a3

fcvt.s.w	f1, a1, rup
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rmm
fmv.x.w		a2, f1
li			a3, 0x4f000000
xor			a0, a2, a3



li			a1, 0x80000001

fcvt.s.w	f1, a1, rne
fmv.x.w		a2, f1
li			a3, 0xcf000000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rtz
fmv.x.w		a2, f1
li			a3, 0xceffffff
xor			a0, a2, a3

fcvt.s.w	f1, a1, rdn
fmv.x.w		a2, f1
li			a3, 0xcf000000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rup
fmv.x.w		a2, f1
li			a3, 0xceffffff
xor			a0, a2, a3

fcvt.s.w	f1, a1, rmm
fmv.x.w		a2, f1
li			a3, 0xcf000000
xor			a0, a2, a3



li			a1, 0x80000000

fcvt.s.w	f1, a1, rne
fmv.x.w		a2, f1
li			a3, 0xcf000000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rtz
fmv.x.w		a2, f1
li			a3, 0xcf000000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rdn
fmv.x.w		a2, f1
li			a3, 0xcf000000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rup
fmv.x.w		a2, f1
li			a3, 0xcf000000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rmm
fmv.x.w		a2, f1
li			a3, 0xcf000000
xor			a0, a2, a3



li			a1, 0xffffffff

fcvt.s.w	f1, a1, rne
fmv.x.w		a2, f1
li			a3, 0xbf800000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rtz
fmv.x.w		a2, f1
li			a3, 0xbf800000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rdn
fmv.x.w		a2, f1
li			a3, 0xbf800000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rup
fmv.x.w		a2, f1
li			a3, 0xbf800000
xor			a0, a2, a3

fcvt.s.w	f1, a1, rmm
fmv.x.w		a2, f1
li			a3, 0xbf800000
xor			a0, a2, a3
li			a4, 1
li			a1, 0x00000000
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 2
li			a1, 0x80000000
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 3
li			a1, 0x00000001
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3

li			a2, 0x00000001
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3



li			a4, 4
li			a1, 0x80000001
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 5
li			a1, 0x0015b229
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3

li			a2, 0x00000001
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3



li			a4, 6
li			a1, 0x8015b229
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3


li			a4, 7
li			a1, 0x007fffff
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3

li			a2, 0x00000001
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3



li			a4, 8
li			a1, 0x807fffff
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 9
li			a1, 0x00800000
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3

li			a2, 0x00000001
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3



li			a4, 10
li			a1, 0x80800000
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 11
li			a1, 0x25951248
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3

li			a2, 0x00000001
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3



li			a4, 12
li			a1, 0xa5951248
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 13
li			a1, 0x3dffffff
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3

li			a2, 0x00000001
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3



li			a4, 14
li			a1, 0xbdffffff
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 15
li			a1, 0x3e000000
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3

li			a2, 0x00000001
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3



li			a4, 16
li			a1, 0xbe000000
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 17
li			a1, 0x478bd288
fmv.w.x		f1, a1

li			a2, 0x000117a5
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3

li			a2, 0x000117a6
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3



li			a4, 18
li			a1, 0xc78bd288
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 19
li			a1, 0x4effffff
fmv.w.x		f1, a1

li			a2, 0x7fffff80
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 20
li			a1, 0xceffffff
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 21
li			a1, 0x4f000000
fmv.w.x		f1, a1

li			a2, 0x80000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 22
li			a1, 0xcf000000
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 23
li			a1, 0x4f295780
fmv.w.x		f1, a1

li			a2, 0xa9578000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 24
li			a1, 0xcf295780
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 25
li			a1, 0x4f7fffff
fmv.w.x		f1, a1

li			a2, 0xffffff00
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 26
li			a1, 0xcf7fffff
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 27
li			a1, 0x4f800000
fmv.w.x		f1, a1

li			a2, 0xffffffff
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 28
li			a1, 0xcf800000
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 29
li			a1, 0x5e0d4a80
fmv.w.x		f1, a1

li			a2, 0xffffffff
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 30
li			a1, 0xde0d4a80
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 31
li			a1, 0x7f7fffff
fmv.w.x		f1, a1

li			a2, 0xffffffff
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 32
li			a1, 0xff7fffff
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 33
li			a1, 0x7f800000
fmv.w.x		f1, a1

li			a2, 0xffffffff
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 34
li			a1, 0xff800000
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 35
li			a1, 0x7fc00001
fmv.w.x		f1, a1

li			a2, 0xffffffff
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 36
li			a1, 0xffc00001
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 37
li			a1, 0x7f800001
fmv.w.x		f1, a1

li			a2, 0xffffffff
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3



li			a4, 38
li			a1, 0xff800001
fmv.w.x		f1, a1

li			a2, 0x00000000
fcvt.wu.s	a3, f1, rne
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rtz
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rdn
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rup
xor			a0, a2, a3
fcvt.wu.s	a3, f1, rmm
xor			a0, a2, a3

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

li		a1, 0x100

lui		a2, 0x12345
addi	a2, a2, 0x678
sw		a2, 0(a1)

flw		f3, 0(a1)
fmv.x.w	a3, f3
xor		a0, a2, a3

flw		f3, 1(a1)
fmv.x.w	a3, f3
xor		a0, a2, a3

flw		f3, 2(a1)
fmv.x.w	a3, f3
xor		a0, a2, a3

flw		f3, 3(a1)
fmv.x.w	a3, f3
xor		a0, a2, a3

lui		a2, 0x691a9
addi	a2, a2, 0x18d
sw		a2, 0(a1)

flw		f3, 0(a1)
fmv.x.w	a3, f3
xor		a0, a2, a3

flw		f3, 1(a1)
fmv.x.w	a3, f3
xor		a0, a2, a3

flw		f3, 2(a1)
fmv.x.w	a3, f3
xor		a0, a2, a3

flw		f3, 3(a1)
fmv.x.w	a3, f3
xor		a0, a2, a3
li		a1, 0x1
lui		a2, 0x80000
beq		a1, a2, beq_error

li		a1, 0x1
li		a2, 0x1
beq		a1, a2, beq_end

beq_error:
li		a0, 1

beq_end:
nop
lui		a1, 0x80000
li		a2, 0x1
bge		a1, a2, bge_error

li		a1, 0x1
li		a2, 0x2
bge		a1, a2, bge_error

li		a1, 0x1
li		a2, 0x1
bge		a1, a2, bge_next

li		a0, 1

bge_next:
li		a1, 0x2
li		a2, 0x1
bge		a1, a2, bge_end

bge_error:
li		a0, 1

bge_end:
nop
li		a1, 0x1
lui		a2, 0x80000
blt		a1, a2, blt_error

li		a1, 0x2
li		a2, 0x1
blt		a1, a2, blt_error

li		a1, 0x1
li		a2, 0x1
blt		a1, a2, blt_error

li		a1, 0x1
li		a2, 0x2
blt		a1, a2, blt_end

blt_error:
li		a0, 1

blt_end:
nop
li		a1, 0x1
li		a2, 0x1
bne		a1, a2, bne_error

li		a1, 0x1
lui		a2, 0x80000
bne		a1, a2, bne_end

bne_error:
li		a0, 1

bne_end:
nop
lui		a1, 0x80000
li		a2, 0x1
bltu	a1, a2, bltu_error

li		a1, 0x2
li		a2, 0x1
bltu	a1, a2, bltu_error

li		a1, 0x1
li		a2, 0x1
bltu	a1, a2, bltu_error

li		a1, 0x1
li		a2, 0x2
bltu	a1, a2, bltu_end

bltu_error:
li		a0, 1

bltu_end:
nop
li		a1, 0x1
lui		a2, 0x80000
bgeu	a1, a2, bgeu_error

li		a1, 0x1
li		a2, 0x2
bgeu	a1, a2, bgeu_error

li		a1, 0x1
li		a2, 0x1
bgeu	a1, a2, bgeu_next

li		a0, 1

bgeu_next:
li		a1, 0x2
li		a2, 0x1
bgeu	a1, a2, bgeu_end

bgeu_error:
li		a0, 1

bgeu_end:
nop
li		a1, 0x100

lui		a2, 0x55555
addi	a2, a2, 0x555
sw		a2, 0(a1)

lui		a2, 0x2
addi	a2, a2, 0x222

lui		a4, 0x55552
addi	a4, a4, 0x222

sh		a2, 0(a1)
lw		a3, 0(a1)
xor		a0, a3, a4

sh		a2, 1(a1)
lw		a3, 0(a1)
xor		a0, a3, a4

lui		a2, 0x11110
srai	a2, a2, 0x10

lui		a4, 0x11112
addi	a4, a4, 0x222

sh		a2, 2(a1)
lw		a3, 0(a1)
xor		a0, a3, a4

sh		a2, 3(a1)
lw		a3, 0(a1)
xor		a0, a3, a4
li		a1, 0x100

lui		a2, 0x12345
addi	a2, a2, 0x678
sw		a2, 0(a1)
lw		a3, 0(a1)
xor		a0, a2, a3

sw		a2, 1(a1)
lw		a3, 0(a1)
xor		a0, a2, a3

sw		a2, 2(a1)
lw		a3, 0(a1)
xor		a0, a2, a3

sw		a2, 3(a1)
lw		a3, 0(a1)
xor		a0, a2, a3

lui		a2, 0x691a9
addi	a2, a2, 0x18d
sw		a2, 0(a1)
lw		a3, 0(a1)
xor		a0, a2, a3

sw		a2, 1(a1)
lw		a3, 0(a1)
xor		a0, a2, a3

sw		a2, 2(a1)
lw		a3, 0(a1)
xor		a0, a2, a3

sw		a2, 3(a1)
lw		a3, 0(a1)
xor		a0, a2, a3
li		a1, 0x100

li		a2, 0x0
sw		a2, 0(a1)

li		a2, 0x11
sb		a2, 0(a1)
lw		a3, 0(a1)
li		a4, 0x11
xor		a0, a3, a4

li		a2, 0x22
sb		a2, 1(a1)
lw		a3, 0(a1)
lui		a4, 0x2
addi	a4, a4, 0x211
xor		a0, a3, a4

li		a2, 0x33
sb		a2, 2(a1)
lw		a3, 0(a1)
lui		a4, 0x332
addi	a4, a4, 0x211
xor		a0, a3, a4

li		a2, 0x44
sb		a2, 3(a1)
lw		a3, 0(a1)
lui		a4, 0x44332
addi	a4, a4, 0x211
xor		a0, a3, a4
li		a1, 0xaaa
lui		a1, 0x12345

addi	a2, x0, 0x123
slli	a2, a2, 8
addi	a2, a2, 0x45
slli	a2, a2, 12

xor		a0, a1, a2
jal		a1, jal_label0
jal_label0:
la		a2, jal_label0
sub		a0, a1, a2

jal		a1, jal_label1
nop
jal_label1:
la		a2, jal_label1
addi	a2, a2, -4
sub		a0, a1, a2

jal		a1, jal_label2
nop
nop
jal_label2:
la		a2, jal_label2
addi	a2, a2, -8
sub		a0, a1, a2
li		a1, 0x100
lui		a2, 0x81238
addi	a2, a2, 0x456
sw		a2, 0(a1)

lw		a3, 0(a1)
xor		a0, a2, a3

lw		a3, 1(a1)
xor		a0, a2, a3

lw		a3, 2(a1)
xor		a0, a2, a3

lw		a3, 3(a1)
xor		a0, a2, a3
li		a1, 0x100
lui		a2, 0x81238
addi	a2, a2, 0x456
sw		a2, 0(a1)

li		a4, 0x56

lb		a3, 0(a1)
xor		a0, a3, a4

lui		a4, 0xfffff
srai	a4, a4, 0x4
addi	a4, a4, 0x84

lb		a3, 1(a1)
xor		a0, a3, a4

li		a4, 0x23

lb		a3, 2(a1)
xor		a0, a3, a4

lui		a4, 0xfffff
srai	a4, a4, 0x4
addi	a4, a4, 0x81

lb		a3, 3(a1)
xor		a0, a3, a4
li		a1, 0x100
lui		a2, 0x81238
addi	a2, a2, 0x456
sw		a2, 0(a1)

lui		a4, 0x8
addi	a4, a4, 0x456

lhu		a3, 0(a1)
xor		a0, a3, a4

lhu		a3, 1(a1)
xor		a0, a3, a4

lui		a4, 0x8
addi	a4, a4, 0x123

lhu		a3, 2(a1)
xor		a0, a3, a4

lhu		a3, 3(a1)
xor		a0, a3, a4
li		a1, 0x100
lui		a2, 0x81238
addi	a2, a2, 0x456
sw		a2, 0(a1)

li		a4, 0x56

lbu		a3, 0(a1)
xor		a0, a3, a4

li		a4, 0x84

lbu		a3, 1(a1)
xor		a0, a3, a4

li		a4, 0x23

lbu		a3, 2(a1)
xor		a0, a3, a4

li		a4, 0x81

lbu		a3, 3(a1)
xor		a0, a3, a4
li		a1, 0x100
lui		a2, 0x81238
addi	a2, a2, 0x456
sw		a2, 0(a1)

lui		a4, 0xffff8
addi	a4, a4, 0x456

lh		a3, 0(a1)
xor		a0, a3, a4

lh		a3, 1(a1)
xor		a0, a3, a4

lui		a4, 0xffff8
addi	a4, a4, 0x123

lh		a3, 2(a1)
xor		a0, a3, a4

lh		a3, 3(a1)
xor		a0, a3, a4
auipc	a1, 0
auipc	a2, 0
addi	a1, a1, 4
xor		a0, a1, a2

auipc	a1, 0
nop
auipc	a2, 0
addi	a1, a1, 8
xor		a0, a1, a2

auipc	a1, 0x1
auipc	a2, 0
addi	a1, a1, 4
lui		a3, 0x1
add		a2, a2, a3
xor		a0, a1, a2
auipc	a1, 0
jalr	a2, a1, 12
li		a0, 1
addi	a1, a1, 8
xor		a0, a1, a2

auipc	a1, 0
jalr	a2, a1, 20
li		a0, 1
li		a0, 1
li		a0, 1
addi	a1, a1, 8
xor		a0, a1, a2
li		a1, 0x1
li		a2, 0x1
li		a3, 0x2
sll		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x1234
li		a2, 0x4
li		a3, 0x12340
sll		a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0x2
li		a3, 0xfffffffc
sll		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x11111111
li		a2, 0x1f
li		a3, 0x80000000
sll		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x11111111
li		a2, 0xf1f
li		a3, 0x80000000
sll		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x80000000
li		a2, 0x1
li		a3, 0x0
sll		a4, a1, a2
xor		a0, a3, a4
li		a1, 0x93
li		a2, 0x55
li		a3, 0x3e
sub		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x63
li		a2, 0x68
li		a3, 0xfffffffb
sub		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x100
li		a2, 0x0
li		a3, 0x100
sub		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x0
li		a2, 0x1
li		a3, 0xffffffff
sub		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x0
li		a2, 0xf
li		a3, 0xfffffff1
sub		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x1234
li		a2, 0x1234
li		a3, 0x0
sub		a4, a1, a2
xor		a0, a3, a4
li		a1, 0x2
li		a2, 0x1
li		a3, 0x1
srl		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x12340
li		a2, 0x4
li		a3, 0x1234
srl		a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0x4
li		a3, 0x0fffffff
srl		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x88888888
li		a2, 0x1f
li		a3, 0x1
srl		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x88888888
li		a2, 0xf1f
li		a3, 0x1
srl		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x1
li		a2, 0x1
li		a3, 0x0
srl		a4, a1, a2
xor		a0, a3, a4
li		a1, 0x29
li		a2, 0x4c
li		a3, 0x75
add		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x3f
li		a2, 0x52
li		a3, 0x91
add		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x100
li		a2, 0x0
li		a3, 0x100
add		a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0x1
li		a3, 0x0
add		a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0x2
li		a3, 0x1
add		a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0xffffffff
li		a3, 0xfffffffe
add		a4, a1, a2
xor		a0, a3, a4
li		a1, 0x0
li		a2, 0x1
li		a3, 0x1
xor		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x1
li		a2, 0x3
li		a3, 0x2
xor		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x378
li		a2, 0x378
li		a3, 0x0
xor		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x284
li		a2, 0x0
li		a3, 0x284
xor		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x33333333
li		a2, 0xcccccccc
li		a3, 0xffffffff
xor		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x33333333
li		a2, 0x22221111
li		a3, 0x11112222
xor		a4, a1, a2
xor		a0, a3, a4
li		a1, 0xff00
li		a2, 0x00ff
li		a3, 0x0000
and		a4, a1, a2
xor		a0, a3, a4

li		a1, 0xfff0
li		a2, 0x00ff
li		a3, 0x00f0
and		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x474
li		a2, 0x474
li		a3, 0x474
and		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x141
li		a2, 0x141
li		a3, 0x141
and		a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0x12345678
li		a3, 0x12345678
and		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x0
li		a2, 0x12345678
li		a3, 0x0
and		a4, a1, a2
xor		a0, a3, a4
li		a1, 0x2
li		a2, 0x1
li		a3, 0x0
sltu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x1
li		a2, 0x2
li		a3, 0x1
sltu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x363
li		a2, 0x275
li		a3, 0x0
sltu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0x264
li		a2, 0x784
li		a3, 0x1
sltu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0x1
li		a3, 0x0
sltu	a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0xfffffffe
li		a3, 0x0
sltu	a4, a1, a2
xor		a0, a3, a4
li		a1, 0x2
li		a2, 0x1
li		a3, 0x1
sra		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x12340
li		a2, 0x4
li		a3, 0x1234
sra		a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0x4
li		a3, 0xffffffff
sra		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x88888888
li		a2, 0x1f
li		a3, 0xffffffff
sra		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x88888888
li		a2, 0xf1f
li		a3, 0xffffffff
sra		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x1
li		a2, 0x1
li		a3, 0x0
sra		a4, a1, a2
xor		a0, a3, a4
li		a1, 0xff00
li		a2, 0x00ff
li		a3, 0xffff
or		a4, a1, a2
xor		a0, a3, a4

li		a1, 0xf000
li		a2, 0x00ff
li		a3, 0xf0ff
or		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x645
li		a2, 0x645
li		a3, 0x645
or		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x734
li		a2, 0x734
li		a3, 0x734
or		a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0x12345678
li		a3, 0xffffffff
or		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x0
li		a2, 0x12345678
li		a3, 0x12345678
or		a4, a1, a2
xor		a0, a3, a4
li		a1, 0x2
li		a2, 0x1
li		a3, 0x0
slt		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x1
li		a2, 0x2
li		a3, 0x1
slt		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x363
li		a2, 0x275
li		a3, 0x0
slt		a4, a1, a2
xor		a0, a3, a4

li		a1, 0x264
li		a2, 0x784
li		a3, 0x1
slt		a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0x1
li		a3, 0x1
slt		a4, a1, a2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a2, 0xfffffffe
li		a3, 0x0
slt		a4, a1, a2
xor		a0, a3, a4
li		a1, 0x0
li		a3, 0x1
xori	a4, a1, 0x1
xor		a0, a3, a4

li		a1, 0x1
li		a3, 0x2
xori	a4, a1, 0x3
xor		a0, a3, a4

li		a1, 0x378
li		a3, 0x0
xori	a4, a1, 0x378
xor		a0, a3, a4

li		a1, 0x284
li		a3, 0x284
xori	a4, a1, 0x0
xor		a0, a3, a4

li		a1, 0x33
li		a3, 0xcc
xori	a4, a1, 0xff
xor		a0, a3, a4

li		a1, 0x33
li		a3, 0x12
xori	a4, a1, 0x21
xor		a0, a3, a4
li		a1, 0x2
li		a3, 0x1
srli	a4, a1, 0x1
xor		a0, a3, a4

li		a1, 0x12340
li		a3, 0x1234
srli	a4, a1, 0x4
xor		a0, a3, a4

li		a1, 0xffffffff
li		a3, 0x0fffffff
srli	a4, a1, 0x4
xor		a0, a3, a4

li		a1, 0x88888888
li		a3, 0x1
srli	a4, a1, 0x1f
xor		a0, a3, a4

li		a1, 0x88888888
li		a3, 0x1
srli	a4, a1, 0x1f
xor		a0, a3, a4

li		a1, 0x1
li		a3, 0x0
srli	a4, a1, 0x1
xor		a0, a3, a4
li		a1, 0x2
li		a3, 0x0
slti	a4, a1, 0x1
xor		a0, a3, a4

li		a1, 0x1
li		a3, 0x1
slti	a4, a1, 0x2
xor		a0, a3, a4

li		a1, 0x363
li		a3, 0x0
slti	a4, a1, 0x275
xor		a0, a3, a4

li		a1, 0x264
li		a3, 0x1
slti	a4, a1, 0x784
xor		a0, a3, a4

li		a1, 0xffffffff
li		a3, 0x1
slti	a4, a1, 0x1
xor		a0, a3, a4

li		a1, 0xffffffff
li		a3, 0x0
slti	a4, a1, -2
xor		a0, a3, a4
li		a1, 0x2
li		a3, 0x0
sltiu	a4, a1, 0x1
xor		a0, a3, a4

li		a1, 0x1
li		a3, 0x1
sltiu	a4, a1, 0x2
xor		a0, a3, a4

li		a1, 0x363
li		a3, 0x0
sltiu	a4, a1, 0x275
xor		a0, a3, a4

li		a1, 0x264
li		a3, 0x1
sltiu	a4, a1, 0x784
xor		a0, a3, a4

li		a1, 0xffffffff
li		a3, 0x0
sltiu	a4, a1, 0x1
xor		a0, a3, a4

li		a1, 0xffffffff
li		a3, 0x0
sltiu	a4, a1, -2
xor		a0, a3, a4
li		a1, 0xff00
li		a3, 0x0000
andi	a4, a1, 0x00ff
xor		a0, a3, a4

li		a1, 0xfff0
li		a3, 0x00f0
andi	a4, a1, 0x00ff
xor		a0, a3, a4

li		a1, 0x74
li		a3, 0x74
andi	a4, a1, 0x74
xor		a0, a3, a4

li		a1, 0x14
li		a3, 0x14
andi	a4, a1, 0x14
xor		a0, a3, a4

li		a1, 0xfff
li		a3, 0x123
andi	a4, a1, 0x123
xor		a0, a3, a4

li		a1, 0x0
li		a3, 0x0
andi	a4, a1, 0x123
xor		a0, a3, a4
li		a1, 0x29
li		a3, 0x75
addi	a4, a1, 0x4c
xor		a0, a3, a4

li		a1, 0x3f
li		a3, 0x91
addi	a4, a1, 0x52
xor		a0, a3, a4

li		a1, 0x100
li		a3, 0x100
addi	a4, a1, 0x0
xor		a0, a3, a4

li		a1, 0xffffffff
li		a3, 0x0
addi	a4, a1, 0x1
xor		a0, a3, a4

li		a1, 0xffffffff
li		a3, 0x1
addi	a4, a1, 0x2
xor		a0, a3, a4

li		a1, 0xffffffff
li		a3, 0xfffffffe
addi	a4, a1, -1
xor		a0, a3, a4
li		a1, 0x2
li		a3, 0x1
srai	a4, a1, 0x1
xor		a0, a3, a4

li		a1, 0x12340
li		a3, 0x1234
srai	a4, a1, 0x4
xor		a0, a3, a4

li		a1, 0xffffffff
li		a3, 0xffffffff
srai	a4, a1, 0x4
xor		a0, a3, a4

li		a1, 0x88888888
li		a3, 0xffffffff
srai	a4, a1, 0x1f
xor		a0, a3, a4

li		a1, 0x88888888
li		a3, 0xffffffff
srai	a4, a1, 0x1f
xor		a0, a3, a4

li		a1, 0x1
li		a3, 0x0
srai	a4, a1, 0x1
xor		a0, a3, a4
li		a1, 0x1
li		a3, 0x2
slli	a4, a1, 0x1
xor		a0, a3, a4

li		a1, 0x1234
li		a3, 0x12340
slli	a4, a1, 0x4
xor		a0, a3, a4

li		a1, 0xffffffff
li		a3, 0xfffffffc
slli	a4, a1, 0x2
xor		a0, a3, a4

li		a1, 0x11111111
li		a3, 0x80000000
slli	a4, a1, 0x1f
xor		a0, a3, a4

li		a1, 0x11111111
li		a3, 0x80000000
slli	a4, a1, 0x1f
xor		a0, a3, a4

li		a1, 0x80000000
li		a3, 0x0
slli	a4, a1, 0x1
xor		a0, a3, a4
li		a1, 0xff00
li		a3, 0xffff
ori		a4, a1, 0x00ff
xor		a0, a3, a4

li		a1, 0xf000
li		a3, 0xf0ff
ori		a4, a1, 0x00ff
xor		a0, a3, a4

li		a1, 0x45
li		a3, 0x45
ori		a4, a1, 0x45
xor		a0, a3, a4

li		a1, 0x34
li		a3, 0x34
ori		a4, a1, 0x34
xor		a0, a3, a4

li		a1, 0xfff
li		a3, 0xfff
ori		a4, a1, 0x123
xor		a0, a3, a4

li		a1, 0x0
li		a3, 0x123
ori		a4, a1, 0x123
xor		a0, a3, a4
