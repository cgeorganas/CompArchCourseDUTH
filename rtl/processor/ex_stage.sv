`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module ex_stage(
input logic 		clk,               // system clk
input logic 		rst,               // system rst
input logic [31:0]  id_ex_PC,            // PC
input logic [31:0] 	id_ex_imm,
input logic [31:0]  id_ex_rega,          // register A value from reg file
input logic [31:0]  id_ex_regb,          // register B value from reg file
input logic [1:0] 	id_ex_opa_select,    // opA mux select from decoder
input logic [1:0] 	id_ex_opb_select,    // opB mux select from decoder
input logic [4:0]   id_ex_alu_func,      // ALU function select from decoder
input logic 		id_ex_valid_inst,
//branch
input logic [31:0]  pc_add_opa,
input logic [2:0]   id_ex_funct3,
input logic 		uncond_branch,
input logic 		cond_branch,
//output
output logic 		ex_take_branch_out,
output logic [31:0] ex_target_PC_out,
output logic [31:0] ex_alu_result_out    // The arithmetic result. Needs to be renamed
);

logic [31:0] alu_opa, alu_opb;

logic brcond_result;

logic [31:0] br_cond_opa, br_cond_opb;

logic [31:0] opa_mux_out, opb_mux_out;

logic [31:0] alu_result;

always_comb begin : opA_mux
	case (id_ex_opa_select)
		`ALU_OPA_IS_PC:   opa_mux_out = id_ex_PC;
		`ALU_OPA_IS_ZR:   opa_mux_out = 32'b0;
		default:         opa_mux_out = id_ex_rega;
	endcase
end

always_comb begin : opB_mux
	case (id_ex_opb_select)
		`ALU_OPB_IS_IMM: 		opb_mux_out = id_ex_imm;
		`ALU_OPB_IS_4:			opb_mux_out = 32'h4;
		default: 				opb_mux_out = id_ex_regb;
	endcase 
end

assign alu_opa=opa_mux_out;
assign alu_opb=opb_mux_out;

assign br_cond_opa=id_ex_rega;
assign br_cond_opb=id_ex_regb;

alu alu_0 (// Inputs
		  .opa(alu_opa),
		  .opb(alu_opb),
		  .br_cond_opa(br_cond_opa),
		  .br_cond_opb(br_cond_opb),
		  .operation(id_ex_alu_func),
		  .funct3(id_ex_funct3),
		  .result(alu_result),
		  .br_cond_result(brcond_result));

assign ex_target_PC_out = pc_add_opa + id_ex_imm;

assign ex_take_branch_out = (uncond_branch | (cond_branch & brcond_result)) & id_ex_valid_inst;
//

assign ex_alu_result_out=alu_result;


endmodule // module ex_stage
