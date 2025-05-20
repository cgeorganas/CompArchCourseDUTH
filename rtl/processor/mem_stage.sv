`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module mem_stage(
	input	logic			clk,
	input	logic			rst,

	input	logic	[31:0]	DM_mem_dout,
	input	logic	[31:0]	EX_MEM_alu_res,
	input	logic			EX_MEM_vld,
	input	logic	[31:0]	EX_MEM_mem_din,
	input	logic	[1:0]	EX_MEM_mem_cmd,

	output	logic	[31:0]	MEM_mem_addr,
	output	logic	[1:0]	MEM_mem_cmd,
	output	logic	[31:0]	MEM_mem_din,
	output	logic	[31:0]	MEM_alu_res,
	output	logic	[31:0]	MEM_mem_dout,
	output	logic	[1:0]	MEM_wb_sel,
	output	logic			MEM_vld
);

always_comb begin

	MEM_mem_addr	= 32'h0000_0000;
	MEM_mem_cmd		= `BUS_NONE;
	MEM_mem_din		= 32'h0000_0000;
	MEM_alu_res		= 32'h0000_0000;
	MEM_mem_dout	= 32'h0000_0000;
	MEM_wb_sel		= `WB_SEL_NONE;
	MEM_vld			= EX_MEM_vld;

	if (EX_MEM_vld) begin
		case (EX_MEM_mem_cmd)
			`BUS_NONE: begin
				MEM_alu_res		= EX_MEM_alu_res;
				MEM_wb_sel		= `WB_SEL_ALU;
			end
			`BUS_LOAD: begin
				MEM_mem_addr	= EX_MEM_alu_res;
				MEM_mem_cmd		= `BUS_LOAD;
				MEM_alu_res		= EX_MEM_alu_res;
				MEM_mem_dout	= DM_mem_dout;
				MEM_wb_sel		= `WB_SEL_DOUT;
			end
			`BUS_STORE: begin
				MEM_mem_addr	= EX_MEM_alu_res;
				MEM_mem_cmd		= `BUS_STORE;
				MEM_mem_din		= EX_MEM_mem_din;
				MEM_alu_res		= EX_MEM_alu_res;
				MEM_wb_sel		= `WB_SEL_ALU;
			end
			default: MEM_vld = `FALSE;
		endcase
	end

end

endmodule
