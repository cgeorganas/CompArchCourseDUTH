`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module mem_stage(
	input	logic			clk,
	input	logic			rst,

	input	logic	[31:0]	EX_MEM_mem_din,
	input	logic	[31:0]	EX_MEM_alu_res,
	input	logic			EX_MEM_vld,
	input	logic	[3:0]	EX_MEM_mem_cmd,

	input	logic	[31:0]	DM_mem_dout,
	output	logic	[3:0]	MEM_mem_cmd,
	output	logic	[31:0]	MEM_mem_addr,
	output	logic	[31:0]	MEM_mem_din,

	output	logic	[31:0]	MEM_data,
	output	logic			MEM_vld
);


always_comb begin
	
	MEM_mem_addr = EX_MEM_alu_res;
	MEM_mem_din = EX_MEM_mem_din;

	case(EX_MEM_mem_cmd)
		`MEM_LB, `MEM_LH, `MEM_LW, `MEM_LBU, `MEM_LHU:	MEM_vld = EX_MEM_vld;
		`MEM_SB, `MEM_SH, `MEM_SW, `MEM_NONE:			MEM_vld = EX_MEM_vld;
		default:										MEM_vld = `FALSE;
	endcase

	MEM_mem_cmd = EX_MEM_vld ? EX_MEM_mem_cmd : `MEM_NONE;

	case(MEM_mem_cmd)
		`MEM_LB, `MEM_LH, `MEM_LW, `MEM_LBU, `MEM_LHU:	MEM_data = DM_mem_dout;
		default:										MEM_data = EX_MEM_alu_res;
	endcase

end

endmodule
