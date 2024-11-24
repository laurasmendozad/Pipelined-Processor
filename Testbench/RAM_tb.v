`timescale 1ns / 1ps

module RAM_tb;
	reg MemWriteM;
	reg [2:0] ALUResultM;
	reg [31:0] WriteDataM;
	wire [31:0] ReadDataM;
	reg clock = 0;

	RAM u1(
		.clk(clock),
		.MemWriteM(MemWriteM),
		.ALUResultM(ALUResultM),
		.WriteDataM(WriteDataM),
		.ReadDataM(ReadDataM)
	);

	parameter CLOCK_PERIOD = 10;
	always begin
       		#(CLOCK_PERIOD/2);
		clock = ~clock;
	end
	
	initial begin
		MemWriteM = 0;
		ALUResultM = 0;
		WriteDataM = 0;

		// Simulación
		// Prueba 1: Escritura en dirección 0
		#15;
		MemWriteM = 1;
		ALUResultM = 3'b000;   // Dirección 0
		WriteDataM = 32'hA1A2A3A4; // Dato 0xA5A5A5A5
		#10;

		// Prueba 2: Escritura en dirección 1
		MemWriteM = 1;
		ALUResultM = 3'b001;   // Dirección 1
		WriteDataM = 32'h5A5A5A5A; // Dato 0x5A5A5A5A
		#10;

		// Prueba 3: Escritura en dirección 7
		MemWriteM = 1;
		ALUResultM = 3'b111;   // Dirección 7
		WriteDataM = 32'h12345678; // Dato 0x12345678
		#10;

		// Prueba 4: Lectura de dirección 0
		MemWriteM = 0;
		ALUResultM = 3'b000;   // Dirección 0
		#10;

		// Prueba 5: Lectura de dirección 1
		ALUResultM = 3'b001;   // Dirección 1
		#10;

		// Prueba 6: Lectura de dirección 7
		ALUResultM = 3'b111;   // Dirección 7
		#10;
	end
	
	initial begin
		$dumpfile("out.vcd");
		$dumpvars;
		#(1000);
		$finish;
	end	
endmodule
