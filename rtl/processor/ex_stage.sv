`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module ex_stage(
	input	logic			clk,
	input	logic			rst,

	input logic		[31:0]	ID_EX_alu_opa,
	input logic		[31:0]	ID_EX_alu_opb,
	input logic		[4:0]	ID_EX_alu_func,
	input logic				ID_EX_vld,

	output	logic	[31:0]	EX_alu_res,
	output	logic			EX_vld
);

//Multiplier
logic sign_opa, sign_opb;
assign sign_opa = (ID_EX_alu_func==`ALU_MULH)||(ID_EX_alu_func==`ALU_MULHSU);
assign sign_opb = (ID_EX_alu_func==`ALU_MULH);

logic signed [32:0] mult_opa, mult_opb; //"Sign extended" operands. The 33rd bit overwrites the sign
assign mult_opa = {sign_opa&&ID_EX_alu_opa[31],ID_EX_alu_opa};
assign mult_opb = {sign_opb&&ID_EX_alu_opb[31],ID_EX_alu_opb};

logic signed [65:0] mult_result;
assign mult_result = mult_opa * mult_opb;

//ALU block
always_comb begin
	EX_alu_res = 32'hbaadbeef;
	EX_vld = ID_EX_vld;
	case (ID_EX_alu_func)
		`ALU_ADD:		EX_alu_res = ID_EX_alu_opa + ID_EX_alu_opb;
		`ALU_SUB:		EX_alu_res = ID_EX_alu_opa - ID_EX_alu_opb;
		`ALU_XOR:		EX_alu_res = ID_EX_alu_opa ^ ID_EX_alu_opb;
		`ALU_OR:		EX_alu_res = ID_EX_alu_opa | ID_EX_alu_opb;
		`ALU_AND:		EX_alu_res = ID_EX_alu_opa & ID_EX_alu_opb;
		`ALU_SLL:		EX_alu_res = ID_EX_alu_opa << ID_EX_alu_opb[4:0];
		`ALU_SRL:		EX_alu_res = ID_EX_alu_opa >> ID_EX_alu_opb[4:0];
		`ALU_SRA:		EX_alu_res = $signed(ID_EX_alu_opa) >>> ID_EX_alu_opb[4:0]; 
		`ALU_SLT:		EX_alu_res = {31'd0, ($signed(ID_EX_alu_opa)< $signed(ID_EX_alu_opb))};
		`ALU_SLTU:		EX_alu_res = {31'd0, (ID_EX_alu_opa < ID_EX_alu_opb)};
		`ALU_MUL:		EX_alu_res = mult_result[31:0];
		`ALU_MULH:		EX_alu_res = mult_result[63:32];
		`ALU_MULHSU:	EX_alu_res = mult_result[63:32];
		`ALU_MULHU:		EX_alu_res = mult_result[63:32];
		// `ALU_DIV:		EX_alu_res = 32'hbaadbeef;
		// `ALU_DIVU:		EX_alu_res = 32'hbaadbeef;
		// `ALU_REM:		EX_alu_res = 32'hbaadbeef;
		// `ALU_REMU:		EX_alu_res = 32'hbaadbeef;
		default:		EX_vld = `FALSE;
	endcase
end

endmodule
