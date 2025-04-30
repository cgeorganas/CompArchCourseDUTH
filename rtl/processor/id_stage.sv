`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

//Instruction Decode Stage 
module id_stage(
input logic 		clk,              		// system clk
input logic 		rst,              		// system rst
input logic [31:0] 	if_id_IR,            	// incoming instruction
input logic [31:0]	if_id_PC,
input logic	        mem_wb_valid_inst,   	 	//Does the instruction write to rd?
input logic	        mem_wb_reg_wr,   	 	//Does the instruction write to rd?
input logic [4:0]	mem_wb_dest_reg_idx, 	//index of rd
input logic [31:0] 	wb_reg_wr_data_out, 	// Reg write data from WB Stage
input logic         if_id_valid_inst,

input logic [3:0]	if_forward,
input logic [31:0]	ex_alu_result_out,
input logic [31:0]	ex_mem_alu_result,
input logic [31:0]	mem_wb_alu_result,

output logic [31:0] id_ra_value_out,    	// reg A value
output logic [31:0] id_rb_value_out,    	// reg B value
output logic [31:0]	id_immediate_out,		// sign-extended 32-bit immediate
output logic [31:0] pc_add_opa,

output logic [1:0] 	id_opa_select_out,    	// ALU opa mux select (ALU_OPA_xxx *)
output logic [1:0] 	id_opb_select_out,    	// ALU opb mux select (ALU_OPB_xxx *)

output logic 		id_reg_wr_out,
output logic [2:0] 	id_funct3_out,
output logic [4:0] 	id_dest_reg_idx_out,  	// destination (writeback) register index (ZERO_REG if no writeback)
output logic [4:0]  id_alu_func_out,        // ALU function select (ALU_xxx *)
output logic       	id_rd_mem_out,          // does inst read memory?
output logic 	    id_wr_mem_out,          // does inst write memory?
output logic 		cond_branch,
output logic        uncond_branch,
output logic       	id_illegal_out,
output logic       	id_valid_inst_out	  	// is inst a valid instruction to be counted for CPI calculations?
);
   
logic dest_reg_select;
logic [31:0] rb_val;

//instruction fields read from IF/ID pipeline register
logic[4:0] ra_idx; 
logic[4:0] rb_idx; 
logic[4:0] rc_idx; 

assign ra_idx=if_id_IR[19:15];	// inst operand A register index
assign rb_idx=if_id_IR[24:20];	// inst operand B register index
assign rc_idx=if_id_IR[11:7];  // inst operand C register index
// Instantiate the register file used by this pipeline

logic write_en;
assign write_en=mem_wb_valid_inst & mem_wb_reg_wr;

logic [31:0] regf_rda, regf_rdb;

regfile regf_0(.clk		(clk),
			   .rst		(rst),
			   .rda_idx	(ra_idx),
			   .rda_out	(regf_rda), 
			   .rdb_idx	(rb_idx),
			   .rdb_out	(regf_rdb), 
			   .wr_en	(write_en),
			   .wr_idx	(mem_wb_dest_reg_idx),
			   .wr_data	(wb_reg_wr_data_out));

always_comb begin
	case (if_forward[1:0])
		2'b00:		id_ra_value_out = regf_rda;
		2'b01:		id_ra_value_out = ex_alu_result_out;
		2'b10:		id_ra_value_out = ex_mem_alu_result;
		2'b11:		id_ra_value_out = mem_wb_alu_result;
		default:	id_ra_value_out = regf_rda;
	endcase
	case (if_forward[3:2])
		2'b00:		id_rb_value_out = regf_rdb;
		2'b01:		id_rb_value_out = ex_alu_result_out;
		2'b10:		id_rb_value_out = ex_mem_alu_result;
		2'b11:		id_rb_value_out = mem_wb_alu_result;
		default:	id_rb_value_out = regf_rdb;
	endcase
end

// instantiate the instruction inst_decoder
inst_decoder inst_decoder_0(.inst	        (if_id_IR),
							.valid_inst_in  (if_id_valid_inst),
							.opa_select		(id_opa_select_out),
							.opb_select		(id_opb_select_out),
							.alu_func		(id_alu_func_out),
							.dest_reg		(dest_reg_select),
							.rd_mem			(id_rd_mem_out),
							.wr_mem			(id_wr_mem_out),
							.cond_branch	(cond_branch),
							.uncond_branch	(uncond_branch),
							.illegal		(id_illegal_out),
							.valid_inst		(id_valid_inst_out));

always_comb begin : write_to_rd
	case(if_id_IR[6:0])
		`R_TYPE, `U_LD_TYPE, `U_AUIPC_TYPE		: id_reg_wr_out = `TRUE;
		`I_ARITH_TYPE, `I_LD_TYPE, `I_JAL_TYPE	: id_reg_wr_out = `TRUE;
		`J_TYPE									: id_reg_wr_out = `TRUE;
		default: id_reg_wr_out = `FALSE;
	endcase
end

// mux to generate dest_reg_idx based on
// the dest_reg_select output from inst_decoder
always_comb begin
	if(dest_reg_select==`DEST_IS_REGC)
		id_dest_reg_idx_out = rc_idx;
	else
		id_dest_reg_idx_out = `ZERO_REG;
end

//ultimate "take branch" signal: unconditional, or conditional and the condition is true


//set up possible immediates:
//jmp_disp: 20-bit sign-extended immediate for jump displacement;
//up_imm: 20-bit immediate << 12;
//br_disp: sign-extended 12-bit immediate * 2 for branch displacement 
//mem_disp: sign-extended 12-bit immediate for memory displacement 
//alu_imm: sign-extended 12-bit immediate for ALU ops
logic[31:0] jmp_disp;
logic[31:0] up_imm;	
logic[31:0] br_disp; 	
logic[31:0] mem_disp; 
logic[31:0] alu_imm;	

assign jmp_disp={{12{if_id_IR[31]}}, if_id_IR[19:12], if_id_IR[20], if_id_IR[30:21], 1'b0};
assign up_imm = {if_id_IR[31:12], 12'b0};
assign br_disp = {{20{if_id_IR[31]}}, if_id_IR[7], if_id_IR[30:25], if_id_IR[11:8], 1'b0};
assign mem_disp = {{20{if_id_IR[31]}}, if_id_IR[31:25], if_id_IR[11:7]};
assign alu_imm = {{20{if_id_IR[31]}}, if_id_IR[31:20]};


always_comb begin : immediate_mux
	case(if_id_IR[6:0])
		`S_TYPE: id_immediate_out = mem_disp;
		`B_TYPE: id_immediate_out = br_disp;
		`J_TYPE: id_immediate_out = jmp_disp;
		`U_LD_TYPE, `U_AUIPC_TYPE: id_immediate_out = up_imm;
		default:id_immediate_out = alu_imm;
	endcase
end

assign pc_add_opa =(if_id_IR[6:0] == `I_JAL_TYPE)? id_ra_value_out:if_id_PC;


//target PC to branch to

assign id_funct3_out = if_id_IR[14:12];

endmodule // module id_stage
