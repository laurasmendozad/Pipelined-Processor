`timescale 1ns / 1ps
module MUX2X1(
input PCSrcE,
input [4:0] PCPlus4F, 
input [4:0] PCTargetE, 
output [4:0] PCNextF);

  assign PCNextF = (PCSrcE == 0) ? PCPlus4F : PCTargetE;

endmodule