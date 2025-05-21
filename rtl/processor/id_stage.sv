`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module id_stage(
	input	logic			clk,
	input	logic			rst,

	input	logic	[31:0]	IF_ID_pc,
	input	logic	[31:0]	IF_ID_inst,
	input	logic			IF_ID_vld,
	input	logic	[4:0]	ID_EX_rd,
	input	logic	[4:0]	EX_MEM_rd,
	input	logic	[4:0]	MEM_WB_rd,

	output	logic	[4:0]	ID_rs1,
	output	logic	[4:0]	ID_rs2,
	output	logic	[31:0]	ID_pc,
	output	logic	[31:0]	ID_imm,
	output	logic	[5:0]	ID_alu_sel,
	output	logic	[4:0]	ID_alu_func,
	output	logic			ID_vld,
	output	logic	[1:0]	ID_mem_cmd,
	output	logic	[4:0]	ID_rd
);

assign ID_rs1 = IF_ID_inst[19:15];
assign ID_rs2 = IF_ID_inst[24:20];
assign ID_pc = IF_ID_pc;

logic [2:0] opa_sel, opb_sel;
assign ID_alu_sel = {opa_sel, opb_sel};

logic [31:0] imm_i, imm_s, imm_b, imm_j, imm_u;
assign imm_i = {{20{IF_ID_inst[31]}}, IF_ID_inst[31:20]};
assign imm_s = {{20{IF_ID_inst[31]}}, IF_ID_inst[31:25], IF_ID_inst[11:7]};
assign imm_b = {{20{IF_ID_inst[31]}}, IF_ID_inst[7], IF_ID_inst[30:25], IF_ID_inst[11:8], 1'b0};
assign imm_j = {{12{IF_ID_inst[31]}}, IF_ID_inst[19:12], IF_ID_inst[20], IF_ID_inst[30:21], 1'b0};
assign imm_u = {IF_ID_inst[31:12], 12'b0};

always_comb begin

	case (IF_ID_inst[6:0])
		`S_TYPE:										ID_imm = imm_s;
		`B_TYPE:										ID_imm = imm_b;
		`J_TYPE:										ID_imm = imm_j;
		`U_LD_TYPE, `U_AUIPC_TYPE:						ID_imm = imm_u;
		default:										ID_imm = imm_i;
	endcase

	case (IF_ID_inst[6:0])
		`R_TYPE, `I_ARITH_TYPE, `I_LD_TYPE,`S_TYPE:		opa_sel = `SEL_RS;
		`I_JAL_TYPE, `B_TYPE, `J_TYPE, `U_AUIPC_TYPE:	opa_sel = `SEL_PC;
		default:										opa_sel = `SEL_0;
	endcase

	// Forwarding override
	if (opa_sel===`SEL_RS) begin
		case (ID_rs1)
			`ZERO_REG:										opa_sel = `SEL_0;
			ID_EX_rd:										opa_sel = `SEL_F1;
			EX_MEM_rd:										opa_sel = `SEL_F2;
			// MEM_WB_rd:										opa_sel = `SEL_F3;
		endcase
	end

	case (IF_ID_inst[6:0])
		`R_TYPE:										opb_sel = `SEL_RS;
		`I_ARITH_TYPE, `I_LD_TYPE, `S_TYPE:				opb_sel = `SEL_IMM;
		`B_TYPE, `U_LD_TYPE, `U_AUIPC_TYPE:				opb_sel = `SEL_IMM;
		default:										opb_sel = `SEL_4;
	endcase

	// Forwarding override
	if (opb_sel===`SEL_RS) begin
		case (ID_rs2)
			`ZERO_REG:										opb_sel = `SEL_0;
			ID_EX_rd:										opb_sel = `SEL_F1;
			EX_MEM_rd:										opb_sel = `SEL_F2;
			// MEM_WB_rd:										opb_sel = `SEL_F3;
		endcase
	end

	ID_alu_func = `ALU_ADD;

	if (IF_ID_inst[6:0]==`R_TYPE) begin
		case({IF_ID_inst[14:12], IF_ID_inst[31:25]})
			`ADD_INST:									ID_alu_func = `ALU_ADD;
			`SUB_INST:									ID_alu_func = `ALU_SUB;
			`XOR_INST:									ID_alu_func = `ALU_XOR;
			`OR_INST:									ID_alu_func = `ALU_OR;
			`AND_INST:									ID_alu_func = `ALU_AND;
			`SLL_INST:									ID_alu_func = `ALU_SLL;
			`SRL_INST:									ID_alu_func = `ALU_SRL;
			`SRA_INST:									ID_alu_func = `ALU_SRA;
			`SLT_INST:									ID_alu_func = `ALU_SLT;
			`SLTU_INST:									ID_alu_func = `ALU_SLTU;
			default:									ID_vld = `FALSE;
		endcase
	end

	if (IF_ID_inst[6:0]==`I_ARITH_TYPE) begin
		case(IF_ID_inst[14:12])
			`ADDI_INST:									ID_alu_func = `ALU_ADD;
			`XORI_INST:									ID_alu_func = `ALU_XOR;
			`ORI_INST:									ID_alu_func = `ALU_OR;
			`ANDI_INST:									ID_alu_func = `ALU_AND;
			`SLLI_INST:									ID_alu_func = `ALU_SLL;
			`SRLI_INST, `SRAI_INST:						ID_alu_func = IF_ID_inst[30] ? `ALU_SRA : `ALU_SRL;
			`SLTI_INST:									ID_alu_func = `ALU_SLT;
			`SLTIU_INST:								ID_alu_func = `ALU_SLTU;
			default:									ID_vld = `FALSE;
		endcase
	end

	case (IF_ID_inst[6:0])
		`R_TYPE, `I_ARITH_TYPE, `I_LD_TYPE:				ID_vld = IF_ID_vld;
		`I_JAL_TYPE, `S_TYPE, `B_TYPE, `J_TYPE:			ID_vld = IF_ID_vld;
		`U_LD_TYPE, `U_AUIPC_TYPE, `I_BREAK_TYPE:		ID_vld = IF_ID_vld;
		default:										ID_vld = `FALSE;
	endcase

	case (IF_ID_inst[6:0])
		`I_LD_TYPE:										ID_mem_cmd = `BUS_LOAD;
		`S_TYPE:										ID_mem_cmd = `BUS_STORE;
		default:										ID_mem_cmd = `BUS_NONE;
	endcase

	case (IF_ID_inst[6:0])
		`S_TYPE, `B_TYPE, `I_BREAK_TYPE:				ID_rd = `ZERO_REG;
		default:										ID_rd = IF_ID_inst[11:7];
	endcase

end

endmodule
