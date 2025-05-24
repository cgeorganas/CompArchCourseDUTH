# This verification benchmark will set "a0" to a
# non zero value if the result does not match the expected value.



# "BEQ" benchmark

beq_bench:
li		a3, 1

li		a1, 0x1
lui		a2, 0x80000
beq		a1, a2, error

li		a1, 0x1
li		a2, 0x1
beq		a1, a2, bne_bench

beq		a7, a7, error



# "BNE" benchmark

bne_bench:
li		a3, 2

li		a1, 0x1
li		a2, 0x1
bne		a1, a2, error

li		a1, 0x1
lui		a2, 0x80000
bne		a1, a2, blt_bench

beq		a7, a7, error



# "BLT" benchmark

blt_bench:
li		a3, 3

li		a1, 0x1
lui		a2, 0x80000
blt		a1, a2, error

li		a1, 0x2
li		a2, 0x1
blt		a1, a2, error

li		a1, 0x1
li		a2, 0x1
blt		a1, a2, error

li		a1, 0x1
li		a2, 0x2
blt		a1, a2, bge_bench

beq		a7, a7, error



# "BGE" benchmark

bge_bench:
li		a3, 4

lui		a1, 0x80000
li		a2, 0x1
bge		a1, a2, error

li		a1, 0x1
li		a2, 0x2
bge		a1, a2, error

li		a1, 0x1
li		a2, 0x1
bge		a1, a2, label_b0

beq		a7, a7, error

label_b0:
li		a1, 0x2
li		a2, 0x1
bge		a1, a2, bltu_bench

beq		a7, a7, error



# "BLTU" benchmark

bltu_bench:
li		a3, 5

li		a1, 0x1
lui		a2, 0x80000
bltu		a1, a2, label_b1

beq		a7, a7, error

label_b1:
li		a1, 0x2
li		a2, 0x1
bltu	a1, a2, error

li		a1, 0x1
li		a2, 0x1
bltu	a1, a2, error

li		a1, 0x1
li		a2, 0x2
bltu	a1, a2, bgeu_bench

beq		a7, a7, error



# "BGEU" benchmark

bgeu_bench:
li		a3, 6

lui		a1, 0x80000
li		a2, 0x1
bgeu	a1, a2, label_b2

beq		a7, a7, error

label_b2:
li		a1, 0x1
li		a2, 0x2
bgeu	a1, a2, error

li		a1, 0x1
li		a2, 0x1
bgeu	a1, a2, label_b3

beq		a7, a7, error

label_b3:
li		a1, 0x2
li		a2, 0x1
bgeu	a1, a2, end

error:
li		a0, 0x1

end:
li		a3, 7
nop
