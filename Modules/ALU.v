`timescale 1ns / 1ps
module ALU(input  [31:0]SrcAE,
           input  [31:0]SrcBE,
           input  [2:0]ALUControlE,
           output ZeroE,
           output reg [31:0]ALUResultE);

	always @(*)
	    case (ALUControlE)
		0: ALUResultE = SrcAE + SrcBE;
		1: ALUResultE = SrcAE - SrcBE;
		2: ALUResultE = SrcAE & SrcBE;
		3: ALUResultE = SrcAE | SrcBE;
		4: ALUResultE = SrcAE > SrcBE;
		5: ALUResultE = SrcAE < SrcBE;
		6: ALUResultE = SrcAE ^ SrcBE;
		7: ALUResultE = SrcAE == SrcBE;
		default: ALUResultE = 32'd0;
	    endcase

	assign ZeroE = SrcAE==SrcBE;

endmodule
