jal		a1, jal_label0
jal_label0:
la		a2, jal_label0
sub		a0, a1, a2

jal		a1, jal_label1
nop
jal_label1:
la		a2, jal_label1
addi	a2, a2, -4
sub		a0, a1, a2

jal		a1, jal_label2
nop
nop
jal_label2:
la		a2, jal_label2
addi	a2, a2, -8
sub		a0, a1, a2
