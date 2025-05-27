`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module fpu(
	input	logic			clk,
	input	logic			rst,
	input	logic	[31:0]	opa,
	input	logic	[31:0]	opb,
	input	logic	[4:0]	ID_EX_alu_func,

	output logic	[31:0]	fpu_res,
	output logic			fpu_busy
);

assign fpu_res = 32'h0;
assign fpu_busy = `FALSE;

endmodule
