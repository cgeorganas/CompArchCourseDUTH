`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module stall(
	input	logic			clk,
	input	logic			rst,

	input	logic	[4:0]	ID_rs1,
	input	logic	[4:0]	ID_rs2,
	input	logic	[4:0]	ID_EX_rd,
	input	logic	[1:0]	ID_EX_mem_cmd,

	output logic			ST_if_id_en,
	output logic			ST_id_ex_en,
	output logic			ST_ex_mem_en,
	output logic			ST_mem_wb_en
);

// This logic detects data-memory read commands that are in the pipeline
// If the memory data needs to be forwarded, but hasn't been read yet, the pipeline will stall
logic rs_match, mem_stall;
assign rs_match = (ID_rs1==ID_EX_rd)||(ID_rs2==ID_EX_rd);
assign mem_stall = (rs_match)&&(ID_EX_rd!=`ZERO_REG)&&(ID_EX_mem_cmd==`BUS_LOAD);

assign ST_if_id_en = ~mem_stall;
assign ST_id_ex_en = `TRUE;
assign ST_ex_mem_en = `TRUE;
assign ST_mem_wb_en = `TRUE;

endmodule
