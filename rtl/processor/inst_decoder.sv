`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

//Decoder

module inst_decoder(
input [31:0] 		inst,
input logic valid_inst_in,  // ignore inst when low, outputs will
					        // reflect noop (except valid_inst)

output logic [1:0] 	opa_select,
output logic [1:0] 	opb_select,
output logic        dest_reg, // mux selects
output logic [4:0]  alu_func,
output logic 		rd_mem,wr_mem, cond_branch, uncond_branch,
output logic 		illegal,    // non-zero on an illegal instruction
output logic 		valid_inst  // for counting valid instructions executed
);

assign valid_inst =valid_inst_in & ~illegal;

always_comb begin
	// - invalid instructions should clear valid_inst.
	// - These defaults are equivalent to a noop
	// * see sys_defs.vh for the constants used here
	opa_select = `ALU_OPA_IS_REGA;
	opb_select = `ALU_OPB_IS_REGB;
	alu_func = `ALU_ADD;
	dest_reg = `DEST_NONE;
	rd_mem = `FALSE;
	wr_mem = 1'b0;
	cond_branch = `FALSE;
	uncond_branch = `FALSE;
	illegal = `FALSE;

	case (inst[6:0])
		`R_TYPE: begin
			opa_select = `ALU_OPA_IS_REGA;
			opb_select = `ALU_OPB_IS_REGB;
			dest_reg = `DEST_IS_REGC;

			case({inst[14:12], inst[31:25]})
				`ADD_INST    : alu_func = `ALU_ADD;   
				`SUB_INST    : alu_func = `ALU_SUB;    
				`XOR_INST    : alu_func = `ALU_XOR;   
				`OR_INST     : alu_func = `ALU_OR;   
				`AND_INST    : alu_func = `ALU_AND;   
				`SLL_INST    : alu_func = `ALU_SLL;   
				`SRL_INST    : alu_func = `ALU_SRL;   
				`SRA_INST    : alu_func = `ALU_SRA;   
				`SLT_INST    : alu_func = `ALU_SLT;   
				`SLTU_INST   : alu_func = `ALU_SLTU;
				`MUL_INST    : alu_func = `ALU_MUL;
				`MULH_INST   : alu_func = `ALU_MULH;
				`MULHSU_INST : alu_func = `ALU_MULHSU;
				`MULHU_INST  : alu_func = `ALU_MULHU;
				// `DIV_INST    : alu_func = `ALU_DIV;
				// `DIVU_INST   : alu_func = `ALU_DIVU;
				// `REM_INST    : alu_func = `ALU_REM;
				// `REMU_INST   : alu_func = `ALU_REMU;
				default: illegal = `TRUE;
			endcase 
		end //R-TYPE

		`I_ARITH_TYPE: begin
			opa_select = `ALU_OPA_IS_REGA;
			opb_select = `ALU_OPB_IS_IMM;
			dest_reg = `DEST_IS_REGC;

			case(inst[14:12])
				`ADDI_INST : alu_func = `ALU_ADD;
				`XORI_INST : alu_func = `ALU_XOR;
				`ORI_INST  : alu_func = `ALU_OR;
				`ANDI_INST : alu_func = `ALU_AND;
				`SLLI_INST : alu_func = `ALU_SLL;
				`SRLI_INST, `SRAI_INST: begin
					//This checks if any of the bits are 1 
					//to distinguish between the 2 instructions
					//because one has imm[5:11] = inst[25:30] = 0x00 and the other 0x20
					//If the ISA changes this check might need to be modified
					alu_func = |inst[31:25] ? `ALU_SRA : `ALU_SRL;
				end
				`SLTI_INST  : alu_func = `ALU_SLT;
				`SLTIU_INST : alu_func = `ALU_SLTU;
				default: illegal = `TRUE;
			endcase 
		end //I_ARITH_TYPE

		`I_LD_TYPE: begin
			opa_select = `ALU_OPA_IS_REGA;
			opb_select = `ALU_OPB_IS_IMM;
			dest_reg = `DEST_IS_REGC;
			rd_mem = `TRUE;
			alu_func = `ALU_ADD;
			illegal=(inst[14:12]!=2)?`TRUE:`FALSE;			
		end //I_LD_TYPE

		`S_TYPE: begin
			opa_select = `ALU_OPA_IS_REGA;
			opb_select = `ALU_OPB_IS_IMM;
			alu_func = `ALU_ADD;
			
			case(inst[14:12])
				`SW_INST:   wr_mem = `TRUE;
				default: illegal = `TRUE;
			endcase
		end //S_TYPE
		
		`B_TYPE: begin
			opa_select = `ALU_OPA_IS_PC;
			opb_select = `ALU_OPB_IS_IMM;
			cond_branch = `TRUE;
			
			case(inst[14:12])
				3'd2, 3'd3: illegal = `TRUE;
				default: alu_func = `ALU_ADD;
			endcase
		end //B_TYPE
		
		`J_TYPE: begin
			opa_select = `ALU_OPA_IS_PC;
			opb_select = `ALU_OPB_IS_4;
			dest_reg = `DEST_IS_REGC;
			alu_func = `ALU_ADD;
			uncond_branch = `TRUE;
		end //J-TYPE
		
		`I_JAL_TYPE: begin
			opa_select = `ALU_OPA_IS_PC;
			opb_select = `ALU_OPB_IS_4;
			dest_reg = `DEST_IS_REGC;
			alu_func = `ALU_ADD;
			uncond_branch = `TRUE;
			
			illegal = (inst[14:12] != 3'h0) ? `TRUE : `FALSE;
		end //I_JAL_TYPE
		
		`U_LD_TYPE: begin
			opa_select = `ALU_OPA_IS_ZR;
			opb_select = `ALU_OPB_IS_IMM;
			dest_reg = `DEST_IS_REGC;
			alu_func = `ALU_ADD;
		end //U_LD_TYPE
		
		`U_AUIPC_TYPE: begin
			opa_select = `ALU_OPA_IS_PC;
			opb_select = `ALU_OPB_IS_IMM;
			dest_reg = `DEST_IS_REGC;
			alu_func = `ALU_ADD;
		end //U_AUIPC_TYPE
		
		`I_BREAK_TYPE: begin
			illegal = (inst[31:20] != 12'h1); //if imm=0x1 it is a ebreak (environmental break)
		end
		
		default: illegal = `TRUE;
	endcase 
end 
endmodule // inst_decoder
