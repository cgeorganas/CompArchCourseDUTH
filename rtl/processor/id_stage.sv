`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module id_stage(
	input	logic			clk,
	input	logic			rst,

	input	logic	[31:0]	IF_ID_pc,
	input	logic	[31:0]	IF_ID_inst,
	input	logic			IF_ID_vld,
	input	logic	[5:0]	ID_EX_rd,
	input	logic	[5:0]	EX_MEM_rd,

	output	logic	[5:0]	ID_rs1,
	output	logic	[5:0]	ID_rs2,
	output	logic	[31:0]	ID_pc,
	output	logic	[31:0]	ID_imm,
	output	logic	[9:0]	ID_mux_sel,
	output	logic	[3:0]	ID_br_ctrl,
	output	logic	[4:0]	ID_alu_func,
	output	logic			ID_vld,
	output	logic	[3:0]	ID_mem_cmd,
	output	logic	[5:0]	ID_rd
);

assign ID_pc = IF_ID_pc;

logic [1:0] opa_sel, opb_sel;
logic [2:0] forw_rs1, forw_rs2;
assign ID_mux_sel = {opa_sel, opb_sel, forw_rs1, forw_rs2};

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

assign ID_br_ctrl[3] = (opcode==`I_JAL_TYPE);

always_comb begin

	ID_rs1		= {1'b0, IF_ID_inst[19:15]};
	ID_rs2		= {1'b0, IF_ID_inst[24:20]};

	ID_alu_func	= `ALU_ADD;
	ID_vld		= IF_ID_vld;

	case(opcode)

		`R_TYPE: begin
			ID_imm			= 32'h0;
			ID_rd			= {1'b0, IF_ID_inst[11:7]};
			ID_mem_cmd		= `MEM_NONE;
			opa_sel			= `SEL_RS;
			opb_sel			= `SEL_RS;
			ID_br_ctrl[2:0]	= `DONT_BRANCH;

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
				`DIV_INST:									ID_alu_func = `ALU_DIV;
				`DIVU_INST:									ID_alu_func = `ALU_DIVU;
				`REM_INST:									ID_alu_func = `ALU_REM;
				`REMU_INST:									ID_alu_func = `ALU_REMU;
				default:									ID_vld = `FALSE;
			endcase

		end

		`I_ARITH_TYPE: begin
			ID_imm			= imm_i;
			ID_rd			= {1'b0, IF_ID_inst[11:7]};
			ID_mem_cmd		= `MEM_NONE;
			opa_sel			= `SEL_RS;
			opb_sel			= `SEL_IMM;
			ID_br_ctrl[2:0]	= `DONT_BRANCH;

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

		`I_LD_TYPE: begin
			ID_imm			= imm_i;
			ID_rd			= {1'b0, IF_ID_inst[11:7]};
			ID_mem_cmd		= {1'b0, funct3};
			opa_sel			= `SEL_RS;
			opb_sel			= `SEL_IMM;
			ID_br_ctrl[2:0]	= `DONT_BRANCH;
		end

		`I_JAL_TYPE: begin
			ID_imm			= imm_i;
			ID_rd			= {1'b0, IF_ID_inst[11:7]};
			ID_mem_cmd		= `MEM_NONE;
			opa_sel			= `SEL_PC;
			opb_sel			= `SEL_CONST;
			ID_br_ctrl[2:0]	= `UNC_BRANCH;
		end

		`S_TYPE: begin
			ID_imm			= imm_s;
			ID_rd			= `ZERO_REG;
			ID_mem_cmd		= {1'b1, funct3};
			opa_sel			= `SEL_RS;
			opb_sel			= `SEL_IMM;
			ID_br_ctrl[2:0]	= `DONT_BRANCH;
		end

		`B_TYPE: begin
			ID_imm			= imm_b;
			ID_rd			= `ZERO_REG;
			ID_mem_cmd		= `MEM_NONE;
			opa_sel			= `SEL_RS;
			opb_sel			= `SEL_RS;
			ID_br_ctrl[2:0]	= funct3;

			case(funct3)
				`BEQ_INST, `BNE_INST:						ID_alu_func = `ALU_XOR;
				`BLT_INST, `BGE_INST:						ID_alu_func = `ALU_SLT;
				`BLTU_INST, `BGEU_INST:						ID_alu_func = `ALU_SLTU;
				`DONT_BRANCH, `UNC_BRANCH:					ID_alu_func = `ALU_ADD;
				default:									ID_vld = `FALSE;
			endcase

		end

		`J_TYPE: begin
			ID_imm			= imm_j;
			ID_rd			= {1'b0, IF_ID_inst[11:7]};
			ID_mem_cmd		= `MEM_NONE;
			opa_sel			= `SEL_PC;
			opb_sel			= `SEL_CONST;
			ID_br_ctrl[2:0]	= `UNC_BRANCH;
		end

		`U_LD_TYPE: begin
			ID_imm			= imm_u;
			ID_rd			= {1'b0, IF_ID_inst[11:7]};
			ID_mem_cmd		= `MEM_NONE;
			opa_sel			= `SEL_CONST;
			opb_sel			= `SEL_IMM;
			ID_br_ctrl[2:0]	= `DONT_BRANCH;
		end

		`U_AUIPC_TYPE: begin
			ID_imm			= imm_u;
			ID_rd			= {1'b0, IF_ID_inst[11:7]};
			ID_mem_cmd		= `MEM_NONE;
			opa_sel			= `SEL_PC;
			opb_sel			= `SEL_IMM;
			ID_br_ctrl[2:0]	= `DONT_BRANCH;
		end

		`I_BREAK_TYPE: begin
			ID_imm			= 32'h0;
			ID_rd			= `ZERO_REG;
			ID_mem_cmd		= `MEM_NONE;
			opa_sel			= `SEL_CONST;
			opb_sel			= `SEL_CONST;
			ID_br_ctrl[2:0]	= `DONT_BRANCH;
		end

		`R_FLT_TYPE: begin
			ID_imm			= 32'h0;
			ID_rd			= `ZERO_REG;
			ID_mem_cmd		= `MEM_NONE;
			opa_sel			= `SEL_RS;
			opb_sel			= `SEL_RS;
			ID_br_ctrl[2:0]	= `DONT_BRANCH;

			case({funct3, funct7})
				`FMVXW: begin
					ID_rs1	= {1'b1, IF_ID_inst[19:15]};
					ID_rs2	= `ZERO_REG;
					ID_rd	= {1'b0, IF_ID_inst[11:7]};
				end
				`FMVWX: begin
					ID_rs1	= {1'b0, IF_ID_inst[19:15]};
					ID_rs2	= `ZERO_REG;
					ID_rd	= {1'b1, IF_ID_inst[11:7]};
				end
				default: begin
					ID_rs1	= `ZERO_REG;
					ID_rs2	= `ZERO_REG;
					ID_rd	= `ZERO_REG;
					ID_vld	= `FALSE;
				end
			endcase

		end

		default: begin
			ID_imm			= 32'h0;
			ID_vld			= `FALSE;
			ID_rd			= `ZERO_REG;
			ID_mem_cmd		= `MEM_NONE;
			opa_sel			= `SEL_CONST;
			opb_sel			= `SEL_CONST;
			ID_br_ctrl[2:0]	= `DONT_BRANCH;
		end

	endcase



	// Forwarding overrides
	case (ID_rs1)
		`ZERO_REG:	forw_rs1 = `F0;
		ID_EX_rd:	forw_rs1 = `F1;
		EX_MEM_rd:	forw_rs1 = `F2;
		default:	forw_rs1 = `F0;
	endcase
	case (ID_rs2)
		`ZERO_REG:	forw_rs2 = `F0;
		ID_EX_rd:	forw_rs2 = `F1;
		EX_MEM_rd:	forw_rs2 = `F2;
		default:	forw_rs2 = `F0;
	endcase

end

endmodule
