`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module mem_stage(
	input	logic			clk,
	input	logic			rst,

	input	logic	[31:0]	DM_mem_dout,
	input	logic	[31:0]	EX_MEM_alu_res,
	input	logic			EX_MEM_vld,
	input	logic	[31:0]	EX_MEM_mem_din,
	input	logic	[1:0]	EX_MEM_mem_cmd,

	output	logic	[31:0]	MEM_mem_addr,
	output	logic	[1:0]	MEM_mem_cmd,
	output	logic	[31:0]	MEM_mem_din,
	output	logic	[31:0]	MEM_alu_res,
	output	logic	[31:0]	MEM_mem_dout,
	output	logic	[1:0]	MEM_wb_sel,
	output	logic			MEM_vld
);

endmodule
