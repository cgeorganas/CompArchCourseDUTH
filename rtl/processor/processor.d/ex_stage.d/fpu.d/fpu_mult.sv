`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module fpu_mult(
	input	logic			clk,
	input	logic			rst,
	input	logic	[31:0]	opa,
	input	logic	[31:0]	opb,
	input	logic	[47:0]	mult_result,
	input	logic			new_input,
	output	logic	[34:0]	out,
	output	logic			fpu_mult_busy
);

logic subn_flag_a, subn_flag_b, subn_flag;
assign	subn_flag_a = (~(|opa[31:23]))&&(|opa[22:0]);
assign	subn_flag_b = (~(|opb[31:23]))&&(|opb[22:0]);
assign	subn_flag = subn_flag_a||subn_flag_b;

logic	zero_flag_a, zero_flag_b, zero_flag;
assign	zero_flag_a = ~(|opa[30:0]);
assign	zero_flag_b = ~(|opb[30:0]);
assign	zero_flag = zero_flag_a||zero_flag_b;

logic	inf_flag_a, inf_flag_b, inf_flag;
assign	inf_flag_a = (&opa[30:23])&&(~(|opa[22:0]));
assign	inf_flag_b = (&opb[30:23])&&(~(|opb[22:0]));
assign	inf_flag = inf_flag_a||inf_flag_b;

logic	nan_flag_a, nan_flag_b, nan_flag;
assign	nan_flag_a = (&opa[30:23])&&(|opa[22:0]);
assign	nan_flag_b = (&opb[30:23])&&(|opb[22:0]);
assign	nan_flag = nan_flag_a||nan_flag_b;

logic			sign;
assign			sign = opa[31]^opb[31];

logic [7:0]		exponent_a, exponent_b;
assign			exponent_a = opa[30:23] + subn_flag_a;
assign			exponent_b = opb[30:23] + subn_flag_b;

logic [8:0]		exponent;
assign			exponent = exponent_a + exponent_b - 127 + mult_result[47];

logic			underf_flag, overf_flag;
assign			underf_flag = (exponent_a<127)&&(exponent_b<127)&&(exponent[8]);
assign			overf_flag = (exponent_a>127)&&(exponent_b>127)&&(exponent[8]);

logic	sc_flag;
assign	sc_flag = zero_flag||inf_flag||nan_flag||underf_flag||overf_flag;

logic [47:0]	mult_result_norm;

always_ff @(posedge clk) begin
	if (rst) begin
		mult_result_norm <= 48'h0;
	end
	else begin
		if (new_input)			mult_result_norm <= mult_result;
		else if (fpu_mult_busy)	mult_result_norm <= mult_result_norm << 1;
	end
end

assign			fpu_mult_busy = (~mult_result_norm[47])&&(~sc_flag);

logic [25:0]	mantissa;
assign			mantissa = {mult_result_norm[46:22], |mult_result_norm[21:0]};

always_comb begin
	case ({nan_flag, inf_flag, zero_flag})
		3'b000:		out = overf_flag ? {sign, 8'hff, 26'h0}: (underf_flag ? {sign, 8'h0, 26'h0} : {sign, exponent[7:0], mantissa});
		3'b001:		out = {sign, 34'h0};
		3'b010:		out = {sign, 8'hff, 26'h0};
		3'b011:		out = {1'b0, 9'h1ff, 22'h1, 3'h0};
		default:	out = nan_flag_a ? {opa, 3'h0} : {opb, 3'h0};
	endcase
end

endmodule
