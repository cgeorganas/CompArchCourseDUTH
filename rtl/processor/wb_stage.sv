`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module wb_stage(
	input	logic			clk,
	input	logic			rst,

	input	logic	[31:0]	MEM_WB_alu_res,
	input	logic	[31:0]	MEM_WB_mem_dout,
	input	logic	[1:0]	MEM_WB_wb_sel,
	input	logic			MEM_WB_vld,
	input	logic	[4:0]	MEM_WB_rd,

	output	logic	[31:0]	WB_data,
	output	logic	[4:0]	WB_rd
);

assign WB_data = (MEM_WB_wb_sel==`WB_SEL_ALU) ? MEM_WB_alu_res : MEM_WB_mem_dout;
assign WB_rd = (MEM_WB_vld) ? MEM_WB_rd : `ZERO_REG;

endmodule
