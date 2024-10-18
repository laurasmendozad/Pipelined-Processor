`timescale 1ns / 1ps

module Zero(
    input ZeroE,
    input BranchE,
    input JumpE,
    output PCSrcE
    );
    
assign PCSrcE = (ZeroE & BranchE)|(JumpE);
endmodule
