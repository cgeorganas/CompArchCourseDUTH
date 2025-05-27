lui		a1, 0x80000
li		a2, 0x1
bltu	a1, a2, bltu_error

li		a1, 0x2
li		a2, 0x1
bltu	a1, a2, bltu_error

li		a1, 0x1
li		a2, 0x1
bltu	a1, a2, bltu_error

li		a1, 0x1
li		a2, 0x2
bltu	a1, a2, bltu_end

bltu_error:
li		a0, 1

bltu_end:
nop
