`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module stall(
	input	logic			clk,
	input	logic			rst,

	input	logic	[3:0]	ID_br_ctrl,
	input	logic	[4:0]	ID_EX_alu_func,
	input	logic			EX_alu_busy,


	output logic			ST_if_id_en,
	output logic			ST_id_ex_en,
	output logic			ST_ex_mem_en,
	output logic			ST_mem_wb_en,
	output logic			ST_br_stall
);

logic freeze;

always_comb begin
	case(ID_EX_alu_func)
		`ALU_DIV, `ALU_REM:	freeze	= EX_alu_busy;
		default:			freeze	= `FALSE;
	endcase
end

assign ST_if_id_en = ~freeze;
assign ST_id_ex_en = ~freeze;
assign ST_ex_mem_en = ~freeze;
assign ST_mem_wb_en = ~freeze;

assign ST_br_stall = (ID_br_ctrl[2:0]!=`DONT_BRANCH);

endmodule
