`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module id_stage(
	input	logic			clk,
	input	logic			rst,

	input	logic	[31:0]	RF_rs1_data,
	input	logic	[31:0]	RF_rs2_data,
	input	logic	[31:0]	IF_ID_pc,
	input	logic	[31:0]	IF_ID_inst,
	input	logic			IF_ID_vld,

	output	logic	[4:0]	ID_rs1,
	output	logic	[4:0]	ID_rs2,
	output	logic	[31:0]	ID_alu_opa,
	output	logic	[31:0]	ID_alu_opb,
	output	logic	[4:0]	ID_alu_func,
	output	logic			ID_vld,
	output	logic	[31:0]	ID_mem_din,
	output	logic	[1:0]	ID_mem_cmd,
	output	logic	[4:0]	ID_rd
);

assign ID_rs1 = IF_ID_inst[19:15];
assign ID_rs2 = IF_ID_inst[24:20];

assign ID_alu_opa = ID_rs1;
assign ID_alu_opb = ID_rs2;
assign ID_alu_func = `ALU_ADD;
assign ID_vld = `TRUE;

assign ID_mem_din = 32'h0;
assign ID_mem_cmd	= `BUS_NONE;
assign ID_rd = IF_ID_inst[11:7];

endmodule
