`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module fpu(
	input	logic	[31:0]	opa,
	input	logic	[31:0]	opb,
	input	logic	[47:0]	mult_result,
	input	logic	[4:0]	ID_EX_alu_func,
	input	logic	[2:0]	rm,
	output	logic	[31:0]	fpu_res
);

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
fpu_mult fpu_mult_0(
	.opa			(opa),
	.opb			(opb),
	.mult_result	(mult_result[47:0]),
	.out			(fpu_mult)
);

logic [34:0] fpu_res_raw;
always_comb begin
	case (ID_EX_alu_func)
		`ALU_FMULS:	fpu_res_raw = fpu_mult;
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

endmodule
