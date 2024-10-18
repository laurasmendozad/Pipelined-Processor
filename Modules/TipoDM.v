`timescale 1ns / 1ps
module TipoDM(
 input  clk,
 input [31:0]ALUResultE,
 input [31:0]WriteDataE,
 input [4:0]RdE,
 input [31:0]ImmExtE,
 input [4:0]PCPlus4E,
 input RegWriteE,
 input [1:0]ResultSrcE,
 input MemWriteE,

 
 output reg [31:0]ALUResultM,
 output reg [31:0]WriteDataM,
 output reg [4:0]RdM,
 output reg [31:0]ImmExtM,
 output reg [4:0]PCPlus4M,
 
 output reg RegWriteM,
 output reg [1:0]ResultSrcM,
 output reg MemWriteM
 );
 
//Falta la lógica de FlushD

always @(posedge clk) begin
 RegWriteM <= RegWriteE;
 ResultSrcM <= ResultSrcE;
 MemWriteM <= MemWriteE;
 ALUResultM <= ALUResultE;
 WriteDataM <= WriteDataE;
 RdM <= RdE;
 ImmExtM <= ImmExtE;
 PCPlus4M <= PCPlus4E;
end


endmodule
