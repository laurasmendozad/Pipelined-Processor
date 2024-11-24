`timescale 1ns / 1ps
module RAM# (parameter N=3, M=32)
	(
	input clk,
	input MemWriteM,
	input [2:0]ALUResultM,
	input [31:0]WriteDataM,
	output [31:0]ReadDataM
	);

reg [M-1:0] my_mem [2**N-1:0];

always @ (posedge clk)
    if (MemWriteM) my_mem[ALUResultM[2:0]] <= WriteDataM;

assign ReadDataM = my_mem[ALUResultM[2:0]];
endmodule
