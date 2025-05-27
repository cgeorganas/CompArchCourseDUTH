`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module divider(
	input	logic			clk,
	input	logic			rst,
	input	logic	[31:0]	opa,
	input	logic	[31:0]	opb,
	input	logic	[4:0]	ID_EX_alu_func,

	output	logic	[31:0]	quotient,
	output	logic	[31:0]	remainder,
	output	logic			divider_busy
);

// Flag to indicate signed operands
logic signed_op;
assign signed_op = (ID_EX_alu_func==`ALU_DIV)||(ID_EX_alu_func==`ALU_REM);

// Flag to indicate whether the module is actually being used
logic active;
assign active = (signed_op)||(ID_EX_alu_func==`ALU_DIVU)||(ID_EX_alu_func==`ALU_REMU);

// Numerator and Denominator
logic [31:0] N, D;

// Use absolute value of input operands, calculate sign later
assign N = (signed_op&&opa[31]) ? -opa : opa;
assign D = (signed_op&&opb[31]) ? -opb : opb;

// Previous versions of N and D, used to detec_flagt when the inputs change
logic [31:0] N_prev, D_prev;

// Flag used to restart the algorithm
logic new_input;
assign new_input = (N!=N_prev)||(D!=D_prev);

// Quotient and Remainder calculated using the algorithm
logic [31:0] Q_nor, R_nor;

// Flag to indicate edge case detection, like overflow and division by 0
logic ec_flag;

// Q and R for the edge cases
logic [31:0] Q_ec, R_ec;

// Edge case flags
logic div_by_zero, overflow, larger_denom;
assign div_by_zero	= (opb==32'h0);
assign overflow		= (signed_op)&&(opa==32'h8000_0000)&&(opb==32'hffff_ffff);
assign larger_denom = (N<D);

// Edge case detection
always_comb begin
	if (div_by_zero) begin
		Q_ec	= 32'hffff_ffff;
		R_ec	= opa;
		ec_flag	= `TRUE;
	end
	else if (overflow) begin
		Q_ec	= opa;
		R_ec	= 32'h0;
		ec_flag	= `TRUE;
	end
	else if (larger_denom) begin
		Q_ec	= 32'h0;
		R_ec	= opa;
		ec_flag	= `TRUE;
	end
	else begin
		Q_ec	= 32'h0;
		R_ec	= 32'h0;
		ec_flag	= `FALSE;
	end
end

// Positions of the most signifact bits of N and D
logic [4:0] N_msb, D_msb;
always_comb begin
	N_msb = 5'h0;
	D_msb = 5'h0;
	for (int i=0; i<32; i++) begin
		if (N[i]) N_msb = i;
		if (D[i]) D_msb = i;
	end
end

// Bit of Q that's currently being calculated
logic [4:0] Q_curr_bit;

// Value to be subtracted from the remainder
logic [31:0] subtrahend;

// Flag indicating that the division is complete
logic done;
assign done = (R_nor<D_prev)&&(~new_input);

always_ff @(posedge clk) begin
	if (rst) begin
		N_prev		<= 32'h0;
		D_prev		<= 32'h0;
		Q_nor		<= 32'h0;
		R_nor		<= 32'h1;
		subtrahend	<= 32'h0;
		Q_curr_bit	<= 5'h0;
	end
	else begin
		if (new_input) begin
			N_prev		<= N;
			D_prev		<= D;
			Q_nor		<= 32'h0;
			R_nor		<= N;
			subtrahend	<= D << (N_msb-D_msb);
			Q_curr_bit	<= (N_msb-D_msb);
		end
		else if (~done) begin
			if (R_nor>=subtrahend) begin
				Q_nor[Q_curr_bit] <= 1'b1;
				R_nor	<= R_nor - subtrahend;
			end
			subtrahend	<= subtrahend >> 1;
			Q_curr_bit	<= Q_curr_bit - 1;
		end
	end
end

// Calculate the signs based on raw input operands
logic Q_sign, R_sign;
assign Q_sign = (signed_op)&&(opa[31]^opb[31]);
assign R_sign = (signed_op)&&(opa[31]);

// Pick edge case output or normal output
assign quotient = ec_flag ? Q_ec : (Q_sign ? -Q_nor : Q_nor);
assign remainder = ec_flag ? R_ec : (R_sign ? -R_nor : R_nor);

// Output flag, used to freeze the pipeline registers
assign divider_busy = (~ec_flag)&&(~done)&&(active);

endmodule
