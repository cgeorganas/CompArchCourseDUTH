quit -sim
file delete -force work

riscv64-unknown-elf-as -march=rv32im -mabi=ilp32 tests.s -o tests.o
riscv64-unknown-elf-objdump -d tests.o > tests.dmp
riscv64-unknown-elf-elf2hex --bit-width 32 --input tests.o --output testshex.txt

vlib work
vlog -f files_rtl.f

vsim processor_tb
log -r /*

add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers

run -all
