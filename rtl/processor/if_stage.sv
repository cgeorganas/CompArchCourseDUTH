`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module if_stage(
	input	logic			clk,
	input	logic			rst,

	input	logic	[31:0]	IF_ID_pc,
	input	logic	[31:0]	IM_inst,
	input	logic	[31:0]	EX_br_pc,
	input	logic			EX_take_br,
	input	logic			ST_br_stall,

	output	logic	[31:0]	IF_pc,
	output	logic	[31:0]	IF_inst,
	output	logic			IF_vld
);

always_comb begin

	if (EX_take_br) begin
		IF_pc = EX_br_pc;
	end
	else begin
		IF_pc = ST_br_stall ? IF_ID_pc : (IF_ID_pc + 4);
	end

	IF_pc = {IF_pc[31:2], 2'b00};

end

assign IF_inst = ST_br_stall ? `NOOP_INST : IM_inst;
assign IF_vld = ST_br_stall ? `FALSE : `TRUE;

endmodule
