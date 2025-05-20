`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module wb_stage(
	input	logic			clk,
	input	logic			rst,

	input	logic	[31:0]	MEM_WB_alu_res,
	input	logic	[31:0]	MEM_WB_mem_dout,
	input	logic	[1:0]	MEM_WB_wb_sel,
	input	logic			MEM_WB_vld,
	input	logic	[4:0]	MEM_WB_rd,

	output	logic	[31:0]	WB_data,
	output	logic	[4:0]	WB_rd
);

always_comb begin

	WB_data	= 32'h0000_0000;
	WB_rd	= `ZERO_REG;

	if (MEM_WB_vld) begin
		WB_rd = MEM_WB_rd;
		case (MEM_WB_wb_sel)
			`WB_SEL_ALU:	WB_data = MEM_WB_alu_res;
			`WB_SEL_DOUT:	WB_data = MEM_WB_mem_dout;
		endcase
	end

end

endmodule
