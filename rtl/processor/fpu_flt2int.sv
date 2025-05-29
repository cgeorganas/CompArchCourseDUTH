`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

`define RNE 3'b000
`define RTZ 3'b001
`define RDN 3'b010
`define RUP 3'b011
`define RMM 3'b100

module fpu_flt2int(
	input	logic	[31:0]	in,
	input	logic			is_signed,
	input	logic	[2:0]	rm,
	output	logic	[31:0]	out
);

logic [7:0]		exponent;
assign			exponent = in[30:23];

logic [22:0]	mantissa;
assign			mantissa = in[22:0];

logic [57:0]	fixed_initial, fixed; // Fixed point intermediate res, 32 integer bits, 26 binary bits
assign			fixed_initial = {35'h1, mantissa};

always_comb begin
	if (in==32'h0)
		fixed = {58'h0};
	else if (exponent<123)
		fixed = {58'h1};
	else if (exponent<159)
		fixed = fixed_initial << (exponent-124);
	else
		fixed = {32'hffff_ffff, 26'h0};
end

logic round_up;
logic sign, g, r, s, lsb;
assign sign = in[31];
assign lsb	= fixed[26];
assign g	= fixed[25];
assign r	= fixed[24];
assign s	= |fixed[23:0];

always_comb begin
	case (rm)
		`RNE:		round_up = (g&&(r||s))||(g&&(~r)&&(~s)&&lsb);
		`RUP:		round_up = (g||r||s)&&(~sign);
		`RDN:		round_up = (g||r||s)&&(sign);
		`RMM:		round_up = g;
		default:	round_up = `FALSE;
	endcase
end

logic [31:0]	out_abs;
assign			out_abs = fixed[57:26] + ((round_up)&&(~(&fixed[57:26])));

logic sign_in, sign_out;
assign sign_in = sign;
assign sign_out = is_signed;

always_comb begin
	case ({sign_in, sign_out})
		2'b11:		out = -out_abs;
		2'b10:		out = 32'h0;
		2'b01:		out = (out_abs>32'h7fff_ffff) ? 32'h7fff_ffff : out_abs;
		default:	out = out_abs;
	endcase
end

endmodule
