`timescale 1ns / 1ps

module RegisterBank_tb;
    // Declaración de señales
    reg clk;
    reg [4:0] A1;      // Dirección del primer registro a leer
    reg [4:0] A2;      // Dirección del segundo registro a leer
    reg [4:0] A3;      // Dirección del registro a escribir
    reg [31:0] WD3;    // Dato a escribir
    reg RegWriteW;     // Señal de control de escritura
    wire [31:0] RD1;   // Salida del primer registro leído
    wire [31:0] RD2;   // Salida del segundo registro leído

    // Instanciación del módulo RegisterBank
    RegisterBank uut (
        .clk(clk),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .WD3(WD3),
        .RegWriteW(RegWriteW),
        .RD1(RD1),
        .RD2(RD2)
    );

    // Generación de la señal de reloj
    always #5 clk = ~clk; // Periodo del reloj = 10 ns

    initial begin
        // Configuración para generar el archivo VCD
        $dumpfile("out.vcd"); // Nombre del archivo VCD
        $dumpvars(0, RegisterBank_tb);  // Volcado de todas las variables del testbench

        // Inicialización de señales
        clk = 0;
        RegWriteW = 0;
        A1 = 0;
        A2 = 0;
        A3 = 0;
        WD3 = 0;

        // Simulación
        // Prueba 1: Escritura en el registro 1
        #15;
        RegWriteW = 1;
        A3 = 5'b00001;  // Registro 1
        WD3 = 32'hDEADBEEF; // Dato 0xDEADBEEF
        #10;

        // Prueba 2: Escritura en el registro 2
        A3 = 5'b00010;  // Registro 2
        WD3 = 32'hCAFEBABE; // Dato 0xCAFEBABE
        #10;

        // Prueba 3: Escritura en el registro 31
        A3 = 5'b11111;  // Registro 31
        WD3 = 32'h12345678; // Dato 0x12345678
        #10;

        // Prueba 4: Lectura del registro 1
        RegWriteW = 0;
        A1 = 5'b00001; // Registro 1
        #10;

        // Prueba 5: Lectura del registro 2
        A2 = 5'b00010; // Registro 2
        #10;

        // Prueba 6: Lectura del registro 31
        A1 = 5'b11111; // Registro 31
        #10;

        // Finalización de la simulación
        $finish;
    end
endmodule
