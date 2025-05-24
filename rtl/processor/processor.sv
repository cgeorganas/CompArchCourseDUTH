`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module processor(
	input	logic			clk,
	input	logic			rst,

	//Outputs from IM
	input	logic	[31:0]	IM_inst,

	//Outputs from IM
	input	logic	[31:0]	DM_mem_dout,

	// Outputs from IF stage
	output	logic	[31:0]	IF_pc,

	// Outputs from MEM stage
	output	logic	[31:0]	MEM_mem_addr,
	output	logic	[3:0]	MEM_mem_cmd,
	output	logic	[31:0]	MEM_mem_din
);



// Outputs from IF stage
// logic	[31:0]	IF_pc;
logic	[31:0]	IF_inst;
logic			IF_vld;



// Outputs from IF/ID pipeline register
logic	[31:0]	IF_ID_pc;
logic	[31:0]	IF_ID_inst;
logic			IF_ID_vld;



// Outputs from ID stage
logic	[4:0]	ID_rs1;
logic	[4:0]	ID_rs2;
logic	[31:0]	ID_pc;
logic	[31:0]	ID_imm;
logic	[12:0]	ID_mux_sel;
logic	[4:0]	ID_alu_func;
logic			ID_vld;

logic	[3:0]	ID_mem_cmd;
logic	[4:0]	ID_rd;



// Outputs from ID/EX pipeline register
logic	[4:0]	ID_EX_rs1;
logic	[4:0]	ID_EX_rs2;
logic	[31:0]	ID_EX_pc;
logic	[31:0]	ID_EX_imm;
logic	[12:0]	ID_EX_mux_sel;
logic	[4:0]	ID_EX_alu_func;
logic			ID_EX_vld;

logic	[3:0]	ID_EX_mem_cmd;
logic	[4:0]	ID_EX_rd;



// Outputs from EX stage
logic	[31:0]	EX_mem_din;
logic	[31:0]	EX_alu_res;
logic			EX_vld;
logic	[31:0]	EX_br_pc;
logic			EX_take_br;


// Outputs from EX/MEM pipeline register
logic	[31:0]	EX_MEM_mem_din;
logic	[31:0]	EX_MEM_alu_res;
logic			EX_MEM_vld;

logic	[3:0]	EX_MEM_mem_cmd;
logic	[4:0]	EX_MEM_rd;



// Outputs from MEM stage
// logic	[3:0]	MEM_mem_cmd;
// logic	[31:0]	MEM_mem_addr;
// logic	[31:0]	MEM_mem_din;

logic	[31:0]	MEM_data;
logic			MEM_vld;



// Outputs from MEM/WB pipeline register
logic	[31:0]	MEM_WB_data;
logic			MEM_WB_vld;

logic	[4:0]	MEM_WB_rd;



// Outputs from WB stage
logic	[31:0]	WB_data;
logic	[4:0]	WB_rd;



// Outputs from RF
logic	[31:0]	RF_rs1_data;
logic	[31:0]	RF_rs2_data;



// Outputs from stalling module
logic			ST_if_id_en;
logic			ST_id_ex_en;
logic			ST_ex_mem_en;
logic			ST_mem_wb_en;
logic			ST_br_stall;



// IF stage
if_stage if_stage_0(
	.clk				(clk),
	.rst				(rst),

	.IF_ID_pc			(IF_ID_pc),
	.IM_inst			(IM_inst),
	.EX_br_pc			(EX_br_pc),
	.EX_take_br			(EX_take_br),
	.ST_br_stall		(ST_br_stall),

	.IF_pc				(IF_pc),
	.IF_inst			(IF_inst),
	.IF_vld				(IF_vld)
);



// IF/ID pipeline register
always_ff @(posedge clk or posedge rst) begin
	if (rst) begin
		IF_ID_pc		<= 32'hFFFF_FFFC;
		IF_ID_inst		<= `NOOP_INST;
		IF_ID_vld		<= `FALSE;
	end
	else if (ST_if_id_en) begin
		IF_ID_pc		<= IF_pc;
		IF_ID_inst		<= IF_inst;
		IF_ID_vld		<= IF_vld;
	end
end



// ID stage
id_stage id_stage_0(
	.clk				(clk),
	.rst				(rst),

	.IF_ID_pc			(IF_ID_pc),
	.IF_ID_inst			(IF_ID_inst),
	.IF_ID_vld			(IF_ID_vld),
	.ID_EX_rd			(ID_EX_rd),
	.EX_MEM_rd			(EX_MEM_rd),

	.ID_rs1				(ID_rs1),
	.ID_rs2				(ID_rs2),
	.ID_pc				(ID_pc),
	.ID_imm				(ID_imm),
	.ID_mux_sel			(ID_mux_sel),
	.ID_alu_func		(ID_alu_func),
	.ID_vld				(ID_vld),
	.ID_mem_cmd			(ID_mem_cmd),
	.ID_rd				(ID_rd)
);



// ID/EX pipeline register
always_ff @(posedge clk or posedge rst) begin
	if (rst) begin
		ID_EX_rs1		<= 5'h0;
		ID_EX_rs2		<= 5'h0;
		ID_EX_pc		<= 32'h0;
		ID_EX_imm		<= 32'h0;
		ID_EX_mux_sel	<= {`DONT_BRANCH, `SEL_CONST, `SEL_CONST, `F0, `F0};
		ID_EX_alu_func	<= `ALU_ADD;
		ID_EX_vld		<= `FALSE;
		ID_EX_mem_cmd	<= `MEM_NONE;
		ID_EX_rd		<= `ZERO_REG;
	end
	else if (ST_id_ex_en) begin
		ID_EX_rs1		<= ID_rs1;
		ID_EX_rs2		<= ID_rs2;
		ID_EX_pc		<= ID_pc;
		ID_EX_imm		<= ID_imm;
		ID_EX_mux_sel	<= ID_mux_sel;
		ID_EX_alu_func	<= ID_alu_func;
		ID_EX_vld		<= ID_vld;
		ID_EX_mem_cmd	<= ID_mem_cmd;
		ID_EX_rd		<= ID_rd;
	end
end



// EX stage
ex_stage ex_stage_0(
	.clk				(clk),
	.rst				(rst),

	.RF_rs1_data		(RF_rs1_data),
	.RF_rs2_data		(RF_rs2_data),
	.ID_EX_pc			(ID_EX_pc),
	.ID_EX_imm			(ID_EX_imm),
	.ID_EX_mux_sel		(ID_EX_mux_sel),
	.ID_EX_alu_func		(ID_EX_alu_func),
	.ID_EX_vld			(ID_EX_vld),
	.MEM_data			(MEM_data),
	.WB_data			(WB_data),

	.EX_mem_din			(EX_mem_din),
	.EX_alu_res			(EX_alu_res),
	.EX_vld				(EX_vld),
	.EX_br_pc			(EX_br_pc),
	.EX_take_br			(EX_take_br)
);



// EX/MEM pipeline register
always_ff @(posedge clk or posedge rst) begin
	if (rst) begin
		EX_MEM_mem_din	<= 32'h0;
		EX_MEM_alu_res	<= 32'h0;
		EX_MEM_vld		<= `FALSE;
		EX_MEM_mem_cmd	<=`MEM_NONE;
		EX_MEM_rd		<= `ZERO_REG;
	end
	else if (ST_ex_mem_en) begin
		EX_MEM_mem_din	<= EX_mem_din;
		EX_MEM_alu_res	<= EX_alu_res;
		EX_MEM_vld		<= EX_vld;
		EX_MEM_mem_cmd	<= ID_EX_mem_cmd;
		EX_MEM_rd		<= ID_EX_rd;
	end
end



// MEM stage
mem_stage mem_stage_0(
	.clk				(clk),
	.rst				(rst),

	.EX_MEM_mem_din		(EX_MEM_mem_din),
	.EX_MEM_alu_res		(EX_MEM_alu_res),
	.EX_MEM_vld			(EX_MEM_vld),
	.EX_MEM_mem_cmd		(EX_MEM_mem_cmd),

	.DM_mem_dout		(DM_mem_dout),
	.MEM_mem_cmd		(MEM_mem_cmd),
	.MEM_mem_addr		(MEM_mem_addr),
	.MEM_mem_din		(MEM_mem_din),

	.MEM_data		(MEM_data),
	.MEM_vld			(MEM_vld)
);



// MEM/WB pipeline register
always_ff @(posedge clk or posedge rst) begin
	if (rst) begin
		MEM_WB_data		<= 32'h0;
		MEM_WB_vld		<= `FALSE;
		MEM_WB_rd		<= `ZERO_REG;
	end
	else if (ST_mem_wb_en) begin
		MEM_WB_data		<= MEM_data;
		MEM_WB_vld		<= MEM_vld;
		MEM_WB_rd		<= EX_MEM_rd;
	end
end



// WB stage
wb_stage wb_stage_0(
	.clk				(clk),
	.rst				(rst),

	.MEM_WB_data		(MEM_WB_data),
	.MEM_WB_vld			(MEM_WB_vld),
	.MEM_WB_rd			(MEM_WB_rd),

	.WB_data			(WB_data),
	.WB_rd				(WB_rd)
);



// Register file
register_file register_file_0(
	.clk				(clk),
	.rst				(rst),

	.WB_data			(WB_data),
	.WB_rd				(WB_rd),
	.ID_EX_rs1			(ID_EX_rs1),
	.ID_EX_rs2			(ID_EX_rs2),

	.RF_rs1_data		(RF_rs1_data),
	.RF_rs2_data		(RF_rs2_data)
);



// Stalling module
stall stall_0(
	.clk				(clk),
	.rst				(rst),

	.ID_mux_sel			(ID_mux_sel),

	.ST_if_id_en		(ST_if_id_en),
	.ST_id_ex_en		(ST_id_ex_en),
	.ST_ex_mem_en		(ST_ex_mem_en),
	.ST_mem_wb_en		(ST_mem_wb_en),
	.ST_br_stall		(ST_br_stall)
);

endmodule
