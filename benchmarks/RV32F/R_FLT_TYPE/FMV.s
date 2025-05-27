li		a1, 0x100
fmv.w.x	f1, a1
fmv.x.w	a2, f1
xor		a0, a1, a2

lui		a1, 0x12345
addi	a1, a1, 0x678
fmv.w.x	f1, a1
fmv.x.w	a2, f1
xor		a0, a1, a2
