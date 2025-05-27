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
