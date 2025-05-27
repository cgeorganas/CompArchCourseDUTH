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
