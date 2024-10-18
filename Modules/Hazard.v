`timescale 1ns / 1ps

module Hazard(
    input [4:0] Rs1D,
    input [4:0] Rs2D,
    input [4:0] Rs1E,
    input [4:0] Rs2E,
    input [4:0] RdE,
    input PCSrcE,
    input ResultSrcE0,
    input [4:0] RdM,
    input [4:0] RdW,
    input RegWriteM,
    input RegWriteW,
    
    output reg StalF,
    output reg StalD,
    output reg FlushD,
    output reg FlushE,
    output reg [1:0] ForwardAE, 
    output reg [1:0] ForwardBE  
    );
    reg lwStall;
    
    always @(*) begin
        ForwardAE = 2'b00;
        ForwardBE = 2'b00;
        StalF = 0;
        StalD = 0;
        FlushE = 0;
        lwStall = 0;
        
        // Lógica para ForwardAE (operando Rs1E)
        if ((Rs1E == RdM) && RegWriteM && (Rs1E != 5'b0)) begin
            ForwardAE = 2'b10;  
        end
        else if ((Rs1E == RdW) && RegWriteW && (Rs1E != 5'b0)) begin
            ForwardAE = 2'b01; 
        end 
        else 
            ForwardAE = 2'b00;

        // Lógica para ForwardBE (operando Rs2E)
        if ((Rs2E == RdM) && RegWriteM && (Rs2E != 5'b0)) begin
            ForwardBE = 2'b10;  
        end
        else if ((Rs2E == RdW) && RegWriteW && (Rs2E != 5'b0)) begin
            ForwardBE = 2'b01;  
        end
        else 
            ForwardBE = 2'b00;
            
            
        // Lógica para lwStall
        lwStall = ResultSrcE0 && ((Rs1D == RdE) || (Rs2D == RdE));

       // Stall en Fetch y Decode si hay un hazard por carga
        StalF = lwStall;
        StalD = lwStall;

        // *** Flush por branch o bubble introducida por lw ***
        FlushD = PCSrcE;             
        FlushE = lwStall | PCSrcE;   
    
    end

endmodule

