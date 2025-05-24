# This verification benchmark will set "a0" to a
# non zero value if the result does not match the expected value.



jal		a1, label_j0
label_j0:
la		a2, label_j0
sub		a0, a1, a2

jal		a1, label_j1
label_j1:
la		a2, label_j1
sub		a0, a1, a2
