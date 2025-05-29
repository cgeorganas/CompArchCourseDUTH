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

logic [39:0]	fpu_longres;
assign fpu_longres = int2flt_output;

logic			fpu_longres_sign;
logic [7:0]		fpu_longres_exponent;
logic [22:0]	fpu_longres_mantissa;

logic guard, round, sticky;
assign guard = fpu_longres[7];
assign round = fpu_longres[6];
assign sticky = |fpu_longres[5:0];

always_comb begin

	fpu_longres_sign		= fpu_longres[39];
	fpu_longres_exponent	= fpu_longres[38:31];
	fpu_longres_mantissa	= fpu_longres[30:8];

	casez ({fpu_longres_sign, flt_rm})

			{`FALSE, `RUP}, {`TRUE, `RDN}: begin
				if (guard||round||sticky) begin
					fpu_longres_mantissa = fpu_longres_mantissa + 1;
					if (fpu_longres_mantissa==23'h0) fpu_longres_exponent = fpu_longres_exponent + 1;
				end
			end

			{1'b?, `RMM}: begin
				if (guard) begin
					fpu_longres_mantissa = fpu_longres_mantissa + 1;
					if (fpu_longres_mantissa==23'h0) fpu_longres_exponent = fpu_longres_exponent + 1;
				end
			end

	endcase

end

assign fpu_res = {fpu_longres_sign, fpu_longres_exponent, fpu_longres_mantissa};

assign fpu_busy = `FALSE;

endmodule
