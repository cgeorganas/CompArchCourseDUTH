`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module ex_stage(
	input	logic			clk,
	input	logic			rst,

	input logic		[31:0]	ID_EX_alu_opa,
	input logic		[31:0]	ID_EX_alu_opb,
	input logic		[4:0]	ID_EX_alu_func,
	input logic				ID_EX_vld,

	output	logic	[31:0]	EX_alu_res,
	output	logic			EX_vld
);

endmodule
