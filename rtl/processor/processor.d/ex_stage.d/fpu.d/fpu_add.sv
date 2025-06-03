`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module fpu_add(
	input	logic			clk,
	input	logic			rst,
	input	logic	[31:0]	opa_in,
	input	logic	[31:0]	opb_in,
	input	logic			fsub,
	input	logic			new_input,
	input	logic			z_fl,
	input	logic			one_inf_fl,
	input	logic			two_inf_fl,
	input	logic			nan_fl,
	output	logic	[34:0]	out,
	output	logic			busy
);

// OPERAND SORTING
logic			swap;
assign			swap = (opa_in[30:0]<opb_in[30:0]);

logic	[31:0]	opa, opb;
always_comb begin
	if (swap) begin
		opa = opb_in;
		opb = opa_in;
	end
	else begin
		opa = opa_in;
		opb = opb_in;
	end
end

logic	func; // 0 for addition, 1 for subtraction
assign	func = opa[31]^opb[31]^fsub;



// OUTPUT SIGN
logic			sign;
assign			sign = opa[31]^(swap&&fsub);

// OUTPUT EXPONENT
// Extended to 9 bits with a bias of 254, for easier overflow/underflow detection
// Anything below 128 is subnormal, anything above 381 causes an overflow
logic [8:0]		exp_a, exp_b;
assign			exp_a		= {1'b0, opa[30:23]} + {8'h0, (~(|opa[30:23]))&&(|opa[22:0])};
assign			exp_b		= {1'b0, opb[30:23]} + {8'h0, (~(|opb[30:23]))&&(|opb[22:0])};

logic [8:0]		exp_diff, exp_init, exp, exp_out;
assign			exp_diff	= exp_a - exp_b;
assign			exp_init	= exp_a + 127;
assign			exp_out		= exp - 127;

logic			ovf_fl;
assign			ovf_fl	= (exp>381);

// OUTPUT MANTISSA
logic	[49:0]	mant_opa, mant_opb, mant_opb_init, mant, mant_init;
assign			mant_opa		= {1'b0, |opa[30:23], opa[22:0], 25'h0};
assign			mant_opb_init	= {1'b0, |opb[30:23], opb[22:0], 25'h0};
assign			mant_opb		= mant_opb_init >> (exp_diff);
assign			mant_init		= func ? (mant_opa - mant_opb) : (mant_opa + mant_opb);



// SPECIAL CASES
logic			z_res_fl; // Automatic 0 detection
assign			z_res_fl = (opa[30:0]==opb[30:0])&&(func);

logic			skip_fl, sc_flag;
assign			skip_fl = (exp_diff>25); // Diff is too large to matter
assign			sc_fl = z_fl||one_inf_fl||two_inf_fl||nan_fl||skip_fl||z_res_fl;



// NORMALISE RESULT
assign	busy = (new_input)||((~mant[49])&&(~sc_fl));
always_ff @(posedge clk) begin
	if (rst) begin
		mant	<= 50'h0;
		exp		<= 9'h0;
	end
	else begin
		if (new_input) begin
			mant	<= mant_init;
			exp		<= exp_init + 1;
		end
		else if (busy) begin
			mant	<= mant << 1;
			exp		<= exp - 1;
		end
	end
end



// SUBNORMAL ADJUSTMENT
logic			subn_res_fl;
assign			subn_res_fl = (exp<128);

logic	[49:0]	subn_mant;
assign			subn_mant = mant >> (127-exp);



// OUTPUT SELECTION
always_comb begin
	if (nan_fl)					out = {opa, 3'b000};
	else if (two_inf_fl)		out = (func) ? {1'b0, 9'h1ff, 22'h1, 3'h0} : {sign, opa[30:0], 3'b000};
	else if (z_res_fl)			out = {35'h0};
	else if (one_inf_fl||z_fl)	out = {sign, opa[30:0], 3'b000};
	else if (skip_fl)			out = {sign, opa[30:0], 3'b000} - {35'h0, (func)} + {35'h0, (~func)};
	else if (ovf_fl)			out = {sign, 8'hff, 23'h0, 3'b000};
	else if (subn_res_fl)		out = {sign, 8'h00, subn_mant[49:25], |subn_mant[24:0]};
	else						out = {sign, exp_out[7:0], mant[48:24], |mant[23:0]};
end

endmodule
