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
