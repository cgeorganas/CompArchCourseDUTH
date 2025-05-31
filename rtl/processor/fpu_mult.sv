`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module fpu_mult(
	input	logic	[31:0]	opa,
	input	logic	[31:0]	opb,
	input	logic	[47:0]	mult_result,
	output	logic	[34:0]	out
);

logic [47:0]	mult_result_norm;
assign			mult_result_norm = mult_result >> mult_result[47];

logic [25:0]	mantissa;
assign			mantissa = {mult_result_norm[45:21], |mult_result_norm[20:0]};

logic			sign;
assign			sign = opa[31]^opb[31];

logic [7:0]		exponent;
assign			exponent = opa[30:23] + opb[30:23] - 127 + mult_result[47];

assign			out = {sign, exponent, mantissa};

endmodule
