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


always @(posedge clk) begin
    if (FlushD) begin
        // Si FlushD está activo, se limpian los registros
        InstrD    <= 32'b0;
        PCD       <= 5'b0;
        PCPlus4D  <= 5'b0;
    end
    else if (!StalD) begin
        // Si StalD no está activo, se copian los valores de entrada
        InstrD    <= InstrF;
        PCD       <= PCF;
        PCPlus4D  <= PCPlus4F;
    end
    // Si StalD está activo, no hacemos nada (mantener el valor actual de los registros)
end
