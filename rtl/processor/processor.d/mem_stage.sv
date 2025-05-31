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

logic [7:0] dout_byte;
logic [15:0] dout_hw;

always_comb begin
	
	MEM_mem_addr = EX_MEM_alu_res;
	MEM_mem_din = EX_MEM_mem_din;

	case(EX_MEM_mem_cmd)
		`MEM_LB, `MEM_LH, `MEM_LW, `MEM_LBU, `MEM_LHU:	MEM_vld = EX_MEM_vld;
		`MEM_SB, `MEM_SH, `MEM_SW, `MEM_NONE:			MEM_vld = EX_MEM_vld;
		default:										MEM_vld = `FALSE;
	endcase

	MEM_mem_cmd = EX_MEM_vld ? EX_MEM_mem_cmd : `MEM_NONE;

	case (MEM_mem_addr[1])
		1'b1:											dout_hw = DM_mem_dout[31:16];
		default:										dout_hw = DM_mem_dout[15:0];
	endcase

	case (MEM_mem_addr[0])
		1'b1:											dout_byte = dout_hw[15:8];
		default:										dout_byte = dout_hw[7:0];
	endcase

	case(MEM_mem_cmd)
		`MEM_LB:										MEM_data = {{24{dout_byte[7]}}, dout_byte};
		`MEM_LH:										MEM_data = {{16{dout_hw[15]}}, dout_hw[15:0]};
		`MEM_LW:										MEM_data = DM_mem_dout;
		`MEM_LBU:										MEM_data = {24'h0, dout_byte};
		`MEM_LHU:										MEM_data = {16'h0, dout_hw};
		default:										MEM_data = EX_MEM_alu_res;
	endcase

end

endmodule
