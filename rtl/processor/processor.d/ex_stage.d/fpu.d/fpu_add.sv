`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module fpu_add(
	input	logic	[31:0]	opa,
	input	logic	[31:0]	opb,
	output	logic	[34:0]	out
);

assign out = {opa, 3'b000};

endmodule
