`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

`define RNE 3'b000
`define RTZ 3'b001
`define RDN 3'b010
`define RUP 3'b011
`define RMM 3'b100

module fpu_round(
	input	logic	[34:0]	in,
	input	logic	[2:0]	rm,
	output logic	[31:0]	out
);

logic sign, lsb, g, r, s;
assign sign	= in[34];
assign lsb	= in[3];
assign g	= in[2];
assign r	= in[1];
assign s	= in[0];

logic round_up;

always_comb begin
	case (rm)
		`RNE:		round_up = (g&&(r||s))||(g&&(~r)&&(~s)&&lsb);
		`RUP:		round_up = (g||r||s)&&(~sign);
		`RDN:		round_up = (g||r||s)&&(sign);
		`RMM:		round_up = g;
		default:	round_up = `FALSE;
	endcase
end

assign out[31] = sign;
assign out[30:0] = in[33:3] + ((round_up)&&(~(&in[33:26])));

endmodule
