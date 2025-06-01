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

// ZERO FLAG
logic			z_fl_a, z_fl_b, z_fl;
assign			z_fl_a		= ~(|opa[30:0]);
assign			z_fl_b		= ~(|opb[30:0]);
assign			z_fl		= z_fl_a||z_fl_b;


// INF FLAG
logic			inf_fl_a, inf_fl_b, inf_fl;
assign			inf_fl_a	= (&opa[30:23])&&(~(|opa[22:0]));
assign			inf_fl_b	= (&opb[30:23])&&(~(|opb[22:0]));
assign			inf_fl		= inf_fl_a||inf_fl_b;


// NAN FLAG
logic			nan_fl_a, nan_fl_b, nan_fl;
assign			nan_fl_a = (&opa[30:23])&&(|opa[22:0]);
assign			nan_fl_b = (&opb[30:23])&&(|opb[22:0]);
assign			nan_fl = nan_fl_a||nan_fl_b;


// SPECIAL CASE FLAG
logic			sc_fl;
assign			sc_fl = z_fl||inf_fl||nan_fl;


// OUTPUT SIGN
logic			sign;
assign			sign = opa[31]^opb[31];


// OUTPUT MANTISSA
// Normalise multiplication result
logic [47:0]	mult_result_norm;
assign			fpu_mult_busy = (~mult_result_norm[47])&&(~sc_fl);

always_ff @(posedge clk) begin
	if (rst) begin
		mult_result_norm <= 48'h0;
	end
	else begin
		if (new_input) begin
			mult_result_norm <= mult_result;
		end
		else if (fpu_mult_busy) begin
			mult_result_norm <= mult_result_norm << 1;
		end
	end
end

// Throw away the implied leading 1
logic [25:0]	mant;
assign			mant = {mult_result_norm[46:22], |mult_result_norm[21:0]};


// OUTPUT EXPONENT
logic [7:0]		exp_a, exp_b;
assign			exp_a = opa[30:23];
assign			exp_b = opb[30:23];

// 9 bit sum, 9th bit used to detect overflows/underflows
// Add exponents, adjust bias, add 1 if the multiplication result was >=2
logic [8:0]		exp;
assign			exp = exp_a + exp_b - 127 + mult_result[47];

logic			ovf_fl, unf_fl;
assign			ovf_fl = exp[8];
assign			unf_fl = `FALSE; // Work in progress


// OUTPUT CALCULATION
logic [34:0] normal_out, ovf_out, unf_out;

assign			normal_out	= {sign, exp[7:0], mant};
assign			ovf_out		= {sign, 8'hff, 26'h0};
assign			unf_out		= {sign, 8'h00, 26'h0};

always_comb begin	
	case ({nan_fl, inf_fl, z_fl})
		3'b000:		out = ovf_fl ? ovf_out : (unf_fl ? unf_out : normal_out);	// Normal output
		3'b001:		out = {sign, 34'h0};										// Zero * anything = Zero
		3'b010:		out = {sign, 8'hff, 26'h0};									// Inf * anything = Inf
		3'b011:		out = {1'b0, 9'h1ff, 22'h1, 3'h0};							// Zero * inf = qNaN
		default:	out = nan_fl_a ? {opa, 3'h0} : {opb, 3'h0};					// If NaN input, send it to output
	endcase
end

endmodule
