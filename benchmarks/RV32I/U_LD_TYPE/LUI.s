li		a1, 0xaaa
lui		a1, 0x12345

addi	a2, x0, 0x123
slli	a2, a2, 8
addi	a2, a2, 0x45
slli	a2, a2, 12

xor		a0, a1, a2
