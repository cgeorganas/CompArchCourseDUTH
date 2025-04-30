`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

//
// The ALU
//
// given the command code CMD and proper operands A and B, compute the
// result of the instruction
//
// This module is purely combinational
//

module alu(
input logic [31:0] opa, opb,
input logic [31:0] br_cond_opa, br_cond_opb,
input logic [4:0] func,
input logic [2:0] id_ex_funct3,

output logic [31:0] result,
output logic brcond_result
);

logic signed [32:0] mult_a, mult_b;
logic signed [65:0] mult_res;
logic sign_a, sign_b;
assign mult_a = {sign_a&&opa[31],opa};
assign mult_b = {sign_b&&opb[31],opb};
assign mult_res = mult_a * mult_b;

//result 
always_comb begin
	case (func)
		//R-TYPE
		`ALU_ADD:		result = opa + opb;
		`ALU_SUB:		result = opa - opb;
		`ALU_XOR:		result = opa ^ opb;
		`ALU_OR:		result = opa | opb;
		`ALU_AND:		result = opa & opb;
		`ALU_SLL:		result = opa << opb[4:0];
		`ALU_SRL:		result = opa >> opb[4:0];
		`ALU_SRA:		result = $signed(opa) >>> opb[4:0]; 
		`ALU_SLT:		result = {31'd0, ($signed(opa)< $signed(opb))};
		`ALU_SLTU:		result = {31'd0, (opa < opb)};
		`ALU_MUL:		begin
							sign_a=0;
							sign_b=0;
							result = mult_res[31:0];
						end
		`ALU_MULH:		begin
							sign_a=1;
							sign_b=1;
							result = mult_res[63:32];
						end
		`ALU_MULHSU:	begin
							sign_a=1;
							sign_b=0;
							result = mult_res[63:32];
						end
		`ALU_MULHU:		begin
							sign_a=0;
							sign_b=0;
							result = mult_res[63:32];
						end
		// `ALU_DIV:
		// `ALU_DIVU:
		// `ALU_REM:
		// `ALU_REMU:
		default:		result = 32'hbaadbeef;
	endcase	
end

//br condition
always_comb begin
	case (id_ex_funct3[2:1])
		2'b00: brcond_result = (br_cond_opa == br_cond_opb);         // BEQ: (rs1 == rs2) ?
		2'b10: brcond_result = $signed(br_cond_opa)< $signed(br_cond_opb);	// BLT: (rs1 < rs2)
		2'b11: brcond_result = br_cond_opa < br_cond_opb;   		    // BLTU: (unsigned(rs1) < unsigned(rs2))
		default: brcond_result = `FALSE;
	endcase
	//negate cond if func[0] is set
 	if(id_ex_funct3[0]) 
		brcond_result = ~brcond_result;

end

endmodule // alu
