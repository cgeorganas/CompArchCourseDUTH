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

logic [31:0] int2flt_input, int2flt_output;
assign int2flt_output[31] = (ID_EX_alu_func==`ALU_FCVTSW)&&opa[31];
assign int2flt_input = int2flt_output[31] ? -opa : opa;

logic [4:0] int2flt_input_msb;
always_comb begin
	int2flt_input_msb = 5'h0;
	for (int i=0; i<32; i++) begin
		if (int2flt_input[i]) int2flt_input_msb = i;
	end
end

logic [31:0] int2flt_mantissa;
assign int2flt_mantissa = int2flt_input << (32-int2flt_input_msb);

assign int2flt_output[30:23] = int2flt_input_msb + 127;
assign int2flt_output[22:0] = int2flt_mantissa[31:9];

assign fpu_res = (opa==32'h0) ? 32'h0 : int2flt_output;
assign fpu_busy = `FALSE;

endmodule
