`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module data_mem(
	input	logic			clk,
	input	logic			rst,

	input	logic	[3:0]	MEM_mem_cmd,
	input	logic	[31:0]	MEM_mem_addr,
	input	logic	[31:0]	MEM_mem_din,

	output	logic	[31:0]	DM_mem_dout
);

logic [31:0] b_addr, h_addr, w_addr;
assign b_addr = MEM_mem_addr;
assign h_addr = {MEM_mem_addr[31:1], 1'b0};
assign w_addr = {MEM_mem_addr[31:2], 2'b0};

logic [31:0] memory [0:(`MEM_32BIT_LINES-1)];

always_ff @(posedge clk or posedge rst) begin
	if (rst) begin
		for (int i=0; i < `MEM_32BIT_LINES; i++) begin
			memory[i] <= 32'h0000_0000;
		end
	end
	else begin
		case (MEM_mem_cmd)
			`MEM_SB:	memory[b_addr][7:0]		<= MEM_mem_din[7:0];
			`MEM_SH:	memory[h_addr][15:0]	<= MEM_mem_din[15:0];
			`MEM_SW:	memory[w_addr]			<= MEM_mem_din;
		endcase
	end
end

assign DM_mem_dout = memory[MEM_mem_din];

endmodule
