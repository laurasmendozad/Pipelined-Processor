`timescale 1 ns/1 ps

module Decoder_tb;
	reg [6:0] op;
	reg [2:0] func3;
	reg func7_5;
	wire [1:0] ResultSrcD;
	wire MemWriteD;
	wire ALUSrcD;
	wire [2:0] ImmSrcD;
	wire RegWriteD;
	wire [2:0] ALUControlD;
	wire JumpD;
	wire BranchD;
	reg clock = 0;

	Decoder u1 (
		.op(op),
		.func3(func3),
		.func7_5(func7_5),
		.ResultSrcD(ResultSrcD),
		.MemWriteD(MemWriteD),
		.ALUSrcD(ALUSrcD),
		.ImmSrcD(ImmSrcD),
		.RegWriteD(RegWriteD),
		.ALUControlD(ALUControlD),
		.JumpD(JumpD),
		.BranchD(BranchD)
	);

	parameter CLOCK_PERIOD = 10;
	always begin
       		#(CLOCK_PERIOD/2);
		clock = ~clock;
	end

	initial begin
		func3 = 3'b000;
		func7_5 = 1'b0;
		op = 7'd3;
		#(CLOCK_PERIOD*5);
		op = 7'd19;
		#(CLOCK_PERIOD*5);
		op = 7'd35;
		#(CLOCK_PERIOD*5);
		op = 7'd51;
		#(CLOCK_PERIOD*5);
		op = 7'd55;
		#(CLOCK_PERIOD*5);
		op = 7'd99;
		#(CLOCK_PERIOD*5);
		op = 7'd111;
		#(CLOCK_PERIOD*5);
	end

	initial begin
		$dumpfile("out.vcd");
		$dumpvars;
		#(1000);
		$finish;
	end
endmodule
