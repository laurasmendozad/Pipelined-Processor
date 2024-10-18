`timescale 1ns / 1ps
module Extend(
input  [31:7]InstrD,
              input  [2:0]ImmSrcD,
              output reg [31:0]ImmExtD);

always @(*)
    case (ImmSrcD)
        0: ImmExtD = {{20{InstrD[31]}}, InstrD[31:20]};
        1: ImmExtD = {{20{InstrD[31]}}, InstrD[31:25], InstrD[11:7]};
        2: ImmExtD = {{20{InstrD[31]}}, InstrD[7], InstrD[30:25], InstrD[11:8], 1'b0};
        3: ImmExtD = {{12{InstrD[31]}}, InstrD[19:12], InstrD[20], InstrD[30:21], 1'b0};
        4: ImmExtD = {InstrD[31:12], 12'd0};
        default: ImmExtD = 32'd0;
    endcase

endmodule
