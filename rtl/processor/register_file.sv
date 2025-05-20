`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module register_file(
	input	logic			clk,
	input	logic			rst,

	input	logic	[31:0]	WB_data,
	input	logic	[4:0]	WB_rd,
	input	logic	[4:0]	ID_rs1,
	input	logic	[4:0]	ID_rs2,

	output	logic	[31:0]	RF_rs1_data,
	output	logic	[31:0]	RF_rs2_data
);

endmodule
