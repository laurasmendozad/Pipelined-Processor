`timescale 1ns / 1ps
module MUX3X1A(
    input [31:0]RD1E,
    input [31:0]ResultW,
	input [31:0] ALUResultM,
	input [1:0]ForwardAE,
	output reg [31:0] SrcAE
	);
	
always @(*)
    case (ForwardAE)
        2'd0: SrcAE = RD1E;
        2'd1: SrcAE = ResultW;
        2'd2: SrcAE = ALUResultM;
        default: SrcAE = 32'd0;
    endcase

endmodule
