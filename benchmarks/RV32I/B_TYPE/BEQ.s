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
