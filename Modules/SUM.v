`timescale 1ns / 1ps
module SUM(
input [4:0] PCE,
input [4:0] ImmExtE,
output [4:0] PCTargetE
    );
 assign PCTargetE = PCE+ImmExtE;
endmodule
