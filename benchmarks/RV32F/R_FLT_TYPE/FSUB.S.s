# (+10) - (+2) = (+8)
li			a1, 0x41200000
li			a2, 0x40000000
li			a3, 0x41000000
li			a4, 0x41000000
jal			ra, fsub_func

# (+10) - (-2) = (+12)
li			a1, 0x41200000
li			a2, 0xc0000000
li			a3, 0x41400000
li			a4, 0x41400000
jal			ra, fsub_func

# (-10) - (+2) = (-12)
li			a1, 0xc1200000
li			a2, 0x40000000
li			a3, 0xc1400000
li			a4, 0xc1400000
jal			ra, fsub_func

# (-10) - (-2) = (-8)
li			a1, 0xc1200000
li			a2, 0xc0000000
li			a3, 0xc1000000
li			a4, 0xc1000000
jal			ra, fsub_func

# (+2) - (+10) = (-8)
li			a1, 0x40000000
li			a2, 0x41200000
li			a3, 0xc1000000
li			a4, 0xc1000000
jal			ra, fsub_func

# (+2) - (-10) = (+12)
li			a1, 0x40000000
li			a2, 0xc1200000
li			a3, 0x41400000
li			a4, 0x41400000
jal			ra, fsub_func

# (-2) - (+10) = (-12)
li			a1, 0xc0000000
li			a2, 0x41200000
li			a3, 0xc1400000
li			a4, 0xc1400000
jal			ra, fsub_func

# (-2) - (-10) = (+8)
li			a1, 0xc0000000
li			a2, 0xc1200000
li			a3, 0x41000000
li			a4, 0x41000000
jal			ra, fsub_func

jal			x0, fsub_end

fsub_func:
fmv.w.x		f1, a1
fmv.w.x		f2, a2
fsub.s		f3, f1, f2, rdn
fmv.x.w		a5, f3
xor			a0, a3, a5
fsub.s		f3, f1, f2, rup
fmv.x.w		a5, f3
xor			a0, a4, a5
jr			ra

fsub_end:
nop
