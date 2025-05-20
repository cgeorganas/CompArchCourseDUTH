`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module id_stage(
	input	logic			clk,
	input	logic			rst,

	input	logic	[31:0]	RF_rs1_data,
	input	logic	[31:0]	RF_rs2_data,
	input	logic	[31:0]	IF_ID_pc,
	input	logic	[31:0]	IF_ID_inst,
	input	logic			IF_ID_vld,

	output	logic	[4:0]	ID_rs1,
	output	logic	[4:0]	ID_rs2,
	output	logic	[31:0]	ID_alu_opa,
	output	logic	[31:0]	ID_alu_opb,
	output	logic	[4:0]	ID_alu_func,
	output	logic			ID_vld,
	output	logic	[31:0]	ID_mem_din,
	output	logic	[1:0]	ID_mem_cmd,
	output	logic	[4:0]	ID_rd
);

assign ID_rs1 = IF_ID_inst[19:15];
assign ID_rs2 = IF_ID_inst[24:20];

logic [31:0] imm_i, imm_s, imm_b, imm_j, imm_u;
assign imm_i = {{20{IF_ID_inst[31]}}, IF_ID_inst[31:20]};
assign imm_s = {{20{IF_ID_inst[31]}}, IF_ID_inst[31:25], IF_ID_inst[11:7]};
assign imm_b = {{20{IF_ID_inst[31]}}, IF_ID_inst[7], IF_ID_inst[30:25], IF_ID_inst[11:8], 1'b0};
assign imm_j = {{12{IF_ID_inst[31]}}, IF_ID_inst[19:12], IF_ID_inst[20], IF_ID_inst[30:21], 1'b0};
assign imm_u = {IF_ID_inst[31:12], 12'b0};

always_comb begin

	case (IF_ID_inst[6:0])
		`R_TYPE, `I_ARITH_TYPE, `I_LD_TYPE,`S_TYPE:		ID_alu_opa = RF_rs1_data;
		`I_JAL_TYPE, `B_TYPE, `J_TYPE, `U_AUIPC_TYPE:	ID_alu_opa = IF_ID_pc;
		default:										ID_alu_opa = 32'h0000_0000;
	endcase

	case (IF_ID_inst[6:0])
		`R_TYPE:										ID_alu_opb = RF_rs2_data;
		`I_ARITH_TYPE, `I_LD_TYPE:						ID_alu_opb = imm_i;
		`S_TYPE:										ID_alu_opb = imm_s;
		`B_TYPE:										ID_alu_opb = imm_b;
		`U_LD_TYPE, `U_AUIPC_TYPE:						ID_alu_opb = imm_u;
		`J_TYPE, `I_JAL_TYPE:							ID_alu_opb = 32'h0000_0004;
		default:										ID_alu_opb = 32'h0000_0000;
	endcase

	case (IF_ID_inst[6:0])
		`R_TYPE, `I_ARITH_TYPE, `I_LD_TYPE:				ID_vld = IF_ID_vld;
		`I_JAL_TYPE, `S_TYPE, `B_TYPE, `J_TYPE:			ID_vld = IF_ID_vld;
		`U_LD_TYPE, `U_AUIPC_TYPE, `I_BREAK_TYPE:		ID_vld = IF_ID_vld;
		default:										ID_vld = `FALSE;
	endcase

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
		case({IF_ID_inst[14:12], IF_ID_inst[31:25]})
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
		`I_LD_TYPE:										ID_mem_cmd = `BUS_LOAD;
		`S_TYPE:										ID_mem_cmd = `BUS_STORE;
		default:										ID_mem_cmd = `BUS_NONE;
	endcase

	case (IF_ID_inst[6:0])
		`S_TYPE, `B_TYPE, `I_BREAK_TYPE:				ID_rd = `ZERO_REG;
		default:										ID_rd = IF_ID_inst[11:7];
	endcase

end

assign ID_mem_din = (ID_mem_cmd==`BUS_STORE) ? RF_rs2_data : 32'h0000_0000;

endmodule
