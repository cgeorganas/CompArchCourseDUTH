li		a1, 0x100

lui		a2, 0x12345
addi	a2, a2, 0x678
sw		a2, 0(a1)

flw		f3, 0(a1)
fmv.x.w	a3, f3
xor		a0, a2, a3

flw		f3, 1(a1)
fmv.x.w	a3, f3
xor		a0, a2, a3

flw		f3, 2(a1)
fmv.x.w	a3, f3
xor		a0, a2, a3

flw		f3, 3(a1)
fmv.x.w	a3, f3
xor		a0, a2, a3

lui		a2, 0x691a9
addi	a2, a2, 0x18d
sw		a2, 0(a1)

flw		f3, 0(a1)
fmv.x.w	a3, f3
xor		a0, a2, a3

flw		f3, 1(a1)
fmv.x.w	a3, f3
xor		a0, a2, a3

flw		f3, 2(a1)
fmv.x.w	a3, f3
xor		a0, a2, a3

flw		f3, 3(a1)
fmv.x.w	a3, f3
xor		a0, a2, a3
