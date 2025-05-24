# This verification benchmark will set "a0" to a
# non zero value if the result does not match the expected value.



jal		a1, label_j0
label_j0:
la		a2, label_j0
sub		a0, a1, a2

jal		a1, label_j1
nop
label_j1:
la		a2, label_j1
addi	a2, a2, -4
sub		a0, a1, a2

jal		a1, label_j2
nop
nop
label_j2:
la		a2, label_j2
addi	a2, a2, -8
sub		a0, a1, a2
