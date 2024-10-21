`timescale 1ns / 1ps
module Decoder(
	       input [6:0]op,
	       input [2:0]func3,
	       input func7_5,
           output reg [1:0]ResultSrcD,
           output reg MemWriteD,
           output reg ALUSrcD,
           output reg [2:0]ImmSrcD,
           output reg RegWriteD,
           output reg [2:0]ALUControlD,
           output reg JumpD,
           output reg BranchD);
           

    reg [1:0] ALUOp;

always @(*)
begin
    case (op)
        7'd3:   begin    
                    RegWriteD = 1'b1;  //lw
                    ImmSrcD = 3'b000;
                    ALUSrcD = 1'b1;
                    MemWriteD = 1'b0;
                    ResultSrcD = 2'b01;
                    BranchD = 1'b0;
                    ALUOp = 2'b00;
                    JumpD = 1'b0;
                end

        7'd35:  begin
                    RegWriteD = 1'b0; //sw
                    ImmSrcD = 3'b001;
                    ALUSrcD = 1'b1;
                    MemWriteD = 1'b1;
                    ResultSrcD = 2'b11;
                    BranchD = 1'b0;
                    ALUOp = 2'b00;
                    JumpD = 1'b0;
                end

        7'd51:  begin
                    RegWriteD = 1'b1; //R
                    ImmSrcD = 3'b000;
                    ALUSrcD = 1'b0;
                    MemWriteD = 1'b0;
                    ResultSrcD = 2'b00;
                    BranchD = 1'b0;
                    ALUOp = 2'b10;
                    JumpD = 1'b0;
                end

        7'd99:  begin
                    RegWriteD = 1'b0;  
                    ImmSrcD = 3'b010; //beq
                    ALUSrcD = 1'b0;
                    MemWriteD = 1'b0;
                    ResultSrcD = 2'b00;
                    BranchD = 1'b1;
                    ALUOp = 2'b01;
                    JumpD = 1'b0;
                end
        
        7'd19:  begin
                    RegWriteD = 1'b1;   //I
                    ImmSrcD = 3'b000;
                    ALUSrcD = 1'b1;
                    MemWriteD = 1'b0;
                    ResultSrcD = 2'b00;
                    BranchD = 1'b0;
                    ALUOp = 2'b10;
                    JumpD = 1'b0;
                end

        7'd55:  begin
                    RegWriteD = 1'b1; //U
                    ImmSrcD = 3'b100;
                    ALUSrcD = 1'b1;
                    MemWriteD = 1'b0;
                    ResultSrcD = 2'b11;
                    BranchD = 1'b0;
                    ALUOp = 2'b00;
                    JumpD = 1'b0;
                end

        7'd111: begin
                   RegWriteD = 1'b1;   //jal
                    ImmSrcD = 3'b011;
                    ALUSrcD = 1'b1;
                    MemWriteD = 1'b0;
                    ResultSrcD = 2'b10;
                    BranchD = 1'b0;
                    ALUOp = 2'b00;
                    JumpD = 1'b1;
                end
        
        default: begin
                    RegWriteD = 1'b1;   //jal
                    ImmSrcD = 3'b011;
                    ALUSrcD = 1'b1;
                    MemWriteD = 1'b0;
                    ResultSrcD = 2'b10;
                    BranchD = 1'b0;
                    ALUOp = 2'b00;
                    JumpD = 1'b0;
                 end
    endcase

    casex ({ALUOp, func3, op[5], func7_5})
        7'b00xxxxx: ALUControlD = 3'b000;
        7'b01xxxxx: ALUControlD = 3'b001;
        7'b1000000: ALUControlD = 3'b000;
        7'b1000001: ALUControlD = 3'b000;
        7'b1000010: ALUControlD = 3'b000;
        7'b1000011: ALUControlD = 3'b001;
        7'b10010xx: ALUControlD = 3'b101;
        7'b10100xx: ALUControlD = 3'b110;
        7'b10110xx: ALUControlD = 3'b011;
        7'b10111xx: ALUControlD = 3'b010;
        default:    ALUControlD = 3'b000;
    endcase
end

endmodule
