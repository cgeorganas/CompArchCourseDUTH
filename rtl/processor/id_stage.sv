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
	output	logic	[8:0]	ID_mux_sel,
	output	logic	[4:0]	ID_alu_func,
	output	logic			ID_vld,
	output	logic	[3:0]	ID_mem_cmd,
	output	logic	[4:0]	ID_rd
);

assign ID_rs1 = IF_ID_inst[19:15];
assign ID_rs2 = IF_ID_inst[24:20];
assign ID_pc = IF_ID_pc;

logic [2:0] opa_sel, opb_sel, din_sel;
assign ID_mux_sel = {opa_sel, opb_sel, din_sel};

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

	case(opcode)

		`R_TYPE: begin
			ID_imm		= 32'h0;
			ID_vld		= IF_ID_vld;
			ID_rd		= IF_ID_inst[11:7];
			ID_mem_cmd	= `MEM_NONE;
			opa_sel		= `SEL_RS;
			opb_sel		= `SEL_RS;
			din_sel		= `SEL_0;
		end

		`I_ARITH_TYPE: begin
			ID_imm		= imm_i;
			ID_vld		= IF_ID_vld;
			ID_rd		= IF_ID_inst[11:7];
			ID_mem_cmd	= `MEM_NONE;
			opa_sel		= `SEL_RS;
			opb_sel		= `SEL_IMM;
			din_sel		= `SEL_0;
		end

		`I_LD_TYPE: begin
			ID_imm		= imm_i;
			ID_vld		= IF_ID_vld;
			ID_rd		= IF_ID_inst[11:7];
			ID_mem_cmd	= {1'b0, funct3};
			opa_sel		= `SEL_RS;
			opb_sel		= `SEL_IMM;
			din_sel		= `SEL_0;
		end

		`I_JAL_TYPE: begin
			ID_imm		= imm_j;
			ID_vld		= IF_ID_vld;
			ID_rd		= IF_ID_inst[11:7];
			ID_mem_cmd	= `MEM_NONE;
			opa_sel		= `SEL_PC;
			opb_sel		= `SEL_0;
			din_sel		= `SEL_0;
		end

		`S_TYPE: begin
			ID_imm		= imm_s;
			ID_vld		= IF_ID_vld;
			ID_rd		= `ZERO_REG;
			ID_mem_cmd	= {1'b1, funct3};
			opa_sel		= `SEL_RS;
			opb_sel		= `SEL_IMM;
			din_sel		= `SEL_RS;
		end

		`B_TYPE: begin
			ID_imm		= imm_b;
			ID_vld		= IF_ID_vld;
			ID_rd		= `ZERO_REG;
			ID_mem_cmd	= `MEM_NONE;
			opa_sel		= `SEL_RS;
			opb_sel		= `SEL_RS;
			din_sel		= `SEL_0;
		end

		`J_TYPE: begin
			ID_imm		= imm_j;
			ID_vld		= IF_ID_vld;
			ID_rd		= IF_ID_inst[11:7];
			ID_mem_cmd	= `MEM_NONE;
			opa_sel		= `SEL_PC;
			opb_sel		= `SEL_0;
			din_sel		= `SEL_0;
		end

		`U_LD_TYPE: begin
			ID_imm		= imm_u;
			ID_vld		= IF_ID_vld;
			ID_rd		= IF_ID_inst[11:7];
			ID_mem_cmd	= `MEM_NONE;
			opa_sel		= `SEL_0;
			opb_sel		= `SEL_IMM;
			din_sel		= `SEL_0;
		end

		`U_AUIPC_TYPE: begin
			ID_imm		= imm_u;
			ID_vld		= IF_ID_vld;
			ID_rd		= IF_ID_inst[11:7];
			ID_mem_cmd	= `MEM_NONE;
			opa_sel		= `SEL_PC;
			opb_sel		= `SEL_IMM;
			din_sel		= `SEL_0;
		end

		`I_BREAK_TYPE: begin
			ID_imm		= 32'h0;
			ID_vld		= IF_ID_vld;
			ID_rd		= `ZERO_REG;
			ID_mem_cmd	= `MEM_NONE;
			opa_sel		= `SEL_0;
			opb_sel		= `SEL_0;
			din_sel		= `SEL_0;
		end

		default: begin
			ID_imm		= 32'h0;
			ID_vld		= `FALSE;
			ID_rd		= `ZERO_REG;
			ID_mem_cmd	= `MEM_NONE;
			opa_sel		= `SEL_0;
			opb_sel		= `SEL_0;
			din_sel		= `SEL_0;
		end

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


	// Forwarding overrides
	if (opa_sel==`SEL_RS) begin
		case (ID_rs1)
			`ZERO_REG:	opa_sel = `SEL_0;
			ID_EX_rd:	opa_sel = `SEL_F1;
			EX_MEM_rd:	opa_sel = `SEL_F2;
		endcase
	end
	if (opb_sel==`SEL_RS) begin
		case (ID_rs2)
			`ZERO_REG:	opb_sel = `SEL_0;
			ID_EX_rd:	opb_sel = `SEL_F1;
			EX_MEM_rd:	opb_sel = `SEL_F2;
		endcase
	end
	if (din_sel==`SEL_RS) begin
		case (ID_rs2)
			`ZERO_REG:	din_sel = `SEL_0;
			ID_EX_rd:	din_sel = `SEL_F1;
			EX_MEM_rd:	din_sel = `SEL_F2;
		endcase
	end

end

endmodule
