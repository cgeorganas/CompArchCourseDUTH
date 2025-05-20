`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module mem_stage(
	input	logic			clk,
	input	logic			rst,

	input	logic	[31:0]	EX_MEM_mem_din,
	input	logic	[31:0]	EX_MEM_alu_res,
	input	logic			EX_MEM_vld,
	input	logic	[1:0]	EX_MEM_mem_cmd,

	output	logic	[1:0]	MEM_mem_cmd,
	output	logic	[31:0]	MEM_mem_addr,
	output	logic	[31:0]	MEM_mem_din,
	output	logic	[31:0]	MEM_alu_res,
	output	logic	[1:0]	MEM_wb_sel,
	output	logic			MEM_vld
);

assign MEM_vld = (EX_MEM_vld)&&(EX_MEM_mem_cmd!=`BUS_NA);

assign MEM_mem_cmd = MEM_vld ? EX_MEM_mem_cmd : `BUS_NONE;
assign MEM_mem_addr = EX_MEM_alu_res;
assign MEM_mem_din = EX_MEM_mem_din;

assign MEM_alu_res = EX_MEM_alu_res;

always_comb begin
	MEM_wb_sel = `WB_SEL_NONE;
	if (MEM_vld) begin
		case (MEM_mem_cmd)
			`BUS_NONE:	MEM_wb_sel = `WB_SEL_ALU;
			`BUS_LOAD:	MEM_wb_sel = `WB_SEL_DOUT;
		endcase
	end
end

endmodule
