`timescale 1 ns/1 ps

module ALU_tb;
	reg [31:0] SrcAE;
	reg [31:0] SrcBE;
	reg [2:0] ALUControlE;
	wire ZeroE;
	wire [31:0] ALUResultE;
	reg clock = 0;

	ALU u1 (
		.SrcAE(SrcAE),
		.SrcBE(SrcBE),
		.ALUControlE(ALUControlE),
		.ZeroE(ZeroE),
		.ALUResultE(ALUResultE)
	);

	parameter CLOCK_PERIOD = 10;
	always begin
       		#(CLOCK_PERIOD/2);
		clock = ~clock;
	end

	initial	begin
		SrcAE = 32'd6;
		SrcBE = 32'd3;
		ALUControlE = 3'd0;
		#(CLOCK_PERIOD*5);
		ALUControlE = 3'd1;
		#(CLOCK_PERIOD*5);
		ALUControlE = 3'd2;
		#(CLOCK_PERIOD*5);
		ALUControlE = 3'd3;
		#(CLOCK_PERIOD*5);
		ALUControlE = 3'd4;
		#(CLOCK_PERIOD*5);
		ALUControlE = 3'd5;
		#(CLOCK_PERIOD*5);
		ALUControlE = 3'd6;
		#(CLOCK_PERIOD*5);
		ALUControlE = 3'd7;
		#(CLOCK_PERIOD*5);
	end

	initial begin
		$dumpfile("out.vcd");
		$dumpvars;
		#(1000);
		$finish;
	end
endmodule
	

