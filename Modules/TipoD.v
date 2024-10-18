`timescale 1ns / 1ps
module TipoD(
 input  [4:0]PCNextF,
 input  clk,
 input StalF,
 output reg [4:0]PCF);

initial
    begin
    PCF=5'd0;
    end
    
always@(posedge clk)   
    if (StalF==0) begin          //No se si StalF debe estar en 1 o en 0
        PCF <= PCNextF;
    end
    



endmodule