`timescale 1ns / 1ps

module Hazard_tb;

    // Entradas
    reg [4:0] Rs1D;
    reg [4:0] Rs2D;
    reg [4:0] Rs1E;
    reg [4:0] Rs2E;
    reg [4:0] RdE;
    reg PCSrcE;
    reg ResultSrcE0;
    reg [4:0] RdM;
    reg [4:0] RdW;
    reg RegWriteM;
    reg RegWriteW;

    // Salidas
    wire StalF;
    wire StalD;
    wire FlushD;
    wire FlushE;
    wire [1:0] ForwardAE;
    wire [1:0] ForwardBE;

    // Instancia del módulo
    Hazard uut (
        .Rs1D(Rs1D),
        .Rs2D(Rs2D),
        .Rs1E(Rs1E),
        .Rs2E(Rs2E),
        .RdE(RdE),
        .PCSrcE(PCSrcE),
        .ResultSrcE0(ResultSrcE0),
        .RdM(RdM),
        .RdW(RdW),
        .RegWriteM(RegWriteM),
        .RegWriteW(RegWriteW),
        .StalF(StalF),
        .StalD(StalD),
        .FlushD(FlushD),
        .FlushE(FlushE),
        .ForwardAE(ForwardAE),
        .ForwardBE(ForwardBE)
    );

    // Procedimiento de prueba
    initial begin
        // Configuración del archivo para generación de ondas
        $dumpfile("out.vcd");  // Nombre del archivo de salida
        $dumpvars(0, Hazard_tb); // Registra todas las variables del módulo
        
        // Inicialización de señales
        Rs1D = 0; Rs2D = 0; Rs1E = 0; Rs2E = 0; RdE = 0;
        PCSrcE = 0; ResultSrcE0 = 0; RdM = 0; RdW = 0;
        RegWriteM = 0; RegWriteW = 0;
        #10;

        // Caso 1: Forwarding desde MEM hacia EXE
        Rs1E = 5'b00001; Rs2E = 5'b00010;
        RdM = 5'b00001; RegWriteM = 1;
        #10;
        
        // Caso 2: Forwarding desde WB hacia EXE
        Rs1E = 5'b00011; RdW = 5'b00011; RegWriteW = 1;
        #10;

        // Caso 3: Hazard por instrucción tipo LW
        Rs1D = 5'b00100; RdE = 5'b00100; ResultSrcE0 = 1;
        #10;

        // Caso 4: Flush debido a branch
        PCSrcE = 1;
        #10;

        // Caso 5: Sin hazard ni forwarding
        Rs1E = 5'b10101; Rs2E = 5'b10110; RdM = 5'b00000; RdW = 5'b00000;
        RegWriteM = 0; RegWriteW = 0; ResultSrcE0 = 0; PCSrcE = 0;
        #10;


        $finish;
    end

    // Monitoreo de las señales
    initial begin
        $monitor("Time=%0d | Rs1E=%b Rs2E=%b RdE=%b | ForwardAE=%b ForwardBE=%b | StalF=%b StalD=%b FlushD=%b FlushE=%b", 
                 $time, Rs1E, Rs2E, RdE, ForwardAE, ForwardBE, StalF, StalD, FlushD, FlushE);
    end

endmodule
