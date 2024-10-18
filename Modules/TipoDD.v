`timescale 1ns / 1ps
module TipoDD(
 input  [31:0]InstrF,
 input  clk,
 input [4:0]PCF,
 input [4:0]PCPlus4F,
 input StalD,
 input FlushD,
 output reg [31:0]InstrD,
 output reg [4:0]PCD,
 output reg [4:0]PCPlus4D);


//Falta la lógica de StalD y FlushD

always@(posedge clk)         
begin
    InstrD <= InstrF;
    PCD <= PCF;
    PCPlus4D <= PCPlus4F;
end



endmodule