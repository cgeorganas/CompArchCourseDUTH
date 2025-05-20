`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module stall(
	input	logic			clk,
	input	logic			rst,

	output logic			ST_if_id_en,
	output logic			ST_id_ex_en,
	output logic			ST_ex_mem_en,
	output logic			ST_mem_wb_en
);

assign ST_if_id_en = `TRUE;
assign ST_id_ex_en = `TRUE;
assign ST_ex_mem_en = `TRUE;
assign ST_mem_wb_en = `TRUE;

endmodule
