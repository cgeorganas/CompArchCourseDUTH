`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module alu(
	input logic [31:0]	opa,
	input logic [31:0]	opb,
	input logic [4:0]	operation,

	input logic [31:0]	br_cond_opa,
	input logic [31:0]	br_cond_opb,
	input logic [2:0]	funct3,

	output logic [31:0] result,
	output logic		br_cond_result
);

//Multiplier
logic sign_opa, sign_opb;
assign sign_opa = (operation==`ALU_MULH)||(operation==`ALU_MULHSU);
assign sign_opb = (operation==`ALU_MULH);

logic signed [32:0] mult_opa, mult_opb; //"Sign extended" operands
assign mult_opa = {sign_opa&&opa[31],opa}; //The 33rd bit overwrites the sign
assign mult_opb = {sign_opb&&opb[31],opb};

logic signed [65:0] mult_result;
assign mult_result = mult_opa * mult_opb;

//ALU block
always_comb begin
	case (operation)
		`ALU_ADD:		result = opa + opb;
		`ALU_SUB:		result = opa - opb;
		`ALU_XOR:		result = opa ^ opb;
		`ALU_OR:		result = opa | opb;
		`ALU_AND:		result = opa & opb;
		`ALU_SLL:		result = opa << opb[4:0];
		`ALU_SRL:		result = opa >> opb[4:0];
		`ALU_SRA:		result = $signed(opa) >>> opb[4:0]; 
		`ALU_SLT:		result = {31'd0, ($signed(opa)< $signed(opb))};
		`ALU_SLTU:		result = {31'd0, (opa < opb)};
		`ALU_MUL:		result = mult_result[31:0];
		`ALU_MULH:		result = mult_result[63:32];
		`ALU_MULHSU:	result = mult_result[63:32];
		`ALU_MULHU:		result = mult_result[63:32];
		// `ALU_DIV:		result = 32'hbaadbeef;
		// `ALU_DIVU:		result = 32'hbaadbeef;
		// `ALU_REM:		result = 32'hbaadbeef;
		// `ALU_REMU:		result = 32'hbaadbeef;
		default:		result = 32'hbaadbeef;
	endcase
end

//Branch Condition block
always_comb begin
	case (funct3)
		2'b00:		br_cond_result = (br_cond_opa==br_cond_opb); //BEQ
		2'b00:		br_cond_result = ($signed(br_cond_opa)<$signed(br_cond_opb)); //BLT
		2'b10:		br_cond_result = (br_cond_opa<br_cond_opb); //BLTU
		default:	br_cond_result = `FALSE;
	endcase
	if (funct3[0])	br_cond_result = ~br_cond_result; //Negate if BNE, BGE or BGEU
end

endmodule
