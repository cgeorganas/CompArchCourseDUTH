//Size of a word
`define WORD_SIZE				32

//Memory/testbench attribute definitions
`define NUM_MEM_TAGS			8
`define MEM_LATENCY_IN_CYCLES	0

`define MEM_SIZE_IN_BYTES		(32768)
`define MEM_32BIT_LINES			(8192)


//Returns a zero value, and any write to this register is thrown away
`define ZERO_REG				6'h00

//Useful boolean single-bit definitions
`define FALSE					1'b0
`define TRUE					1'b1


//Basic NOOP instruction. Allows pipeline registers to clearly be reset with
//an instruction that does nothing, instead of Zero which is really a PAL_INST.
`define NOOP_INST				32'h00000013

//Instruction types {Opcode}
`define R_TYPE					7'b0110011
`define I_ARITH_TYPE			7'b0010011
`define I_LD_TYPE				7'b0000011
`define I_JAL_TYPE				7'b1100111
`define S_TYPE					7'b0100011
`define B_TYPE					7'b1100011
`define J_TYPE					7'b1101111
`define U_LD_TYPE				7'b0110111
`define U_AUIPC_TYPE			7'b0010111
`define I_BREAK_TYPE			7'b1110011
`define I_LDFLT_TYPE			7'b0000111
`define S_FLT_TYPE				7'b0100111
// `define R4_MADD_TYPE			7'b1000011
// `define R4_MSUB_TYPE			7'b1000111
// `define R4_NMSUB_TYPE			7'b1001011
// `define R4_NMADD_TYPE			7'b1001111
`define R_FLT_TYPE				7'b1010011

//{funct3, funct7}, R_TYPE
`define ADD_INST				{3'h0, 7'h00}
`define SUB_INST				{3'h0, 7'h20}
`define XOR_INST				{3'h4, 7'h00}
`define OR_INST					{3'h6, 7'h00}
`define AND_INST				{3'h7, 7'h00}
`define SLL_INST				{3'h1, 7'h00}
`define SRL_INST				{3'h5, 7'h00}
`define SRA_INST				{3'h5, 7'h20}
`define SLT_INST				{3'h2, 7'h00}
`define SLTU_INST				{3'h3, 7'h00}
`define MUL_INST				{3'h0, 7'h01}
`define MULH_INST				{3'h1, 7'h01}
`define MULHSU_INST				{3'h2, 7'h01}
`define MULHU_INST				{3'h3, 7'h01}
`define DIV_INST				{3'h4, 7'h01}
`define DIVU_INST				{3'h5, 7'h01}
`define REM_INST				{3'h6, 7'h01}
`define REMU_INST				{3'h7, 7'h01}

//{funct3, rs2, funct7}, R_FLT_TYPE
`define FADDS_INST				{3'b???, 5'b?????, 7'b0000000}
`define FSUBS_INST				{3'b???, 5'b?????, 7'b0000100}
`define FMULS_INST				{3'b???, 5'b?????, 7'b0001000}
// `define FDIVS_INST				{3'b???, 5'b?????, 7'b0001100}
// `define FSQRTS_INST				{3'b???, 5'b00000, 7'b0101100}
// `define FSGNJS_INST				{3'b000, 5'b?????, 7'b0010000}
// `define FSGNJNS_INST			{3'b001, 5'b?????, 7'b0010000}
// `define FSGNJXS_INST			{3'b010, 5'b?????, 7'b0010000}
// `define FMINS_INST				{3'b000, 5'b?????, 7'b0010100}
// `define FMAXS_INST				{3'b001, 5'b?????, 7'b0010100}
`define FCVTWS_INST				{3'b???, 5'b00000, 7'b1100000}
`define FCVTWUS_INST			{3'b???, 5'b00001, 7'b1100000}
`define FMVXW_INST				{3'b000, 5'b00000, 7'b1110000}
// `define FEQS_INST				{3'b010, 5'b?????, 7'b1010000}
// `define FLTS_INST				{3'b001, 5'b?????, 7'b1010000}
// `define FLES_INST				{3'b000, 5'b?????, 7'b1010000}
// `define FCLASSS_INST			{3'b001, 5'b00000, 7'b1110000}
`define FCVTSW_INST				{3'b???, 5'b00000, 7'b1101000}
`define FCVTSWU_INST			{3'b???, 5'b00001, 7'b1101000}
`define FMVWX_INST				{3'b000, 5'b00000, 7'b1111000}

//{funct3}, I_TYPE
`define ADDI_INST				3'h0
`define XORI_INST				3'h4
`define ORI_INST				3'h6
`define ANDI_INST				3'h7
`define SLLI_INST				3'h1
`define SRLI_INST				3'h5
`define SRAI_INST				3'h5
`define SLTI_INST				3'h2
`define SLTIU_INST				3'h3
`define JALR_INST				3'h0
`define LB_INST					3'h0
`define LH_INST					3'h1
`define LW_INST					3'h2
`define LBU_INST				3'h4
`define LHU_INST				3'h5

//{funct3}, S_TYPE
`define SB_INST					3'h0
`define SH_INST					3'h1
`define SW_INST					3'h2

//{funct3}, B_TYPE
`define BEQ_INST				3'h0
`define BNE_INST				3'h1
`define DONT_BRANCH				3'h2
`define UNC_BRANCH				3'h3
`define BLT_INST				3'h4
`define BGE_INST				3'h5
`define BLTU_INST				3'h6
`define BGEU_INST				3'h7

//ALU operand selector
`define SEL_RS					2'h0
`define	SEL_IMM					2'h1
`define	SEL_PC					2'h2
`define	SEL_CONST				2'h3

//Forwarding control
`define F0						3'h0
`define F1						3'h1
`define F2						3'h2

// Destination register select
`define DEST_IS_REGC			1'b0
`define	DEST_NONE				1'b1

// ALU function code input
`define	ALU_ADD					5'h00
`define	ALU_SUB					5'h01
`define	ALU_XOR					5'h02
`define	ALU_OR					5'h03
`define	ALU_AND					5'h04
`define	ALU_SLL					5'h05
`define	ALU_SRL					5'h06
`define	ALU_SRA					5'h07
`define	ALU_SLT					5'h08
`define	ALU_SLTU				5'h09
`define ALU_MUL					5'h0a
`define ALU_MULH				5'h0b
`define ALU_MULHSU				5'h0c
`define ALU_MULHU				5'h0d
`define ALU_DIV					5'h0e
`define ALU_DIVU				5'h0f
`define ALU_REM					5'h10
`define ALU_REMU				5'h11
`define ALU_FCVTSW				5'h12
`define ALU_FCVTSWU				5'h13
`define ALU_FCVTWS				5'h14
`define ALU_FCVTWUS				5'h15
`define ALU_FMULS				5'h16
`define ALU_FADDS				5'h17
`define ALU_FSUBS				5'h18

// Memory bus commands control signals
`define MEM_LB					4'b0_000
`define MEM_LH					4'b0_001
`define MEM_LW					4'b0_010
`define MEM_LBU					4'b0_100
`define MEM_LHU					4'b0_101
`define MEM_NONE				4'b0_111
`define MEM_SB					4'b1_000
`define MEM_SH					4'b1_001
`define MEM_SW					4'b1_010
