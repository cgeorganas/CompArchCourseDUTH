`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

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

logic [31:0]	int2flt_output;
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

	int2flt_output = {int2flt_sign, int2flt_exponent, int2flt_mantissa[30:8]};

	if (opa==32'h0)	int2flt_output = 32'h0;
end

assign fpu_res = int2flt_output;
assign fpu_busy = `FALSE;

endmodule
