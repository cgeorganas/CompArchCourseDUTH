`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module ex_stage(
	input logic			clk,
	input logic			rst,
	input logic [31:0]	id_ex_PC,
	input logic [31:0]	id_ex_imm,
	input logic [31:0]	id_ex_rega,
	input logic [31:0]	id_ex_regb,
	input logic [2:0]	id_ex_opa_select,
	input logic [2:0]	id_ex_opb_select,
	input logic [4:0]	id_ex_alu_func,
	input logic 		id_ex_valid_inst,

	input logic [31:0]	pc_add_opa,
	input logic [2:0]	id_ex_funct3,
	input logic			uncond_branch,
	input logic			cond_branch,

	input logic [31:0]	ex_mem_alu_result,
	input logic [31:0]	mem_wb_alu_result,

	output logic 		ex_take_branch_out,
	output logic [31:0]	ex_target_PC_out,
	output logic [31:0]	ex_alu_result_out
);

logic [31:0] opa_mux_out, opb_mux_out;

logic [31:0] wb_id_alu_result;
always_ff @(posedge clk) begin
	if (rst)
		wb_id_alu_result <= 32'b0;
	else
		wb_id_alu_result <= mem_wb_alu_result;
end

always_comb begin
	case (id_ex_opa_select)
		`ALU_OPA_IS_PC:		opa_mux_out = id_ex_PC;
		`ALU_OPA_IS_ZR:		opa_mux_out = 32'b0;
		`ALU_OPA_FOWARD_1:	opa_mux_out = ex_mem_alu_result;
		`ALU_OPA_FOWARD_2:	opa_mux_out = mem_wb_alu_result;
		`ALU_OPA_FOWARD_3:	opa_mux_out = wb_id_alu_result;
		default:			opa_mux_out = id_ex_rega;
	endcase
end

always_comb begin
	case (id_ex_opb_select)
		`ALU_OPB_IS_IMM:	opb_mux_out = id_ex_imm;
		`ALU_OPB_IS_4:		opb_mux_out = 32'h4;
		`ALU_OPB_FOWARD_1:	opb_mux_out = ex_mem_alu_result;
		`ALU_OPB_FOWARD_2:	opb_mux_out = mem_wb_alu_result;
		`ALU_OPB_FOWARD_3:	opb_mux_out = wb_id_alu_result;
		default: 			opb_mux_out = id_ex_regb;
	endcase 
end

logic br_cond_result;

alu alu_0 (
	.opa(opa_mux_out),
	.opb(opb_mux_out),
	.br_cond_opa(id_ex_rega),
	.br_cond_opb(id_ex_regb),
	.operation(id_ex_alu_func),
	.funct3(id_ex_funct3),
	.result(ex_alu_result_out),
	.br_cond_result(br_cond_result)
);

assign ex_target_PC_out = pc_add_opa + id_ex_imm;

assign ex_take_branch_out = (uncond_branch | (cond_branch & br_cond_result)) & id_ex_valid_inst;

endmodule
