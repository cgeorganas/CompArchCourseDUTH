`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module processor_tb;

logic			clk;
logic			rst;

logic	[31:0]	IM_inst;
logic	[31:0]	DM_mem_dout;
logic	[31:0]	IF_pc;
logic	[31:0]	MEM_mem_addr;
logic	[3:0]	MEM_mem_cmd;
logic	[31:0]	MEM_mem_din;

processor processor_0(
	.clk			(clk),
	.rst			(rst),
	.IM_inst		(IM_inst),
	.DM_mem_dout	(DM_mem_dout),
	.IF_pc			(IF_pc),
	.MEM_mem_addr	(MEM_mem_addr),
	.MEM_mem_cmd	(MEM_mem_cmd),
	.MEM_mem_din	(MEM_mem_din)
);

logic	[31:0]	TB_im_din;
assign	TB_im_din=32'h0;

logic	[3:0]	TB_im_mem_cmd;
assign	TB_im_mem_cmd=`MEM_LW;

logic	[3:0]	TB_im_mem2proc_response;
logic	[3:0]	TB_im_mem2proc_tag;

inst_mem inst_mem_0(
	.clk				(clk),
	.proc2mem_addr		(IF_pc),
	.proc2mem_data		(TB_im_din),
	.proc2mem_command	(TB_im_mem_cmd),

	.mem2proc_response	(TB_im_mem2proc_response),
	.mem2proc_data		(IM_inst),
	.mem2proc_tag		(TB_im_mem2proc_tag)
);

data_mem data_mem_0(
	.clk				(clk),
	.rst				(rst),

	.MEM_mem_addr		(MEM_mem_addr),
	.MEM_mem_din		(MEM_mem_din),
	.MEM_mem_cmd			(MEM_mem_cmd),

	.DM_mem_dout		(DM_mem_dout)
);

initial begin
	clk=0;
	forever #5 clk=~clk;
end

initial begin
	$readmemh("testshex.txt",inst_mem_0.unified_memory);
	// $readmemh("testshex.txt",DM.unified_memory);
end

initial begin
	rst=1;
	@(posedge clk);
	rst=0;
	for(int i=0;i<50000;i++) begin
		@(posedge clk);
	end
	$stop;
end


endmodule
