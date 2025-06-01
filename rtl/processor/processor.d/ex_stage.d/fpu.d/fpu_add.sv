`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module fpu_add(
	input	logic			clk,
	input	logic			rst,
	input	logic	[31:0]	opa_in,
	input	logic	[31:0]	opb_in,
	input	logic			flip,
	input	logic			new_input,
	output	logic	[34:0]	out,
	output	logic			fpu_add_busy
);

// OPERAND FILTERING
logic	[31:0]	opa, opb;
always_comb begin
	if (opa_in[30:0]>opb_in[30:0]) begin
		opa = opa_in;
		opb = {opb_in[31]^flip, opb_in[30:0]};
	end
	else begin
		opa = opb_in;
		opb = {opa_in[31]^flip, opa_in[30:0]};
	end
end
logic	func; // 0 for addition, 1 for subtraction
assign	func = opa[31]^opb[31];



// SUBNORMAL FLAG
logic			subn_fl_a, subn_fl_b, subn_fl;
assign			subn_fl_a	= (~(|opa[30:23]))&&(|opa[22:0]);
assign			subn_fl_b	= (~(|opb[30:23]))&&(|opb[22:0]);
assign			subn_fl		= subn_fl_a||subn_fl_b;

// ZERO FLAG
logic			z_fl_a, z_fl_b, z_fl;
assign			z_fl_a		= ~(|opa[30:0]);
assign			z_fl_b		= ~(|opb[30:0]);
assign			z_fl		= z_fl_a||z_fl_b;

// INF FLAG
logic			inf_fl_a, inf_fl_b, one_inf_fl, two_inf_fl;
assign			inf_fl_a	= (&opa[30:23])&&(~(|opa[22:0]));
assign			inf_fl_b	= (&opb[30:23])&&(~(|opb[22:0]));
assign			one_inf_fl	= inf_fl_a^inf_fl_b;
assign			two_inf_fl	= inf_fl_a&&inf_fl_b;

// NAN FLAG
logic			nan_fl_a, nan_fl_b, nan_fl;
assign			nan_fl_a = (&opa[30:23])&&(|opa[22:0]);
assign			nan_fl_b = (&opb[30:23])&&(|opb[22:0]);
assign			nan_fl = nan_fl_a||nan_fl_b;


// OUTPUT CALCULATION
logic			sign;
assign			sign = (flip&&(opa==opb_in)) ? ~opa[31] : opa[31];

logic [7:0]		exp_diff, exp_init, exp;
assign			exp_diff = opa[30:23] - opb[30:23];
assign			exp_init = opa[30:23];

logic	[48:0]	mant_opa, mant_opb, mant_opb_init, mant, mant_init;
assign			mant_opa		= {2'b01, opa[22:0], 24'h0};
assign			mant_opb_init	= {2'b01, opb[22:0], 24'h0};
assign			mant_opb		= mant_opb_init >> (exp_diff);
assign			mant_init		= func ? (mant_opa - mant_opb) : (mant_opa + mant_opb);



// Flag used to detect when exp_diff is too large
logic			skip_fl;
assign			skip_fl = (exp_diff>27);

// SPECIAL CASE FLAG
logic			sc_fl;
assign			sc_fl = z_fl||one_inf_fl||two_inf_fl||nan_fl||skip_fl;


// NORMALISE RESULT
assign	fpu_add_busy = (new_input)||((~mant[48])&&(~skip_fl));
always_ff @(posedge clk) begin
	if (rst) begin
		mant	<= 49'h0;
		exp		<= 8'h0;
	end
	else begin
		if (new_input) begin
			mant	<= mant_init;
			exp		<= exp_init + 1;
		end
		else if (fpu_add_busy) begin
			mant	<= mant << 1;
			exp		<= exp - 1;
		end
	end
end



// OUTPUT SELECTION
logic [34:0] normal_out;

always_comb begin

	if (skip_fl) begin
		if (func)	normal_out = {opa[31], (opa[30:0] - 1), 3'b111};
		else		normal_out = {opa, 3'b001};
	end
	else begin
		normal_out = {sign, exp, mant[47:23], |mant[22:0]};
	end

	if (z_fl||one_inf_fl||nan_fl) begin
		out = {opa, 3'b000};
	end
	else if (two_inf_fl) begin
		out = opa[31]^opb[31] ? {1'b0, 9'h1ff, 22'h1, 3'h0} : {opa, 3'b000};
	end
	else begin
		out = normal_out;
	end

end

endmodule
