# Test RAW behavior, gap=1
li a0,0x1
mv a1,a0

# Test RAW behavior, gap=2
li a0,0x2
add x0,x0,x0
mv a1,a0

# Test RAW behavior, gap=3
li a0,0x3
add x0,x0,x0
add x0,x0,x0
mv a1,a0

# Test RAW behavior, gap=4
li a0,0x4
add x0,x0,x0
add x0,x0,x0
add x0,x0,x0
mv a1,a0

# Test RAW behavior, gap=5
li a0,0x5
add x0,x0,x0
add x0,x0,x0
add x0,x0,x0
add x0,x0,x0
mv a1,a0

# Test RAW behavior, gap=6
li a0,0x6
add x0,x0,x0
add x0,x0,x0
add x0,x0,x0
add x0,x0,x0
add x0,x0,x0
mv a1,a0
