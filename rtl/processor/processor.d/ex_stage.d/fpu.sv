`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module fpu(
	input	logic			clk,
	input	logic			rst,
	input	logic	[31:0]	opa,
	input	logic	[31:0]	opb,
	input	logic	[47:0]	mult_result,
	input	logic	[4:0]	ID_EX_alu_func,
	input	logic	[2:0]	rm,
	output	logic	[31:0]	fpu_res,
	output	logic			fpu_busy
);

logic [31:0] prev_opa, prev_opb;
logic [4:0] prev_func;

always_ff @(posedge clk) begin
	if (rst) begin
		prev_opa <= 32'h0;
		prev_opb <= 32'h0;
		prev_func <= `ALU_ADD;
	end
	else begin
		prev_opa <= opa;
		prev_opb <= opb;
		prev_func <= ID_EX_alu_func;
	end
end

logic new_input;
assign new_input = (prev_opa!=opa)||(prev_opb!=opb)||(prev_func!=ID_EX_alu_func);

logic [34:0] fpu_int2flt;
fpu_int2flt fpu_int2flt_0(
	.in				(opa),
	.signed_input	(ID_EX_alu_func==`ALU_FCVTSW),
	.out			(fpu_int2flt)
);

logic [31:0] fpu_flt2int;
fpu_flt2int fpu_flt2int_0(
	.in				(opa),
	.rm				(rm),
	.signed_output	(ID_EX_alu_func==`ALU_FCVTWS),
	.out			(fpu_flt2int)
);

logic [34:0] fpu_mult;
logic fpu_mult_busy;
fpu_mult fpu_mult_0(
	.clk			(clk),
	.rst			(rst),
	.opa			(opa),
	.opb			(opb),
	.mult_result	(mult_result[47:0]),
	.new_input		(new_input),
	.out			(fpu_mult),
	.fpu_mult_busy	(fpu_mult_busy)
);

logic [34:0] fpu_add;
fpu_add fpu_add_0(
	.clk			(clk),
	.rst			(rst),
	.opa_in			(opa),
	.opb_in			(opb),
	.fsub			(ID_EX_alu_func==`ALU_FSUBS),
	.new_input		(new_input),
	.out			(fpu_add),
	.fpu_add_busy	(fpu_add_busy)
);

logic [34:0] fpu_res_raw;
always_comb begin
	case (ID_EX_alu_func)
		`ALU_FMULS:	fpu_res_raw = fpu_mult;
		`ALU_FADDS:	fpu_res_raw = fpu_add;
		`ALU_FSUBS:	fpu_res_raw = fpu_add;
		default:	fpu_res_raw = fpu_int2flt;
	endcase
end
logic [31:0] fpu_res_rounded;
fpu_round fpu_round_0 (
	.in				(fpu_res_raw),
	.rm				(rm),
	.out			(fpu_res_rounded)
);

always_comb begin
	case (ID_EX_alu_func)
		`ALU_FCVTWS, `ALU_FCVTWUS:	fpu_res = fpu_flt2int;
		default:					fpu_res = fpu_res_rounded;
	endcase
end

assign fpu_busy = (fpu_mult_busy&&(ID_EX_alu_func==`ALU_FMULS))||(fpu_add_busy&&((ID_EX_alu_func==`ALU_FADDS)||(ID_EX_alu_func==`ALU_FSUBS)));

endmodule
