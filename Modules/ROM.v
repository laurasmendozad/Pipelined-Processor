`timescale 1ns / 1ps
module ROM
	# (parameter BITS_DATA=32, //Data width
           parameter BITS_ADDR=5 //Address width
        )(

	input [BITS_ADDR-1:0] PCF,		// Address bus
	output reg [BITS_DATA-1:0] InstrF	//Output data
	);
// Memory array (depth x width): 2^3= 8_rows x 4_bits
reg [BITS_DATA-1:0] memoria [0: (2**BITS_ADDR)-1];
// 	data_width 	name	memory_depth
//	big-endian: the most significant byte  is at the lowest address

// Output update
always @ (*)
 InstrF <= memoria[PCF];

//The following code initializes the ROM contents via an external file
//with data in hexadecimal readmemh or use $readmemb for data in binary
initial
    $readmemh("../Modules/codigo.mem", memoria, 0, 23);
	
endmodule
