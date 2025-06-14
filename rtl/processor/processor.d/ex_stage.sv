`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module ex_stage(
	input	logic			clk,
	input	logic			rst,

	input	logic	[31:0]	RF_rs1_data,
	input	logic	[31:0]	RF_rs2_data,
	input	logic	[31:0]	ID_EX_pc,
	input	logic	[31:0]	ID_EX_imm,
	input	logic	[9:0]	ID_EX_mux_sel,
	input	logic	[3:0]	ID_EX_br_ctrl,
	input	logic	[4:0]	ID_EX_alu_func,
	input	logic			ID_EX_vld,
	input 	logic	[31:0]	MEM_data,
	input 	logic	[31:0]	WB_data,

	output	logic	[31:0]	EX_mem_din,
	output	logic	[31:0]	EX_alu_res,
	output	logic			EX_vld,
	output	logic	[31:0]	EX_br_pc,
	output	logic			EX_take_br,
	output	logic			EX_alu_busy
);

// Forwarded data
logic [31:0] rs1_data, rs2_data;
always_comb begin
	case(ID_EX_mux_sel[5:3])
		`F1:		rs1_data = MEM_data;
		`F2:		rs1_data = WB_data;
		default:	rs1_data = RF_rs1_data;
	endcase
	case(ID_EX_mux_sel[2:0])
		`F1:		rs2_data = MEM_data;
		`F2:		rs2_data = WB_data;
		default:	rs2_data = RF_rs2_data;
	endcase
end

// Operand selection
logic [31:0] opa, opb;
always_comb begin
	case(ID_EX_mux_sel[9:8])
		`SEL_RS:	opa = rs1_data;
		`SEL_PC:	opa = ID_EX_pc;
		default:	opa = 32'h0000_0000;
	endcase
	case(ID_EX_mux_sel[7:6])
		`SEL_RS:	opb = rs2_data;
		`SEL_IMM:	opb = ID_EX_imm;
		default:	opb = 32'h0000_0004;
	endcase
end

assign EX_mem_din = rs2_data;

// New input detection
logic [4:0] prev_func;
logic [31:0] prev_opa, prev_opb;

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

// Multiplier
logic signed [65:0] mult_res;
multipler multipler_0(
	.opa			(opa),
	.opb			(opb),
	.ID_EX_alu_func	(ID_EX_alu_func),
	.mult_res		(mult_res)
);

// Divider
logic divider_busy;
logic [31:0] quotient, remainder;
divider divider_0(
	.clk			(clk),
	.rst			(rst),
	.opa			(opa),
	.opb			(opb),
	.ID_EX_alu_func	(ID_EX_alu_func),
	.quotient		(quotient),
	.remainder		(remainder),
	.divider_busy	(divider_busy)
);

// FPU
logic [31:0] fpu_res;
logic fpu_busy;
fpu fpu_0(
	.clk			(clk),
	.rst			(rst),
	.opa			(opa),
	.opb			(opb),
	.mult_res		(mult_res[47:0]),
	.alu_func		(ID_EX_alu_func),
	.rm				(ID_EX_imm[2:0]),
	.new_input		(new_input),
	.fpu_res		(fpu_res),
	.fpu_busy		(fpu_busy)
);

assign EX_alu_busy = divider_busy||fpu_busy;

// ALU block
always_comb begin
	EX_alu_res = 32'hbaadbeef;
	EX_vld = ID_EX_vld;
	case (ID_EX_alu_func)
		`ALU_ADD:		EX_alu_res = opa + opb;
		`ALU_SUB:		EX_alu_res = opa - opb;
		`ALU_XOR:		EX_alu_res = opa ^ opb;
		`ALU_OR:		EX_alu_res = opa | opb;
		`ALU_AND:		EX_alu_res = opa & opb;
		`ALU_SLL:		EX_alu_res = opa << opb[4:0];
		`ALU_SRL:		EX_alu_res = opa >> opb[4:0];
		`ALU_SRA:		EX_alu_res = $signed(opa) >>> opb[4:0]; 
		`ALU_SLT:		EX_alu_res = {31'h0, ($signed(opa)< $signed(opb))};
		`ALU_SLTU:		EX_alu_res = {31'h0, (opa < opb)};
		`ALU_MUL:		EX_alu_res = mult_res[31:0];
		`ALU_MULH:		EX_alu_res = mult_res[63:32];
		`ALU_MULHSU:	EX_alu_res = mult_res[63:32];
		`ALU_MULHU:		EX_alu_res = mult_res[63:32];
		`ALU_DIV:		EX_alu_res = quotient;
		`ALU_DIVU:		EX_alu_res = quotient;
		`ALU_REM:		EX_alu_res = remainder;
		`ALU_REMU:		EX_alu_res = remainder;
		`ALU_FCVTSW:	EX_alu_res = fpu_res;
		`ALU_FCVTSWU:	EX_alu_res = fpu_res;
		`ALU_FCVTWS:	EX_alu_res = fpu_res;
		`ALU_FCVTWUS:	EX_alu_res = fpu_res;
		`ALU_FMULS:		EX_alu_res = fpu_res;
		`ALU_FADDS:		EX_alu_res = fpu_res;
		`ALU_FSUBS:		EX_alu_res = fpu_res;
		default:		EX_vld = `FALSE;
	endcase
end

// Branch control
always_comb begin

	case(ID_EX_br_ctrl[2:0])
		`BEQ_INST, `BNE_INST:							EX_take_br = ~((|EX_alu_res)^(ID_EX_br_ctrl[0]));
		`BLT_INST, `BGE_INST, `BLTU_INST, `BGEU_INST:	EX_take_br = (EX_alu_res[0])^(ID_EX_br_ctrl[0]);
		`UNC_BRANCH:									EX_take_br = `TRUE;
		default:										EX_take_br = `FALSE;
	endcase

	if (~EX_vld)	EX_take_br = `FALSE;

	if (ID_EX_br_ctrl[3])
		EX_br_pc = (rs1_data + ID_EX_imm)&(~(32'h1));
	else
		EX_br_pc = ID_EX_pc + ID_EX_imm;

end

endmodule
