`timescale 1ns / 1ps
module TipoDW(
 input  clk,
 input [31:0]ALUResultM,
 input [31:0]ReadDataM,
 input [4:0]RdM,
 input [31:0]ImmExtM,
 input [4:0]PCPlus4M,
 
 input RegWriteM,
 input [1:0]ResultSrcM,

 
 output reg [31:0]ALUResultW,
 output reg [31:0]ReadDataW,
 output reg [4:0]RdW,
 output reg [31:0]ImmExtW,
 output reg [4:0]PCPlus4W,
 
 output reg RegWriteW,
 output reg [1:0]ResultSrcW
 );
 
//Falta la lógica de FlushD

always @(posedge clk) begin
 RegWriteW <= RegWriteM;
 ResultSrcW <= ResultSrcM;
 ALUResultW <= ALUResultM;
 ReadDataW <= ReadDataM;
 RdW <= RdM;
 ImmExtW <= ImmExtM;
 PCPlus4W <= PCPlus4M;
end


endmodule
