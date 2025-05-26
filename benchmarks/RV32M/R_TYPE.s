# This verification benchmark will set "a0" to a
# non zero value if the result does not match the expected value.



# "MUL" benchmark

# Test 1
li		a1, 0x00007e00
li		a2, 0xb6db6db7
li		a3, 0x00001200
mul		a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 0x00007fc0
li		a2, 0xb6db6db7
li		a3, 0x00001240
mul		a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, 0x00000000
li		a2, 0x00000000
li		a3, 0x00000000
mul		a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, 0x00000001
li		a2, 0x00000001
li		a3, 0x00000001
mul		a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 0x00000003
li		a2, 0x00000007
li		a3, 0x00000015
mul		a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 0x00000000
li		a2, 0xffff8000
li		a3, 0x00000000
mul		a4, a1, a2
xor		a0, a3, a4

# Test 7
li		a1, 0x80000000
li		a2, 0x00000000
li		a3, 0x00000000
mul		a4, a1, a2
xor		a0, a3, a4

# Test 8
li		a1, 0x80000000
li		a2, 0xffff8000
li		a3, 0x00000000
mul		a4, a1, a2
xor		a0, a3, a4

# Test 9
li		a1, 0xaaaaaaab
li		a2, 0x0002fe7d
li		a3, 0x0000ff7f
mul		a4, a1, a2
xor		a0, a3, a4

# Test 10
li		a1, 0x0002fe7d
li		a2, 0xaaaaaaab
li		a3, 0x0000ff7f
mul		a4, a1, a2
xor		a0, a3, a4

# Test 11
li		a1, 0xff000000
li		a2, 0xff000000
li		a3, 0x00000000
mul		a4, a1, a2
xor		a0, a3, a4

# Test 12
li		a1, 0xffffffff
li		a2, 0xffffffff
li		a3, 0x00000001
mul		a4, a1, a2
xor		a0, a3, a4

# Test 13
li		a1, 0xffffffff
li		a2, 0x00000001
li		a3, 0xffffffff
mul		a4, a1, a2
xor		a0, a3, a4

# Test 14
li		a1, 0x00000001
li		a2, 0xffffffff
li		a3, 0xffffffff
mul		a4, a1, a2
xor		a0, a3, a4



# "MULH" benchmark

# Test 1
li		a1, 0x00000000
li		a2, 0x00000000
li		a3, 0x00000000
mulh	a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 0x00000001
li		a2, 0x00000001
li		a3, 0x00000000
mulh	a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, 0x00000003
li		a2, 0x00000007
li		a3, 0x00000000
mulh	a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, 0x00000000
li		a2, 0xffff8000
li		a3, 0x00000000
mulh	a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 0x80000000
li		a2, 0x00000000
li		a3, 0x00000000
mulh	a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 0x40000000
li		a2, 0x00000004
li		a3, 0x00000001
mulh	a4, a1, a2
xor		a0, a3, a4

# Test 7
li		a1, 0xaaaaaaab
li		a2, 0x0002fe7d
li		a3, 0xffff0081
mulh	a4, a1, a2
xor		a0, a3, a4

# Test 8
li		a1, 0x0002fe7d
li		a2, 0xaaaaaaab
li		a3, 0xffff0081
mulh	a4, a1, a2
xor		a0, a3, a4

# Test 9
li		a1, 0xff000000
li		a2, 0xff000000
li		a3, 0x00010000
mulh	a4, a1, a2
xor		a0, a3, a4

# Test 10
li		a1, 0xffffffff
li		a2, 0xffffffff
li		a3, 0x00000000
mulh	a4, a1, a2
xor		a0, a3, a4

# Test 11
li		a1, 0xffffffff
li		a2, 0x00000001
li		a3, 0xffffffff
mulh	a4, a1, a2
xor		a0, a3, a4

# Test 12
li		a1, 0x00000001
li		a2, 0xffffffff
li		a3, 0xffffffff
mulh	a4, a1, a2
xor		a0, a3, a4



# "MULHSU" benchmark

# Test 1
li		a1, 0x00000000
li		a2, 0x00000000
li		a3, 0x00000000
mulhsu	a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 0x00000001
li		a2, 0x00000001
li		a3, 0x00000000
mulhsu	a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, 0x00000003
li		a2, 0x00000007
li		a3, 0x00000000
mulhsu	a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, 0x00000000
li		a2, 0xffff8000
li		a3, 0x00000000
mulhsu	a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 0x80000000
li		a2, 0x00000000
li		a3, 0x00000000
mulhsu	a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 0x80000000
li		a2, 0xffff8000
li		a3, 0x80004000
mulhsu	a4, a1, a2
xor		a0, a3, a4

# Test 7
li		a1, 0xaaaaaaab
li		a2, 0x0002fe7d
li		a3, 0xffff0081
mulhsu	a4, a1, a2
xor		a0, a3, a4

# Test 8
li		a1, 0x0002fe7d
li		a2, 0xaaaaaaab
li		a3, 0x0001fefe
mulhsu	a4, a1, a2
xor		a0, a3, a4

# Test 9
li		a1, 0xff000000
li		a2, 0xff000000
li		a3, 0xff010000
mulhsu	a4, a1, a2
xor		a0, a3, a4

# Test 10
li		a1, 0xffffffff
li		a2, 0xffffffff
li		a3, 0xffffffff
mulhsu	a4, a1, a2
xor		a0, a3, a4

# Test 11
li		a1, 0xffffffff
li		a2, 0x00000001
li		a3, 0xffffffff
mulhsu	a4, a1, a2
xor		a0, a3, a4

# Test 12
li		a1, 0x00000001
li		a2, 0xffffffff
li		a3, 0x00000000
mulhsu	a4, a1, a2
xor		a0, a3, a4



# "MULHU" benchmark

# Test 1
li		a1, 0x00000000
li		a2, 0x00000000
li		a3, 0x00000000
mulhu	a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 0x00000001
li		a2, 0x00000001
li		a3, 0x00000000
mulhu	a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, 0x00000003
li		a2, 0x00000007
li		a3, 0x00000000
mulhu	a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, 0x00000000
li		a2, 0xffff8000
li		a3, 0x00000000
mulhu	a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 0x80000000
li		a2, 0x00000000
li		a3, 0x00000000
mulhu	a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 0x80000000
li		a2, 0xffff8000
li		a3, 0x7fffc000
mulhu	a4, a1, a2
xor		a0, a3, a4

# Test 7
li		a1, 0xaaaaaaab
li		a2, 0x0002fe7d
li		a3, 0x0001fefe
mulhu	a4, a1, a2
xor		a0, a3, a4

# Test 8
li		a1, 0x0002fe7d
li		a2, 0xaaaaaaab
li		a3, 0x0001fefe
mulhu	a4, a1, a2
xor		a0, a3, a4

# Test 9
li		a1, 0xff000000
li		a2, 0xff000000
li		a3, 0xfe010000
mulhu	a4, a1, a2
xor		a0, a3, a4

# Test 10
li		a1, 0xffffffff
li		a2, 0xffffffff
li		a3, 0xfffffffe
mulhu	a4, a1, a2
xor		a0, a3, a4

# Test 11
li		a1, 0xffffffff
li		a2, 0x00000001
li		a3, 0x00000000
mulhu	a4, a1, a2
xor		a0, a3, a4

# Test 12
li		a1, 0x00000001
li		a2, 0xffffffff
li		a3, 0x00000000
mulhu	a4, a1, a2
xor		a0, a3, a4



# "DIV" benchmark

# Test 1
li		a1, 20
li		a2, 6
li		a3, 3
div		a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 20
li		a2, -6
li		a3, -3
div		a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, -20
li		a2, 6
li		a3, -3
div		a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, -20
li		a2, -6
li		a3, 3
div		a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 20
li		a2, 1
li		a3, 20
div		a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 20
li		a2, 20
li		a3, 1
div		a4, a1, a2
xor		a0, a3, a4

# Test 7
li		a1, 20
li		a2, 4
li		a3, 5
div		a4, a1, a2
xor		a0, a3, a4

# Test 8
li		a1, 20
li		a2, 21
li		a3, 0
div		a4, a1, a2
xor		a0, a3, a4

# Test 9
li		a1, 62975
li		a2, 83
li		a3, 758
div		a4, a1, a2
xor		a0, a3, a4

# Test 10
li		a1, 1
li		a2, 0
li		a3, -1
div		a4, a1, a2
xor		a0, a3, a4

# Test 11
li		a1, 34
li		a2, 0
li		a3, -1
div		a4, a1, a2
xor		a0, a3, a4

# Test 12
lui		a1, 0x80000
li		a2, 2
lui		a3, 0xc0000
div		a4, a1, a2
xor		a0, a3, a4

# Test 13
lui		a1, 0x80000
lui		a2, 0x40000
li		a3, -2
div		a4, a1, a2
xor		a0, a3, a4

# Test 14
lui		a1, 0x80000
li		a2, -1
lui		a3, 0x80000
div		a4, a1, a2
xor		a0, a3, a4



# "DIVU" benchmark

# Test 1
li		a1, 20
li		a2, 6
li		a3, 3
divu	a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 20
li		a2, -6
li		a3, 0
divu	a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, -20
li		a2, 6
li		a3, 715827879
divu	a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, -20
li		a2, -6
li		a3, 0
divu	a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 20
li		a2, 1
li		a3, 20
divu	a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 20
li		a2, 20
li		a3, 1
divu	a4, a1, a2
xor		a0, a3, a4

# Test 7
li		a1, 20
li		a2, 4
li		a3, 5
divu	a4, a1, a2
xor		a0, a3, a4

# Test 8
li		a1, 20
li		a2, 21
li		a3, 0
divu	a4, a1, a2
xor		a0, a3, a4

# Test 9
li		a1, 62975
li		a2, 83
li		a3, 758
divu	a4, a1, a2
xor		a0, a3, a4

# Test 10
li		a1, 1
li		a2, 0
li		a3, -1
divu	a4, a1, a2
xor		a0, a3, a4

# Test 11
li		a1, 34
li		a2, 0
li		a3, -1
divu	a4, a1, a2
xor		a0, a3, a4

# Test 12
lui		a1, 0x80000
li		a2, 2
lui		a3, 0x40000
divu	a4, a1, a2
xor		a0, a3, a4

# Test 13
lui		a1, 0x80000
lui		a2, 0x40000
li		a3, 2
divu	a4, a1, a2
xor		a0, a3, a4

# Test 14
lui		a1, 0x80000
li		a2, -1
lui		a3, 0
divu	a4, a1, a2
xor		a0, a3, a4



# "REM" benchmark

# Test 1
li		a1, 20
li		a2, 6
li		a3, 2
rem		a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 20
li		a2, -6
li		a3, 2
rem		a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, -20
li		a2, 6
li		a3, -2
rem		a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, -20
li		a2, -6
li		a3, -2
rem		a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 20
li		a2, 1
li		a3, 0
rem		a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 20
li		a2, 20
li		a3, 0
rem		a4, a1, a2
xor		a0, a3, a4

# Test 7
li		a1, 20
li		a2, 4
li		a3, 0
rem		a4, a1, a2
xor		a0, a3, a4

# Test 8
li		a1, 20
li		a2, 21
li		a3, 20
rem		a4, a1, a2
xor		a0, a3, a4

# Test 9
li		a1, 62975
li		a2, 83
li		a3, 61
rem		a4, a1, a2
xor		a0, a3, a4

# Test 10
li		a1, 1
li		a2, 0
li		a3, 1
rem		a4, a1, a2
xor		a0, a3, a4

# Test 11
li		a1, 34
li		a2, 0
li		a3, 34
rem		a4, a1, a2
xor		a0, a3, a4

# Test 12
lui		a1, 0x80000
li		a2, 2
li		a3, 0
rem		a4, a1, a2
xor		a0, a3, a4

# Test 13
lui		a1, 0x80000
lui		a2, 0x40000
li		a3, 0
rem		a4, a1, a2
xor		a0, a3, a4

# Test 14
lui		a1, 0x80000
li		a2, -1
li		a3, 0
rem		a4, a1, a2
xor		a0, a3, a4



# "REMU" benchmark

# Test 1
li		a1, 20
li		a2, 6
li		a3, 2
remu	a4, a1, a2
xor		a0, a3, a4

# Test 2
li		a1, 20
li		a2, -6
li		a3, 20
remu	a4, a1, a2
xor		a0, a3, a4

# Test 3
li		a1, -20
li		a2, 6
li		a3, 2
remu	a4, a1, a2
xor		a0, a3, a4

# Test 4
li		a1, -20
li		a2, -6
li		a3, -20
remu	a4, a1, a2
xor		a0, a3, a4

# Test 5
li		a1, 20
li		a2, 1
li		a3, 0
remu	a4, a1, a2
xor		a0, a3, a4

# Test 6
li		a1, 20
li		a2, 20
li		a3, 0
remu	a4, a1, a2
xor		a0, a3, a4

# Test 7
li		a1, 20
li		a2, 4
li		a3, 0
remu	a4, a1, a2
xor		a0, a3, a4

# Test 8
li		a1, 20
li		a2, 21
li		a3, 20
remu	a4, a1, a2
xor		a0, a3, a4

# Test 9
li		a1, 62975
li		a2, 83
li		a3, 61
remu	a4, a1, a2
xor		a0, a3, a4

# Test 10
li		a1, 1
li		a2, 0
li		a3, 1
remu	a4, a1, a2
xor		a0, a3, a4

# Test 11
li		a1, 34
li		a2, 0
li		a3, 34
remu	a4, a1, a2
xor		a0, a3, a4

# Test 12
lui		a1, 0x80000
li		a2, 2
li		a3, 0
remu	a4, a1, a2
xor		a0, a3, a4

# Test 13
lui		a1, 0x80000
lui		a2, 0x40000
li		a3, 0
remu	a4, a1, a2
xor		a0, a3, a4

# Test 14
lui		a1, 0x80000
li		a2, -1
lui		a3, 0x80000
remu	a4, a1, a2
xor		a0, a3, a4
