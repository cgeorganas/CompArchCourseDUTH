`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module stall(
	input	logic			clk,
	input	logic			rst,

	input	logic	[3:0]	ID_br_ctrl,
	input	logic			EX_alu_busy,


	output logic			ST_if_id_en,
	output logic			ST_id_ex_en,
	output logic			ST_ex_mem_en,
	output logic			ST_mem_wb_en,
	output logic			ST_br_stall
);

assign ST_if_id_en = ~EX_alu_busy;
assign ST_id_ex_en = ~EX_alu_busy;
assign ST_ex_mem_en = ~EX_alu_busy;
assign ST_mem_wb_en = ~EX_alu_busy;

assign ST_br_stall = (ID_br_ctrl[2:0]!=`DONT_BRANCH);

endmodule
