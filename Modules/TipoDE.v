`timescale 1ns / 1ps
module TipoDE(
 input  clk,
 input [31:0]RD1,
 input [31:0]RD2,
 input [4:0]PCD,
 input [4:0]Rs1D,
 input [4:0]Rs2D,
 input [4:0]RdD,
 input [31:0]ImmExtD,
 input [4:0]PCPlus4D,
 input FlushE,
 
 input RegWriteD,
 input [1:0]ResultSrcD,
 input MemWriteD,
 input JumpD,
 input BranchD,
 input [2:0]ALUControlD,
 input ALUSrcD,
 
 output reg [31:0]RD1E,
 output reg [31:0]RD2E,
 output reg [4:0]PCE,
 output reg [4:0]Rs1E,
 output reg [4:0]Rs2E,
 output reg [4:0]RdE,
 output reg [31:0]ImmExtE,
 output reg [4:0]PCPlus4E,
 
 output reg RegWriteE,
 output reg [1:0]ResultSrcE,
 output reg MemWriteE,
 output reg JumpE,
 output reg BranchE,
 output reg [2:0]ALUControlE,
 output reg ALUSrcE
 );
 
//Falta la lógica de FlushD

always @(posedge clk) begin
    if (FlushE) begin
        // Si FlushE está activo, todos los registros se limpian (se ponen a 0)
        RD1E       <= 32'b0;
        RD2E       <= 32'b0;
        PCE        <= 5'b0;
        Rs1E       <= 5'b0;
        Rs2E       <= 5'b0;
        RdE        <= 5'b0;
        ImmExtE    <= 32'b0;
        PCPlus4E   <= 5'b0;
        RegWriteE  <= 1'b0;
        ResultSrcE <= 2'b0;
        MemWriteE  <= 1'b0;
        JumpE      <= 1'b0;
        BranchE    <= 1'b0;
        ALUControlE<= 3'b0;
        ALUSrcE    <= 1'b0;
    end 
    else begin
        // Si FlushE no está activo, se copian los valores de entrada a las salidas
        RD1E       <= RD1;
        RD2E       <= RD2;
        PCE        <= PCD;
        Rs1E       <= Rs1D;
        Rs2E       <= Rs2D;
        RdE        <= RdD;
        ImmExtE    <= ImmExtD;
        PCPlus4E   <= PCPlus4D;
        RegWriteE  <= RegWriteD;
        ResultSrcE <= ResultSrcD;
        MemWriteE  <= MemWriteD;
        JumpE      <= JumpD;
        BranchE    <= BranchD;
        ALUControlE<= ALUControlD;
        ALUSrcE    <= ALUSrcD;
    end
end


endmodule