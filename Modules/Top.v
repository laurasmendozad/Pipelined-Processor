`timescale 1ns / 1ps

module Top(
    input clk,
    output ZeroE
    );
    wire MemWriteD, ALUSrcD, RegWriteD, StalF, StalD, FlushD, FlushE, PCSrcE ;
    wire RegWriteM, RegWriteW, ALUSrcE, MemWriteM, MemWriteE, JumpD, JumpE, BranchD, BranchE;
    wire RegWriteE;
    wire [1:0] ResultSrcD, ResultSrcE, ResultSrcW, ResultSrcM, ForwardAE, ForwardBE;
    wire [2:0] ALUControlD, ImmSrcD, ALUControlE;
    wire [4:0] PCF, Rs1D, Rs2D, Rs1E, Rs2E, RdE, RdM, RdW, PCNextF, PCPlus4F, PCTargetE;
    wire [4:0] PCPlus4W, PCPlus4M, PCPlus4E, PCPlus4D, PCE, PCD;
    wire [31:0] InstrD, SrcAE, SrcBE, ALUResultE, ImmExtD, ImmExtE, WriteDataE, WriteDataM;
    wire [31:0] RD1E, ResultW, ALUResultM, RD2E, ReadDataW, ReadDataM, ALUResultW, ImmExtW, ImmExtM;
    wire [31:0] RD1D, RD2D, InstrF;
   
ALU ALU1(
    .SrcAE(SrcAE),
    .SrcBE(SrcBE),
    .ALUControlE(ALUControlE),
    .ALUResultE(ALUResultE),
    .ZeroE(ZeroE)
);

Decoder Deco(
    .func3(InstrD[14:12]),
    .op(InstrD[6:0]),
    .func7_5(InstrD[30]),
    .ResultSrcD(ResultSrcD),
    .MemWriteD(MemWriteD),
    .ALUSrcD(ALUSrcD),
    .ImmSrcD(ImmSrcD),
    .JumpD(JumpD),
    .RegWriteD(RegWriteD),
    .BranchD(BranchD),
    .ALUControlD(ALUControlD)
    );
    
Extend Extend1(
    .InstrD(InstrD[31:7]),
    .ImmSrcD(ImmSrcD),
    .ImmExtD(ImmExtD)
);

Hazard Hazard1(
    .Rs1D(InstrD[19:15]),
    .Rs2D(InstrD[24:20]),
    .Rs1E(Rs1E),
    .Rs2E(Rs2E),
    .RdE(RdE),
    .PCSrcE(PCSrcE),
    .ResultSrcE0(ResultSrcE[0]),
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

ROM ROM1(
    .PCF(PCF),
    .InstrF(InstrF)
);

MUX2X1 MUX2X11(
    .PCSrcE(PCSrcE),
    .PCPlus4F(PCPlus4F), 
    .PCTargetE(PCTargetE), 
    .PCNextF(PCNextF)
);
    
MUX2X1A MUX2X1A1(
    .ALUSrcE(ALUSrcE),
    .WriteDataE(WriteDataE), 
    .ImmExtE(ImmExtE), 
    .SrcBE(SrcBE)
);

MUX3X1A MUX3X1A1(
    .RD1E(RD1E),
    .ResultW(ResultW),
	.ALUResultM(ALUResultM),
	.ForwardAE(ForwardAE),
	.SrcAE(SrcAE)
);

MUX3X1B MUX3X1B1(
    .RD2E(RD2E),
    .ResultW(ResultW),
	.ALUResultM(ALUResultM),
	.ForwardBE(ForwardBE),
	.WriteDataE(WriteDataE)
);

MUX4X1 MUX4X11(
    .ResultSrcW(ResultSrcW),
    .PCPlus4W(PCPlus4W),
	.ReadDataW(ReadDataW),
	.ALUResultW(ALUResultW),
	.ImmExtW(ImmExtW),
	.ResultW(ResultW)
);
    
RAM RAM1(
    .clk(clk),
	.MemWriteM(MemWriteM),
	.ALUResultM(ALUResultM[2:0]),
	.WriteDataM(WriteDataM),
	.ReadDataM(ReadDataM)
);

RegisterBank RegisterBank1(
    .clk(clk),
    .A1(InstrD[19:15]),
    .A2(InstrD[24:20]),
    .A3(RdW),
    .RegWriteW(RegWriteW),
    .WD3(ResultW),
    .RD1(RD1D),
    .RD2(RD2D)
);

SUM SUM1(
    .PCE(PCE),
    .ImmExtE(ImmExtE),
    .PCTargetE(PCTargetE)

);

SUM1 SUM11(
    .PCF(PCF),
    .PCPlus4F(PCPlus4F)
);

TipoD TipoD1 (
    .PCNextF(PCNextF),
    .clk(clk),
    .StalF(StalF),
    .PCF(PCF)
);

TipoDD TipoDD1(
    .InstrF(InstrF),
    .clk(clk),
    .PCF(PCF),
    .PCPlus4F(PCPlus4F),
    .StalD(StalD),
    .FlushD(FlushD),
    .InstrD(InstrD),
    .PCD(PCD),
    .PCPlus4D(PCPlus4D)
);

TipoDE TipoDE1(
    .clk(clk),
    .RD1(RD1D),
    .RD2(RD2D),
    .PCD(PCD),
    .Rs1D(InstrD[19:15]),
    .Rs2D(InstrD[24:20]),
    .RdD(InstrD[11:7]),
    .ImmExtD(ImmExtD),
    .PCPlus4D(PCPlus4D),
    .FlushE(FlushE),
    .RegWriteD(RegWriteD),
    .ResultSrcD(ResultSrcD),
    .MemWriteD(MemWriteD),
    .JumpD(JumpD),
    .BranchD(BranchD),
    .ALUControlD(ALUControlD),
    .ALUSrcD(ALUSrcD),
    .RD1E(RD1E),
    .RD2E(RD2E),
    .PCE(PCE),
    .Rs1E(Rs1E),
    .Rs2E(Rs2E),
    .RdE(RdE),
    .ImmExtE(ImmExtE),
    .PCPlus4E(PCPlus4E),
    .RegWriteE(RegWriteE),
    .ResultSrcE(ResultSrcE),
    .MemWriteE(MemWriteE),
    .JumpE(JumpE),
    .BranchE(BranchE),
    .ALUControlE(ALUControlE),
    .ALUSrcE(ALUSrcE)
);

TipoDM TipoDM1(
    .clk(clk),
    .ALUResultE(ALUResultE),
    .WriteDataE(WriteDataE),
    .RdE(RdE),
    .ImmExtE(ImmExtE),
    .PCPlus4E(PCPlus4E),
    .RegWriteE(RegWriteE),
    .ResultSrcE(ResultSrcE),
    .MemWriteE(MemWriteE),
    .ALUResultM(ALUResultM),
    .WriteDataM(WriteDataM),
    .RdM(RdM),
    .ImmExtM(ImmExtM),
    .PCPlus4M(PCPlus4M),
    .RegWriteM(RegWriteM),
    .ResultSrcM(ResultSrcM),
    .MemWriteM(MemWriteM)
);
    
    
TipoDW TipoDW1(
    .clk(clk),
    .ALUResultM(ALUResultM),
    .ReadDataM(ReadDataM),
    .RdM(RdM),
    .ImmExtM(ImmExtM),
    .PCPlus4M(PCPlus4M),
    .RegWriteM(RegWriteM),
    .ResultSrcM(ResultSrcM),
    .ALUResultW(ALUResultW),
    .ReadDataW(ReadDataW),
    .RdW(RdW),
    .ImmExtW(ImmExtW),
    .PCPlus4W(PCPlus4W),
    .RegWriteW(RegWriteW),
    .ResultSrcW(ResultSrcW)
);

Zero Zero1(
    .ZeroE(ZeroE),
    .BranchE(BranchE),
    .JumpE(JumpE),
    .PCSrcE(PCSrcE)
);
endmodule
