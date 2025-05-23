label:
nop
nop
li		a1, 0x1
lui		a2, 0x80000
beq		a1, a2, label
bne		a1, a2, label
blt		a1, a2, label
bge		a1, a2, label
bltu	a1, a2, label
bgeu	a1, a2, label
