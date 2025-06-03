`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module fpu(
	input	logic			clk,
	input	logic			rst,
	input	logic	[31:0]	opa,
	input	logic	[31:0]	opb,
	input	logic	[47:0]	mult_res,
	input	logic	[4:0]	alu_func,
	input	logic	[2:0]	rm,
	input	logic			new_input,
	output	logic	[31:0]	fpu_res,
	output	logic			fpu_busy
);

// ZERO FLAG
logic			z_fl_a, z_fl_b, z_fl;
assign			z_fl_a		= ~(|opa[30:0]);
assign			z_fl_b		= ~(|opb[30:0]);
assign			z_fl		= z_fl_a||z_fl_b;

// SUBNORMAL FLAG
logic			subn_fl_a, subn_fl_b, subn_fl;
assign			subn_fl_a	= (~(|opa[30:23]))&&(|opa[22:0]);
assign			subn_fl_b	= (~(|opb[30:23]))&&(|opb[22:0]);
assign			subn_fl		= subn_fl_a||subn_fl_b;

// INF FLAG
logic			inf_fl_a, inf_fl_b, one_inf_fl, two_inf_fl, inf_fl;
assign			inf_fl_a	= (&opa[30:23])&&(~(|opa[22:0]));
assign			inf_fl_b	= (&opb[30:23])&&(~(|opb[22:0]));
assign			one_inf_fl	= inf_fl_a^inf_fl_b;
assign			two_inf_fl	= inf_fl_a&&inf_fl_b;
assign			inf_fl		= inf_fl_a||inf_fl_b;

// NAN FLAG
logic			nan_fl_a, nan_fl_b, nan_fl;
assign			nan_fl_a = (&opa[30:23])&&(|opa[22:0]);
assign			nan_fl_b = (&opb[30:23])&&(|opb[22:0]);
assign			nan_fl = nan_fl_a||nan_fl_b;

logic [34:0] int2flt_out;
fpu_int2flt fpu_int2flt_0(
	.in				(opa),
	.signed_input	(alu_func==`ALU_FCVTSW),
	.out			(int2flt_out)
);

logic mult_busy;
logic [34:0] mult_out;
fpu_mult fpu_mult_0(
	.clk			(clk),
	.rst			(rst),
	.opa			(opa),
	.opb			(opb),
	.mult_res		(mult_res),
	.new_input		(new_input),
	.z_fl			(z_fl),
	.subn_fl_a		(subn_fl_a),
	.subn_fl_b		(subn_fl_b),
	.inf_fl			(inf_fl),
	.nan_fl			(nan_fl),
	.out			(mult_out),
	.busy			(mult_busy)
);

logic add_busy;
logic [34:0] add_out;
fpu_add fpu_add_0(
	.clk			(clk),
	.rst			(rst),
	.opa_in			(opa),
	.opb_in			(opb),
	.fsub			(alu_func==`ALU_FSUBS),
	.new_input		(new_input),
	.z_fl			(z_fl),
	.one_inf_fl		(one_inf_fl),
	.two_inf_fl		(two_inf_fl),
	.nan_fl			(nan_fl),
	.out			(add_out),
	.busy			(add_busy)
);

logic [34:0] round_in;
always_comb begin
	case (alu_func)
		`ALU_FMULS:	round_in = mult_out;
		`ALU_FADDS:	round_in = add_out;
		`ALU_FSUBS:	round_in = add_out;
		default:	round_in = int2flt_out;
	endcase
end

logic [31:0] round_out;
fpu_round fpu_round_0 (
	.in				(round_in),
	.rm				(rm),
	.out			(round_out)
);

logic [31:0] flt2int_out;
fpu_flt2int fpu_flt2int_0(
	.in				(opa),
	.rm				(rm),
	.signed_output	(alu_func==`ALU_FCVTWS),
	.out			(flt2int_out)
);

always_comb begin

	case (alu_func)
		`ALU_FCVTWS:	fpu_res = flt2int_out;
		`ALU_FCVTWUS:	fpu_res = flt2int_out;
		default:		fpu_res = round_out;
	endcase

	case (alu_func)
		`ALU_FMULS:		fpu_busy = mult_busy;
		`ALU_FADDS:		fpu_busy = add_busy;
		`ALU_FSUBS:		fpu_busy = add_busy;
		default:		fpu_busy = `FALSE;
	endcase
	
end


endmodule
