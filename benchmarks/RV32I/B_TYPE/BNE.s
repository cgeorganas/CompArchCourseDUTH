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
