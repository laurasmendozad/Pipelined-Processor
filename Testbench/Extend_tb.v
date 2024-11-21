`timescale 1 ns / 1 ps

module Extend_tb;
	reg [31:7] InstrD;
	reg [2:0] ImmSrcD;
	wire [31:0] ImmExtD;
	reg clock = 0;

	Extend u1 (
		.InstrD(InstrD),
		.ImmSrcD(ImmSrcD),
		.ImmExtD(ImmExtD)
	);

	parameter CLOCK_PERIOD = 10;
	always begin
       		#(CLOCK_PERIOD/2);
		clock = ~clock;
	end

	initial begin
		InstrD = 25'b0010111110111100101001001;
		ImmSrcD = 3'd0;
		#(CLOCK_PERIOD*5);
		ImmSrcD = 3'd0;
		#(CLOCK_PERIOD*5);
		ImmSrcD = 3'd1;
		#(CLOCK_PERIOD*5);
		ImmSrcD = 3'd2;
		#(CLOCK_PERIOD*5);
		ImmSrcD = 3'd3;
		#(CLOCK_PERIOD*5);
		ImmSrcD = 3'd4;
		#(CLOCK_PERIOD*5);
		ImmSrcD = 3'd5;
	end


	initial begin
		$dumpfile("out.vcd");
		$dumpvars;
		#(1000);
		$finish;
	end
endmodule
