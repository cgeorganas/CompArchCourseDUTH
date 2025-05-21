`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module wb_stage(
	input	logic			clk,
	input	logic			rst,

	input	logic	[31:0]	MEM_WB_data,
	input	logic			MEM_WB_vld,
	input	logic	[4:0]	MEM_WB_rd,

	output	logic	[31:0]	WB_data,
	output	logic	[4:0]	WB_rd
);

assign WB_data = MEM_WB_data;
assign WB_rd = (MEM_WB_vld) ? MEM_WB_rd : `ZERO_REG;

endmodule
