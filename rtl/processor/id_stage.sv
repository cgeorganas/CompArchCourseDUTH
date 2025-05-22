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

	output	logic	[4:0]	ID_rs1,
	output	logic	[4:0]	ID_rs2,
	output	logic	[31:0]	ID_pc,
	output	logic	[31:0]	ID_imm,
	output	logic	[5:0]	ID_alu_sel,
	output	logic	[4:0]	ID_alu_func,
	output	logic			ID_vld,
	output	logic	[3:0]	ID_mem_cmd,
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

logic [6:0] opcode;
assign opcode = IF_ID_inst[6:0];
logic [6:0] funct7;
assign funct7 = IF_ID_inst[31:25];
logic [2:0] funct3;
assign funct3 = IF_ID_inst[14:12];

always_comb begin

	case (opcode)
		`S_TYPE:										ID_imm = imm_s;
		`B_TYPE:										ID_imm = imm_b;
		`J_TYPE:										ID_imm = imm_j;
		`U_LD_TYPE, `U_AUIPC_TYPE:						ID_imm = imm_u;
		default:										ID_imm = imm_i;
	endcase

	case (opcode)
		`R_TYPE,`S_TYPE, `B_TYPE, `I_ARITH_TYPE, `I_LD_TYPE: begin
			case (ID_rs1)
				`ZERO_REG:								opa_sel = `SEL_0;
				ID_EX_rd:								opa_sel = `SEL_F1;
				EX_MEM_rd:								opa_sel = `SEL_F2;
				default:								opa_sel = `SEL_RS;
			endcase
		end
		`I_JAL_TYPE, `J_TYPE, `U_AUIPC_TYPE:			opa_sel = `SEL_PC;
		default:										opa_sel = `SEL_0;
	endcase

	case (opcode)
		`R_TYPE, `S_TYPE, `B_TYPE: begin
			case (ID_rs2)
				`ZERO_REG:								opb_sel = `SEL_0;
				ID_EX_rd:								opb_sel = `SEL_F1;
				EX_MEM_rd:								opb_sel = `SEL_F2;
				default:								opb_sel = `SEL_RS;
			endcase
		end
		`I_ARITH_TYPE, `I_LD_TYPE:						opb_sel = `SEL_IMM;
		`U_LD_TYPE, `U_AUIPC_TYPE:						opb_sel = `SEL_IMM;
		default:										opb_sel = `SEL_4;
	endcase

	ID_alu_func = `ALU_ADD;

	if (opcode==`R_TYPE) begin
		case({funct3, funct7})
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
			`MUL_INST:									ID_alu_func = `ALU_MUL;
			`MULH_INST:									ID_alu_func = `ALU_MULH;
			`MULHSU_INST:								ID_alu_func = `ALU_MULHSU;
			`MULHU_INST:								ID_alu_func = `ALU_MULHU;
			default:									ID_vld = `FALSE;
		endcase
	end

	if (opcode==`I_ARITH_TYPE) begin
		case(funct3)
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

	case (opcode)
		`R_TYPE, `I_ARITH_TYPE, `I_LD_TYPE:				ID_vld = IF_ID_vld;
		`I_JAL_TYPE, `S_TYPE, `B_TYPE, `J_TYPE:			ID_vld = IF_ID_vld;
		`U_LD_TYPE, `U_AUIPC_TYPE, `I_BREAK_TYPE:		ID_vld = IF_ID_vld;
		default:										ID_vld = `FALSE;
	endcase

	ID_mem_cmd = `MEM_NONE;
	case (opcode)
		`I_LD_TYPE: begin
			case (funct3)
				`LB_INST:								ID_mem_cmd = `MEM_LB;
				`LH_INST:								ID_mem_cmd = `MEM_LH;
				`LW_INST:								ID_mem_cmd = `MEM_LW;
				`LBU_INST:								ID_mem_cmd = `MEM_LBU;
				`LHU_INST:								ID_mem_cmd = `MEM_LHU;
			endcase
		end
		`S_TYPE: begin
			case (funct3)
				`SB_INST:								ID_mem_cmd = `MEM_SB;
				`SH_INST:								ID_mem_cmd = `MEM_SH;
				`SW_INST:								ID_mem_cmd = `MEM_SW;
			endcase
		end
	endcase

	case (opcode)
		`S_TYPE, `B_TYPE, `I_BREAK_TYPE:				ID_rd = `ZERO_REG;
		default:										ID_rd = IF_ID_inst[11:7];
	endcase

end

endmodule
