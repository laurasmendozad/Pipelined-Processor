`timescale 1ns / 1ps
module MUX3X1B(
    input [31:0]RD2E,
    input [31:0]ResultW,
	input [31:0] ALUResultM,
	input [1:0]ForwardBE,
	output reg [31:0] WriteDataE
	);
	
always @(*)
    case (ForwardBE)
        2'd0: WriteDataE = RD2E;
        2'd1: WriteDataE = ResultW;
        2'd2: WriteDataE = ALUResultM;
        default: WriteDataE = 32'd0;
    endcase

endmodule