`timescale 1ns / 1ps
module MUX4X1(
    input [1:0]ResultSrcW,
    input [4:0] PCPlus4W,
	input [31:0] ReadDataW,
	input [31:0] ALUResultW,
	input [31:0] ImmExtW,
	output reg [31:0] ResultW
	);
	
always @(*)
    case (ResultSrcW)
        2'd0: ResultW = ALUResultW;
        2'd1: ResultW = ReadDataW;
        2'd2: ResultW = {27'd0, PCPlus4W};
        2'd3: ResultW = ImmExtW;

        default: ResultW = 32'd0;
    endcase

endmodule