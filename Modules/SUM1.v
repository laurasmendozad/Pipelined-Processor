`timescale 1ns / 1ps
module SUM1(
input [4:0] PCF,
output [4:0] PCPlus4F
    );
 assign PCPlus4F = PCF+5'd1;

endmodule
