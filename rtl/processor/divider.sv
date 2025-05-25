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
	output	logic			EX_alu_busy
);


logic signed_div, unsigned_div;
assign signed_div = (ID_EX_alu_func==`ALU_DIV)||(ID_EX_alu_func==`ALU_REM);
assign unsigned_div = (ID_EX_alu_func==`ALU_DIVU)||(ID_EX_alu_func==`ALU_REMU);

logic [31:0] numerator, denominator;
logic [31:0] ec_quotient, ec_remainder; // Edge cases
logic edge_case;

always_comb begin
	if (opb==32'h0) begin
		ec_quotient		= 32'hffff_ffff;
		ec_remainder	= opa;
		edge_case		= `TRUE;
		numerator		= 32'h0;
		denominator		= 32'h1;
	end
	else if ((signed_div)&&(opa==32'h8000_0000)) begin
		ec_quotient		= opa;
		ec_remainder	= 32'h0;
		edge_case		= `TRUE;
		numerator		= 32'h0;
		denominator		= 32'h1;
	end
	else begin
		ec_quotient		= 32'h0;
		ec_remainder	= 32'h0;
		edge_case		= `FALSE;
		numerator		= (signed_div&&opa[31]) ? -opa : opa;
		denominator		= (signed_div&&opb[31]) ? -opb : opb;
	end
end

logic [31:0] prev_numerator, prev_denominator;
logic [31:0] nor_quotient, nor_remainder;

logic input_changed;
assign input_changed = (numerator!=prev_numerator)||(prev_denominator!=denominator);

logic done;
assign done = (nor_remainder<prev_denominator)&&(~input_changed);

always_ff @(posedge clk) begin
	if (rst) begin
		prev_numerator		<= 32'h0;
		prev_denominator	<= 32'h0;
		nor_quotient		<= 32'h0;
		nor_remainder		<= 32'h1;
	end
	else begin
		if (input_changed) begin
			prev_numerator		<= numerator;
			prev_denominator	<= denominator;
			nor_quotient		<= 32'h0;
			nor_remainder		<= numerator;
		end
		else if (~done) begin
			nor_quotient		<= nor_quotient + 1;
			nor_remainder		<= nor_remainder - prev_denominator;
		end
	end
end

logic sign_q, sign_r;
assign sign_q = signed_div ? opa[31]^opb[31] : `FALSE;
assign sign_r = signed_div ? opa[31] : `FALSE;

assign quotient = edge_case ? ec_quotient : (sign_q ? -nor_quotient : nor_quotient);
assign remainder = edge_case ? ec_remainder : (sign_r ? -nor_remainder : nor_remainder);

assign EX_alu_busy = edge_case ? `FALSE : ~done;

endmodule
