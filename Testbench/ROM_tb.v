`timescale 1ns / 1ps

module ROM_tb;
	parameter BITS_DATA = 32; 
	parameter BITS_ADDR = 5;

	reg [BITS_ADDR-1:0] PCF;  
	wire [BITS_DATA-1:0] InstrF; 

	ROM #(
	    .BITS_DATA(BITS_DATA),
	    .BITS_ADDR(BITS_ADDR)
	) rom_inst (
	    .PCF(PCF),
	    .InstrF(InstrF)
	);
	
	parameter CLOCK_PERIOD = 10;
	
	initial begin
		// Caso 1: Leer dirección 0
		PCF = 5'd0;
		#(CLOCK_PERIOD);

		// Caso 2: Leer dirección 1
		PCF = 5'd1;
		#(CLOCK_PERIOD);

		// Caso 3: Leer dirección 2
		PCF = 5'd2;
		#(CLOCK_PERIOD);

		// Caso 4: Leer dirección 3
		PCF = 5'd3;
		#(CLOCK_PERIOD);

		// Caso 5: Leer dirección fuera de rango
		PCF = 5'd31;
		#(CLOCK_PERIOD);
	end
	
	initial begin
		$dumpfile("out.vcd");
		$dumpvars;
		#(1000);
		$finish;
	end	
endmodule
