`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module ex_stage(
	input	logic			clk,
	input	logic			rst,

	input	logic	[31:0]	RF_rs1_data,
	input	logic	[31:0]	RF_rs2_data,
	input	logic	[31:0]	ID_EX_pc,
	input	logic	[31:0]	ID_EX_imm,
	input	logic	[8:0]	ID_EX_mux_sel,
	input	logic	[4:0]	ID_EX_alu_func,
	input	logic			ID_EX_vld,
	input 	logic	[31:0]	MEM_data,
	input 	logic	[31:0]	WB_data,

	output	logic	[31:0]	EX_mem_din,
	output	logic	[31:0]	EX_alu_res,
	output	logic			EX_vld
);


//Operand selection
logic [31:0] opa, opb;

always_comb begin
	case(ID_EX_mux_sel[8:6])
		`SEL_RS:	opa = RF_rs1_data;
		`SEL_PC:	opa = ID_EX_pc;
		`SEL_F1:	opa = MEM_data;
		`SEL_F2:	opa = WB_data;
		default:	opa = 32'h0000_0000;
	endcase
	case(ID_EX_mux_sel[5:3])
		`SEL_RS:	opb = RF_rs2_data;
		`SEL_IMM:	opb = ID_EX_imm;
		`SEL_F1:	opb = MEM_data;
		`SEL_F2:	opb = WB_data;
		default:	opb = 32'h0000_0004;
	endcase
	case(ID_EX_mux_sel[2:0])
		`SEL_RS:	EX_mem_din = RF_rs2_data;
		`SEL_F1:	EX_mem_din = MEM_data;
		`SEL_F2:	EX_mem_din = WB_data;
		default:	EX_mem_din = 32'h0000_0000;
	endcase
end

//Multiplier
logic sign_opa, sign_opb;
assign sign_opb = (ID_EX_alu_func==`ALU_MULH);
assign sign_opa = (ID_EX_alu_func==`ALU_MULHSU)||(sign_opb);

logic signed [32:0] mult_opa, mult_opb; //"Sign extended" operands. The 33rd bit overwrites the sign
assign mult_opa = {sign_opa&&opa[31],opa};
assign mult_opb = {sign_opb&&opb[31],opb};

logic signed [65:0] mult_result;
assign mult_result = mult_opa * mult_opb;

//ALU block
always_comb begin
	EX_alu_res = 32'hbaadbeef;
	EX_vld = ID_EX_vld;
	case (ID_EX_alu_func)
		`ALU_ADD:		EX_alu_res = opa + opb;
		`ALU_SUB:		EX_alu_res = opa - opb;
		`ALU_XOR:		EX_alu_res = opa ^ opb;
		`ALU_OR:		EX_alu_res = opa | opb;
		`ALU_AND:		EX_alu_res = opa & opb;
		`ALU_SLL:		EX_alu_res = opa << opb[4:0];
		`ALU_SRL:		EX_alu_res = opa >> opb[4:0];
		`ALU_SRA:		EX_alu_res = $signed(opa) >>> opb[4:0]; 
		`ALU_SLT:		EX_alu_res = {31'd0, ($signed(opa)< $signed(opb))};
		`ALU_SLTU:		EX_alu_res = {31'd0, (opa < opb)};
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
