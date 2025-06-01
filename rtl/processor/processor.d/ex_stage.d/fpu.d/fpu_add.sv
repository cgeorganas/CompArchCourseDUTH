`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module fpu_add(
	input	logic			clk,
	input	logic			rst,
	input	logic	[31:0]	opa,
	input	logic	[31:0]	opb,
	input	logic			is_addition,
	input	logic			new_input,
	output	logic	[34:0]	out,
	output	logic			fpu_add_busy
);

// 1 for addition, 0 for subtraction
logic	func;
assign	func = opa[31]^opb[31]^is_addition;

logic [31:0] big, sm;
always_comb begin
	if (opa[30:0]>opb[30:0]) begin
		big = opa;
		sm = opb;
	end
	else begin
		big = opb;
		sm = opa;
	end
end



logic [7:0]		exp_diff, exp_initial, exp;
assign			exp_diff = big[30:23] - sm[30:23];
assign			exp_initial = big[30:23];

logic	[48:0]	mant_big, mant_sm, mant_sm_initial, mant, mant_initial;
assign			mant_big		= {2'b01, big[22:0], 24'h0};
assign			mant_sm_initial	= {2'b01, sm[22:0], 24'h0};
assign			mant_sm			= mant_sm_initial >> (exp_diff);
assign			mant_initial			= func ? (mant_big + mant_sm) : (mant_big - mant_sm);



assign			fpu_add_busy = (new_input)||(~mant[48]);
always_ff @(posedge clk) begin
	if (rst) begin
		mant	<= 49'h0;
		exp		<= 8'h0;
	end
	else begin
		if (new_input) begin
			mant	<= mant_initial;
			exp		<= exp_initial + 1;
		end
		else if (fpu_add_busy) begin
			mant	<= mant << 1;
			exp		<= exp - 1;
		end
	end
end

assign out = {big[31], exp, mant[47:23], |mant[22:0]};

endmodule
