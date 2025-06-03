`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module fpu_int2flt(
	input	logic			clk,
	input	logic			rst,
	input	logic	[31:0]	in,
	input	logic			signed_input,
	input	logic			new_input,
	output	logic	[34:0]	out,
	output	logic			busy
);

logic			z_fl;
assign			z_fl = ~(|in);

logic			sign;
assign			sign = signed_input&&in[31];

logic [31:0]	in_abs;
assign			in_abs = sign ? -in : in;

logic [4:0]		msb;

assign			busy = (~in_abs[msb])&&(~z_fl);

always_ff @(posedge clk) begin
	if (rst) begin
		msb <= 31;
	end
	else begin
		if (new_input) begin
			msb <= 31;
		end
		else if (busy) begin
			msb <= msb - 1;
		end
	end
end

logic [30:0]	mantissa;
assign			mantissa = in_abs << (31-msb);

logic [7:0]		exponent;
assign			exponent = msb + 127;

assign out = z_fl ? 35'h0 : {sign, exponent, mantissa[30:6], |mantissa[5:0]};

endmodule
