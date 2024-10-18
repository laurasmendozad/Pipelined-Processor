`timescale 1ns / 1ps
module MUX2X1A(
input ALUSrcE,
input [31:0] WriteDataE, 
input [31:0] ImmExtE, 
output [31:0] SrcBE);

  assign SrcBE = (ALUSrcE == 0) ? WriteDataE : ImmExtE;
    
endmodule