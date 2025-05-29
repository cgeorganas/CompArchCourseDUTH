`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module fpu_flt2int(
	input	logic	[31:0]	in,
	input	logic			is_signed,
	output	logic	[34:0]	out
);

logic [7:0]		exponent;
assign			exponent = in[30:23];

logic [22:0]	mantissa;
assign			mantissa = in[22:0];

logic [57:0]	fixed_initial, fixed; // Fixed point intermediate res, 32 integer bits, 26 binary bits
assign			fixed_initial = {35'h1, mantissa};
assign			fixed = fixed_initial << (exponent-124);

assign 			out = {fixed[57:24], |fixed[23:0]};

endmodule
