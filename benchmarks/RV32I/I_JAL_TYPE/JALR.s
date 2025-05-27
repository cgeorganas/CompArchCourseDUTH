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
