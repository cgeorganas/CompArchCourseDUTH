`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module register_file(
	input	logic			clk,
	input	logic			rst,

	input	logic	[31:0]	WB_data,
	input	logic	[5:0]	WB_rd,
	input	logic	[5:0]	ID_EX_rs1,
	input	logic	[5:0]	ID_EX_rs2,

	output	logic	[31:0]	RF_rs1_data,
	output	logic	[31:0]	RF_rs2_data
);

logic [31:0] registers [0:63];

assign RF_rs1_data = registers[ID_EX_rs1];
assign RF_rs2_data = registers[ID_EX_rs2];

always_ff @(posedge clk or posedge rst) begin
	if (rst) begin
		for(int i=0;i<64;i++) begin
			registers[i]<=32'h0;
		end
	end
	else if (WB_rd!=`ZERO_REG) begin
		registers[WB_rd] <= WB_data;
	end
end

endmodule
