`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

`define RNE 3'b000
`define RTZ 3'b001
`define RDN 3'b010
`define RUP 3'b011
`define RMM 3'b100

module fpu(
	input	logic			clk,
	input	logic			rst,
	input	logic	[31:0]	opa,
	input	logic	[31:0]	opb,
	input	logic	[4:0]	ID_EX_alu_func,
	input	logic	[2:0]	flt_rm,

	output logic	[31:0]	fpu_res,
	output logic			fpu_busy
);

logic [31:0]	int2flt_input;
logic [4:0]		int2flt_msb;

logic [39:0]	int2flt_output;
logic 			int2flt_sign;
logic [7:0]		int2flt_exponent;
logic [30:0]	int2flt_mantissa;

always_comb begin

	int2flt_sign = (ID_EX_alu_func==`ALU_FCVTSW)&&opa[31];
	
	int2flt_input = int2flt_sign ? -opa : opa;

	int2flt_msb = 5'h0;
	for (int i=0; i<32; i++) begin
		if (int2flt_input[i]) int2flt_msb = i;
	end

	int2flt_mantissa = int2flt_input << (31-int2flt_msb);

	int2flt_exponent = int2flt_msb + 127;

	int2flt_output = {int2flt_sign, int2flt_exponent, int2flt_mantissa};

	if (opa==32'h0)	int2flt_output = 40'h0;
end

logic [39:0] fpu_longres;
assign fpu_longres = int2flt_output;

logic			fpu_res_sign;
logic [7:0]		fpu_res_exponent;
logic [22:0]	fpu_res_mantissa;

logic guard, round, sticky;
assign guard = fpu_longres[7];
assign round = fpu_longres[6];
assign sticky = |fpu_longres[5:0];

logic round_up;

always_comb begin

	fpu_res_sign		= fpu_longres[39];
	fpu_res_exponent	= fpu_longres[38:31];
	fpu_res_mantissa	= fpu_longres[30:8];

	round_up = `FALSE;

	case (flt_rm)
		`RNE: round_up = ((guard&&(round||sticky))||(guard&&(~round)&&(~sticky)&&fpu_res_mantissa[0]));
		`RUP: round_up = ((guard||round||sticky)&&(~fpu_res_sign));
		`RDN: round_up = ((guard||round||sticky)&&(fpu_res_sign));
		`RMM: round_up = (guard);
	endcase

	if (round_up) begin
		fpu_res_mantissa = fpu_res_mantissa + 1;
		if (fpu_res_mantissa==23'h0) fpu_res_exponent = fpu_res_exponent + 1;
	end

end

assign fpu_res = {fpu_res_sign, fpu_res_exponent, fpu_res_mantissa};

assign fpu_busy = `FALSE;

endmodule
