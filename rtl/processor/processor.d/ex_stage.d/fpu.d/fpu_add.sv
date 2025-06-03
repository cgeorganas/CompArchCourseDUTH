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

// OPERAND FILTERING
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



// OUTPUT CALCULATION
logic			sign;
assign			sign = opa[31]^(swap&&fsub);

// OUTPUT EXPONENT
// 9 bit sum, the bias becomes 254
// Anything below 128 is subnormal, anything above 381 causes an overflow
logic [8:0]		exp_a, exp_b, exp_diff, exp_init, exp, exp_out;
assign			exp_a		= {1'b0, opa[30:23]} + {8'h0, (~(|opa[30:23]))&&(|opa[22:0])};
assign			exp_b		= {1'b0, opb[30:23]} + {8'h0, (~(|opb[30:23]))&&(|opb[22:0])};
assign			exp_diff	= exp_a - exp_b;
assign			exp_init	= exp_a + 127;
assign			exp_out		= exp - 127;

logic	[48:0]	mant_opa, mant_opb, mant_opb_init, mant, mant_init;
assign			mant_opa		= {1'b0, |opa[30:23], opa[22:0], 24'h0};
assign			mant_opb_init	= {1'b0, |opb[30:23], opb[22:0], 24'h0};
assign			mant_opb		= mant_opb_init >> (exp_diff);
assign			mant_init		= func ? (mant_opa - mant_opb) : (mant_opa + mant_opb);



// OVERFLOW/UNDERFLOW DETECTION
logic			ovf_fl, unf_fl;
assign			ovf_fl	= (exp>381);
assign			unf_fl	= (exp<104);



// Flag used to detect 0 result
logic			z_res_fl;
assign			z_res_fl = (opa[30:0]==opb[30:0])&&(func);
logic			z_sign;
always_comb begin
	if (fsub) begin
		z_sign = (opa_in==32'h8000_0000)&&(opb_in==32'h0);
	end
	else begin
		z_sign = (opa_in==32'h8000_0000)&&(opb_in==32'h8000_0000);
	end
end

// Flag used to detect when exp_diff is too large
logic			skip_fl;
assign			skip_fl = (exp_diff>27);

// SPECIAL CASE FLAG
logic			sc_fl;
assign			sc_fl = z_fl||one_inf_fl||two_inf_fl||nan_fl||skip_fl||z_res_fl;



// SUBNORMAL ADJUSTMENT
logic			subn_res_fl;
assign			subn_res_fl = (exp<128);

logic	[48:0]	subn_mant;
assign			subn_mant = mant >> (127-exp);



// NORMALISE RESULT
assign	busy = (new_input)||((~mant[48])&&(~sc_fl));
always_ff @(posedge clk) begin
	if (rst) begin
		mant	<= 49'h0;
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



// OUTPUT SELECTION
logic [34:0] normal_out;
logic [33:0] opa_adj;

always_comb begin

	if (skip_fl) begin
		if (func)	opa_adj = {opa[30:0], 3'b000} - 1;
		else		opa_adj = {opa[30:0], 3'b001};
		normal_out = {sign, opa_adj};
	end
	else if (ovf_fl) begin
		normal_out = {sign, 8'hff, 23'h0, 3'b000};
	end
	else if (z_res_fl) begin
		normal_out = {z_sign, 34'h0};
	end
	else if (subn_res_fl) begin
		normal_out = {sign, 8'h00, subn_mant[48:24], |subn_mant[23:0]};
	end
	else begin
		normal_out = {sign, exp_out[7:0], mant[47:23], |mant[22:0]};
	end

	if (((z_fl)&&(~(z_res_fl)))||one_inf_fl) begin
		out = {sign, opa[30:0], 3'b000};
	end
	else if (nan_fl) begin
		out = {opa, 3'b000};
	end
	else if (two_inf_fl) begin
		out = (func) ? {1'b0, 9'h1ff, 22'h1, 3'h0} : {sign, opa[30:0], 3'b000};
	end
	else begin
		out = normal_out;
	end

end

endmodule
