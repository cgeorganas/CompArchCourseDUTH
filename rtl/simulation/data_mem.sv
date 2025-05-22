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

logic [29:0] addr;
assign addr = MEM_mem_addr[31:2];

logic [31:0] memory [(`MEM_32BIT_LINES-1):0];

always_ff @(posedge clk or posedge rst) begin
	if (rst) begin
		for (int i=0; i < `MEM_32BIT_LINES; i++) begin
			memory[i] <= 32'h0000_0000;
		end
	end
	else begin
		case (MEM_mem_cmd)
			`MEM_SW: 			memory[addr][31:0]	<= MEM_mem_din[31:0];
			`MEM_SH: begin
				case(MEM_mem_addr[1])
					1'b1:		memory[addr][31:16]	<= MEM_mem_din[15:0];
					1'b0:		memory[addr][15:0]	<= MEM_mem_din[15:0];
				endcase
			end
			`MEM_SB: begin
				case(MEM_mem_addr[1:0])
					2'b11:		memory[addr][31:24]	<= MEM_mem_din[7:0];
					2'b10:		memory[addr][23:16]	<= MEM_mem_din[7:0];
					2'b01:		memory[addr][15:8]	<= MEM_mem_din[7:0];
					2'b00:		memory[addr][7:0]	<= MEM_mem_din[7:0];
				endcase
			end
		endcase
	end
end

assign DM_mem_dout = memory[addr];

endmodule
