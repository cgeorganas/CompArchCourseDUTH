`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module if_stage(
	input	logic			clk,
	input	logic			rst,

	input	logic	[31:0]	IF_ID_pc,
	input	logic	[31:0]	IM_inst,

	input	logic	[31:0]	IF_pc,
	input	logic	[31:0]	IF_inst,
	input	logic			IF_vld
);

endmodule
