`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module multipler (
	input	logic	[31:0]	opa,
	input	logic	[31:0]	opb,
	input	logic	[4:0]	ID_EX_alu_func,
	output	logic	[65:0]	mult_result
);

logic signed [32:0] mult_opa, mult_opb; //"Sign extended" operands. The 33rd bit overwrites the sign

always_comb begin
	case (ID_EX_alu_func)
	
	`ALU_FMULS: begin
		mult_opa = {9'h0, (|opa[30:23]), opa[22:0]};
		mult_opb = {9'h0, (|opb[30:23]), opb[22:0]};
	end

	`ALU_MULH: begin
		mult_opa = {opa[31], opa};
		mult_opb = {opb[31], opb};
	end
		
	`ALU_MULHSU: begin
		mult_opa = {opa[31], opa};
		mult_opb = {`FALSE, opb};
	end
		
	default: begin
		mult_opa = {`FALSE, opa};
		mult_opb = {`FALSE, opb};
	end

	endcase
end

assign mult_result = mult_opa * mult_opb;

endmodule
