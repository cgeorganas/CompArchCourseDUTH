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

logic input_changed, done;
logic [31:0] num, denom;

assign input_changed = (num!=opa)||(denom!=opb);

always_comb begin
	case (ID_EX_alu_func)
		`ALU_DIV, `ALU_REM:							done = (remainder<denom)&&(~input_changed);
		default:									done = `TRUE;
	endcase
end
assign EX_alu_busy = ~done;

always_ff @(posedge clk) begin
	if (rst) begin
		num		<= 32'h0;
		denom	<= 32'h0;
		quotient	<= 32'h0;
		remainder		<= 32'h0;
	end
	else begin
		if (input_changed) begin
			num		<= opa;
			denom	<= opb;
			quotient	<= 32'h0;
			remainder		<= opa;
		end
		else if (opb==32'h0) begin
			quotient	<= opa;
			remainder		<= 32'hffff_ffff;
		end
		else if (~done) begin
			quotient	<= quotient + 1;
			remainder		<= remainder - denom;
		end
	end
end

endmodule
