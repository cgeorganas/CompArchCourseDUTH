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
