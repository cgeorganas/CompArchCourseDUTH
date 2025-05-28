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

logic [6:0]	funct7;
assign		funct7	= IF_ID_inst[31:25];

logic [4:0]	rs2;
assign		rs2		= IF_ID_inst[24:20];

logic [4:0]	rs1;
assign		rs1		= IF_ID_inst[19:15];

logic [2:0] funct3;
assign		funct3	= IF_ID_inst[14:12];

logic [4:0] rd;
assign		rd		= IF_ID_inst[11:7];

logic [6:0]	opcode;
assign		opcode	= IF_ID_inst[6:0];

logic [31:0] imm_i, imm_s, imm_b, imm_j, imm_u;
assign imm_i = {{20{IF_ID_inst[31]}}, IF_ID_inst[31:20]};
assign imm_s = {{20{IF_ID_inst[31]}}, IF_ID_inst[31:25], IF_ID_inst[11:7]};
assign imm_b = {{20{IF_ID_inst[31]}}, IF_ID_inst[7], IF_ID_inst[30:25], IF_ID_inst[11:8], 1'b0};
assign imm_j = {{12{IF_ID_inst[31]}}, IF_ID_inst[19:12], IF_ID_inst[20], IF_ID_inst[30:21], 1'b0};
assign imm_u = {IF_ID_inst[31:12], 12'b0};

logic [1:0] opa_sel, opb_sel;
logic [2:0] forw_rs1, forw_rs2;
assign ID_mux_sel = {opa_sel, opb_sel, forw_rs1, forw_rs2};

always_comb begin

	// Default values
	ID_rs1		= `ZERO_REG;
	ID_rs2		= `ZERO_REG;
	ID_imm		= 32'h0;
	opa_sel		= `SEL_CONST;
	opb_sel		= `SEL_CONST;
	ID_br_ctrl	= {`FALSE, `DONT_BRANCH};
	ID_alu_func	= `ALU_ADD;
	ID_vld		= `FALSE;
	ID_mem_cmd	= `MEM_NONE;
	ID_rd		= `ZERO_REG;

	case (opcode)

		`R_TYPE: begin
			ID_rs1		= {`FALSE, rs1};
			ID_rs2		= {`FALSE, rs2};
			opa_sel		= `SEL_RS;
			opb_sel		= `SEL_RS;

			case({funct3, funct7})
				`ADD_INST:					ID_alu_func = `ALU_ADD;
				`SUB_INST:					ID_alu_func = `ALU_SUB;
				`XOR_INST:					ID_alu_func = `ALU_XOR;
				`OR_INST:					ID_alu_func = `ALU_OR;
				`AND_INST:					ID_alu_func = `ALU_AND;
				`SLL_INST:					ID_alu_func = `ALU_SLL;
				`SRL_INST:					ID_alu_func = `ALU_SRL;
				`SRA_INST:					ID_alu_func = `ALU_SRA;
				`SLT_INST:					ID_alu_func = `ALU_SLT;
				`SLTU_INST:					ID_alu_func = `ALU_SLTU;
				`MUL_INST:					ID_alu_func = `ALU_MUL;
				`MULH_INST:					ID_alu_func = `ALU_MULH;
				`MULHSU_INST:				ID_alu_func = `ALU_MULHSU;
				`MULHU_INST:				ID_alu_func = `ALU_MULHU;
				`DIV_INST:					ID_alu_func = `ALU_DIV;
				`DIVU_INST:					ID_alu_func = `ALU_DIVU;
				`REM_INST:					ID_alu_func = `ALU_REM;
				`REMU_INST:					ID_alu_func = `ALU_REMU;
				default:					ID_vld = `FALSE;
			endcase

			ID_vld		= IF_ID_vld;
			ID_rd		= {`FALSE, rd};
		end

		`I_ARITH_TYPE: begin
			ID_rs1		= {`FALSE, rs1};
			ID_imm		= imm_i;
			opa_sel		= `SEL_RS;
			opb_sel		= `SEL_IMM;

			case(funct3)
				`ADDI_INST:					ID_alu_func = `ALU_ADD;
				`XORI_INST:					ID_alu_func = `ALU_XOR;
				`ORI_INST:					ID_alu_func = `ALU_OR;
				`ANDI_INST:					ID_alu_func = `ALU_AND;
				`SLLI_INST:					ID_alu_func = `ALU_SLL;
				`SRLI_INST, `SRAI_INST:		ID_alu_func = IF_ID_inst[30] ? `ALU_SRA : `ALU_SRL;
				`SLTI_INST:					ID_alu_func = `ALU_SLT;
				`SLTIU_INST:				ID_alu_func = `ALU_SLTU;
				default:					ID_vld = `FALSE;
			endcase

			ID_vld		= IF_ID_vld;
			ID_rd		= {`FALSE, rd};
		end

		`I_LD_TYPE: begin
			ID_rs1		= {`FALSE, rs1};
			ID_imm		= imm_i;
			opa_sel		= `SEL_RS;
			opb_sel		= `SEL_IMM;
			ID_vld		= IF_ID_vld;
			ID_mem_cmd	= {`FALSE, funct3};
			ID_rd		= {`FALSE, rd};
		end

		`I_JAL_TYPE: begin
			ID_rs1		= {`FALSE, rs1};
			ID_imm		= imm_i;
			opa_sel		= `SEL_PC;
			ID_br_ctrl	= {`TRUE, `UNC_BRANCH};
			ID_vld		= IF_ID_vld;
			ID_rd		= {`FALSE, rd};
		end

		`S_TYPE: begin
			ID_rs1		= {`FALSE, rs1};
			ID_rs2		= {`FALSE, rs2};
			ID_imm		= imm_s;
			opa_sel		= `SEL_RS;
			opb_sel		= `SEL_IMM;
			ID_vld		= IF_ID_vld;
			ID_mem_cmd	= {`TRUE, funct3};
		end

		`B_TYPE: begin
			ID_rs1		= {`FALSE, rs1};
			ID_rs2		= {`FALSE, rs2};
			ID_imm		= imm_b;
			opa_sel		= `SEL_RS;
			opb_sel		= `SEL_RS;
			ID_br_ctrl	= {`FALSE, funct3};

			case(funct3)
				`BEQ_INST, `BNE_INST:		ID_alu_func = `ALU_XOR;
				`BLT_INST, `BGE_INST:		ID_alu_func = `ALU_SLT;
				`BLTU_INST, `BGEU_INST:		ID_alu_func = `ALU_SLTU;
				`DONT_BRANCH, `UNC_BRANCH:	ID_alu_func = `ALU_ADD;
				default:					ID_vld = `FALSE;
			endcase

			ID_vld		= IF_ID_vld;
		end

		`J_TYPE: begin
			ID_imm		= imm_j;
			opa_sel		= `SEL_PC;
			ID_br_ctrl	= {`FALSE, `UNC_BRANCH};
			ID_vld		= IF_ID_vld;
			ID_rd		= {`FALSE, rd};
		end

		`U_LD_TYPE: begin
			ID_imm		= imm_u;
			opb_sel		= `SEL_IMM;
			ID_vld		= IF_ID_vld;
			ID_rd		= {`FALSE, rd};
		end

		`U_AUIPC_TYPE: begin
			ID_imm		= imm_u;
			opa_sel		= `SEL_PC;
			opb_sel		= `SEL_IMM;
			ID_vld		= IF_ID_vld;
			ID_rd		= {`FALSE, rd};
		end

		`S_FLT_TYPE: begin
			ID_rs1		= {`FALSE, rs1};
			ID_rs2		= {`TRUE, rs2};
			ID_imm		= imm_s;
			opa_sel		= `SEL_RS;
			opb_sel		= `SEL_IMM;
			ID_vld		= IF_ID_vld;
			ID_mem_cmd	= {`TRUE, `MEM_SW};
		end

		`I_LDFLT_TYPE: begin
			ID_rs1		= {`FALSE, rs1};
			ID_imm		= imm_i;
			opa_sel		= `SEL_RS;
			opb_sel		= `SEL_IMM;
			ID_vld		= IF_ID_vld;
			ID_mem_cmd	= {`FALSE, `MEM_LW};
			ID_rd		= {`TRUE, rd};
		end

		`R_FLT_TYPE: begin
			ID_imm		= {29'h0, funct3};
			opa_sel		= `SEL_RS;
			opb_sel		= `SEL_RS;
			ID_vld		= IF_ID_vld;

			casez({funct3, rs2, funct7})
				`FMVXW_INST: begin
					ID_rs1	= {`TRUE, rs1};
					ID_rd	= {`FALSE, rd};
				end
				`FMVWX_INST: begin
					ID_rs1	= {`FALSE, rs1};
					ID_rd	= {`TRUE, rd};
				end
				`FCVTSW_INST: begin
					ID_rs1	= {`FALSE, rs1};
					ID_rd	= {`TRUE, rd};
					ID_alu_func = `ALU_FCVTSW;
				end
				`FCVTSWU_INST: begin
					ID_rs1	= {`FALSE, rs1};
					ID_rd	= {`TRUE, rd};
					ID_alu_func = `ALU_FCVTSWU;
				end
				default: ID_vld = `FALSE;
			endcase

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
