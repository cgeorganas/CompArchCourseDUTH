`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module fpu_int2flt(
	input	logic	[31:0]	in,
	input	logic			signed_input,
	output	logic	[34:0]	out
);

logic			sign;
assign			sign = signed_input&&in[31];

logic [31:0]	in_abs;
assign			in_abs = sign ? -in : in;

logic [4:0]		msb;
always_comb begin
	msb = 5'h0;
	for (int i=1; i<32; i++) begin
		if (in_abs[i]) msb = i;
	end
end

logic [30:0]	mantissa;
assign			mantissa = in_abs << (31-msb);

logic [7:0]		exponent;
assign			exponent = msb + 127;

assign out = (in==32'h0) ? 35'h0 : {sign, exponent, mantissa[30:6], |mantissa[5:0]};

endmodule
