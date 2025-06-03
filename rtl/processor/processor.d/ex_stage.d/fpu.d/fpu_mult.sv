`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module fpu_mult(
	input	logic			clk,
	input	logic			rst,
	input	logic	[31:0]	opa,
	input	logic	[31:0]	opb,
	input	logic	[47:0]	mult_res,
	input	logic			new_input,
	input	logic			z_fl,
	input	logic			subn_fl_a,
	input	logic			subn_fl_b,
	input	logic			inf_fl,
	input	logic			nan_fl,
	output	logic	[34:0]	out,
	output	logic			busy
);

// SPECIAL CASE FLAG
logic			sc_fl;
assign			sc_fl = z_fl||inf_fl||nan_fl;



// OUTPUT SIGN
logic			sign;
assign			sign = opa[31]^opb[31];



// OUTPUT EXPONENT
// 9 bit sum, the bias becomes 254
// Anything below 128 is subnormal, anything above 381 causes an overflow
logic [8:0]		exp_initial, exp, exp_out;
assign			exp_initial = {1'b0, opa[30:23]} + {1'b0, opb[30:23]} + {8'h0, subn_fl_a} + {8'h0, subn_fl_b};
assign			exp_out = exp - 127;


// OUTPUT MANTISSA
logic [47:0]	mant;

// Busy until MSB is 1
assign			busy = (new_input)||((~mant[47])&&(~sc_fl));

always_ff @(posedge clk) begin
	if (rst) begin
		mant	<= 48'h0;
		exp		<= 9'h0;
	end
	else begin
		if (new_input) begin
			mant	<= mult_res;
			exp		<= exp_initial + 1;
		end
		else if (busy) begin
			mant	<= mant << 1;
			exp		<= exp - 1;
		end
	end
end



// OVERFLOW/UNDERFLOW DETECTION
logic			ovf_fl, unf_fl;
assign			ovf_fl	= (exp>381);
assign			unf_fl	= (exp<104);



// SUBNORMAL ADJUSTMENT
logic			subn_res_fl;
assign			subn_res_fl = (exp<128);

logic	[47:0]	subn_mant;
assign			subn_mant = mant >> (127-exp);



// OUTPUT SELECTION
logic [34:0] normal_out;

always_comb begin

	if (ovf_fl)
		normal_out = {sign, 8'hff, 23'h0, 3'b000};
	else if (unf_fl)
		normal_out = {sign, 8'h00, 23'h0, 3'b001};
	else if (subn_res_fl)
		normal_out = {sign, 8'h00, subn_mant[47:23], |subn_mant[22:0]};
	else
		normal_out = {sign, exp_out[7:0], mant[46:22], |mant[21:0]};


	case ({nan_fl, inf_fl, z_fl})
		3'b000:		out = normal_out;											// Normal output
		3'b001:		out = {sign, 34'h0};										// Zero * anything = Zero
		3'b010:		out = {sign, 8'hff, 26'h0};									// Inf * anything = Inf
		3'b011:		out = {1'b0, 9'h1ff, 22'h1, 3'h0};							// Zero * inf = qNaN
		default:	out = (opa[30:0]>opb[30:0]) ? {opa, 3'h0} : {opb, 3'h0};	// If NaN input, send it to output
	endcase

end

endmodule
