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
