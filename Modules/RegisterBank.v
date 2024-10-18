`timescale 1ns / 1ps
module RegisterBank(
input clk,
           input [4:0]A1,
		   input [4:0]A3,
		   input [4:0]A2,
           input RegWriteW,
           input [31:0]WD3,
           output reg[31:0]RD1,
           output reg[31:0]RD2
           );

reg [31:0]Enable;


//Entradas - Salidas

reg [31:0]Out1=32'd0;
reg [31:0]Out2;
reg [31:0]Out3;
reg [31:0]Out4;
reg [31:0]Out5;
reg [31:0]Out6;
reg [31:0]Out7;
reg [31:0]Out8;
reg [31:0]Out9;
reg [31:0]Out10;


reg [31:0]Out11;
reg [31:0]Out12;
reg [31:0]Out13;
reg [31:0]Out14;
reg [31:0]Out15;
reg [31:0]Out16;
reg [31:0]Out17;
reg [31:0]Out18;
reg [31:0]Out19;
reg [31:0]Out20;

reg [31:0]Out21;
reg [31:0]Out22;
reg [31:0]Out23;
reg [31:0]Out24;
reg [31:0]Out25;
reg [31:0]Out26;
reg [31:0]Out27;
reg [31:0]Out28;
reg [31:0]Out29;
reg [31:0]Out30;


reg [31:0]Out31;
reg [31:0]Out32;

//////Banco de registros////

always @(posedge clk) begin
  if (Enable[0]) begin
    Out1 <= WD3;
  end
  
  if (Enable[1]) begin
    Out2 <= WD3;
  end
  
  if (Enable[2]) begin
    Out3 <= WD3;
  end
  
  if (Enable[3]) begin
    Out4 <= WD3;
  end
  
  if (Enable[4]) begin
    Out5 <= WD3;
  end
  
  if (Enable[5]) begin
    Out6 <= WD3;
  end
  
  if (Enable[6]) begin
    Out7 <= WD3;
  end
  
  if (Enable[7]) begin
    Out8 <= WD3;
  end
  
  if (Enable[8]) begin
    Out9 <= WD3;
  end
  
  if (Enable[9]) begin
    Out10 <= WD3;
  end
  
  if (Enable[10]) begin
    Out11 <= WD3;
  end
  
  if (Enable[11]) begin
    Out12 <= WD3;
  end
  
  if (Enable[12]) begin
    Out13 <= WD3;
  end
  
  if (Enable[13]) begin
    Out14 <= WD3;
  end
  
  if (Enable[14]) begin
    Out15 <= WD3;
  end
  
  if (Enable[15]) begin
    Out16 <= WD3;
  end
  
  if (Enable[16]) begin
    Out17 <= WD3;
  end
  
  if (Enable[17]) begin
    Out18 <= WD3;
  end
  
  if (Enable[18]) begin
    Out19 <= WD3;
  end
  
  if (Enable[19]) begin
    Out20 <= WD3;
  end
  
  if (Enable[20]) begin
    Out21 <= WD3;
  end
  
  if (Enable[21]) begin
    Out22 <= WD3;
  end
  
  if (Enable[22]) begin
    Out23 <= WD3;
  end
  
  if (Enable[23]) begin
    Out24 <= WD3;
  end
  
  if (Enable[24]) begin
    Out25 <= WD3;
  end
  
  if (Enable[25]) begin
    Out26 <= WD3;
  end
  
  if (Enable[26]) begin
    Out27 <= WD3;
  end
  
  if (Enable[27]) begin
    Out28 <= WD3;
  end
  
  if (Enable[28]) begin
    Out29 <= WD3;
  end
  
  if (Enable[29]) begin
    Out30 <= WD3;
  end
  
  if (Enable[30]) begin
    Out31 <= WD3;
  end
  
  if (Enable[31]) begin
    Out32 <= WD3;
  end
end

/////Multiplexores//////

always @(*)
begin
    case (A1)
        5'b00000: RD1 = Out1;
        5'b00001: RD1 = Out2;
        5'b00010: RD1 = Out3;
        5'b00011: RD1 = Out4;
        5'b00100: RD1 = Out5;
        5'b00101: RD1 = Out6;
        5'b00110: RD1 = Out7;
        5'b00111: RD1 = Out8;
        5'b01000: RD1 = Out9;
        5'b01001: RD1 = Out10;
        5'b01010: RD1 = Out11;
        5'b01011: RD1 = Out12;
        5'b01100: RD1 = Out13;
        5'b01101: RD1 = Out14;
        5'b01110: RD1 = Out15;
        5'b01111: RD1 = Out16;
        5'b10000: RD1 = Out17;
        5'b10001: RD1 = Out18;
        5'b10010: RD1 = Out19;
        5'b10011: RD1 = Out20;
        5'b10100: RD1 = Out21;
        5'b10101: RD1 = Out22;
        5'b10110: RD1 = Out23;
        5'b10111: RD1 = Out24;
        5'b11000: RD1 = Out25;
        5'b11001: RD1 = Out26;
        5'b11010: RD1 = Out27;
        5'b11011: RD1 = Out28;
        5'b11100: RD1 = Out29;
        5'b11101: RD1 = Out30;
        5'b11110: RD1 = Out31;
        5'b11111: RD1 = Out32;
        default:  RD1 = Out10;
    endcase


    case (A2)
        5'b00000: RD2 = Out1;
        5'b00001: RD2 = Out2;
        5'b00010: RD2 = Out3;
        5'b00011: RD2 = Out4;
        5'b00100: RD2 = Out5;
        5'b00101: RD2 = Out6;
        5'b00110: RD2 = Out7;
        5'b00111: RD2 = Out8;
        5'b01000: RD2 = Out9;
        5'b01001: RD2 = Out10;
        5'b01010: RD2 = Out11;
        5'b01011: RD2 = Out12;
        5'b01100: RD2 = Out13;
        5'b01101: RD2 = Out14;
        5'b01110: RD2 = Out15;
        5'b01111: RD2 = Out16;
        5'b10000: RD2 = Out17;
        5'b10001: RD2 = Out18;
        5'b10010: RD2 = Out19;
        5'b10011: RD2 = Out20;
        5'b10100: RD2 = Out21;
        5'b10101: RD2 = Out22;
        5'b10110: RD2 = Out23;
        5'b10111: RD2 = Out24;
        5'b11000: RD2 = Out25;
        5'b11001: RD2 = Out26;
        5'b11010: RD2 = Out27;
        5'b11011: RD2 = Out28;
        5'b11100: RD2 = Out29;
        5'b11101: RD2 = Out30;
        5'b11110: RD2 = Out31;
        5'b11111: RD2 = Out32;
        default: RD2 = Out10;
    endcase
end



always @(*)
    if(RegWriteW) begin
        case (A3)
            5'b00000: Enable = 32'b00000000000000000000000000000001;
            5'b00001: Enable = 32'b00000000000000000000000000000010;
            5'b00010: Enable = 32'b00000000000000000000000000000100;
            5'b00011: Enable = 32'b00000000000000000000000000001000;
            5'b00100: Enable = 32'b00000000000000000000000000010000;
            5'b00101: Enable = 32'b00000000000000000000000000100000;
            5'b00110: Enable = 32'b00000000000000000000000001000000;
            5'b00111: Enable = 32'b00000000000000000000000010000000;
            5'b01000: Enable = 32'b00000000000000000000000100000000;
            5'b01001: Enable = 32'b00000000000000000000001000000000;
            5'b01010: Enable = 32'b00000000000000000000010000000000;
            5'b01011: Enable = 32'b00000000000000000000100000000000;
            5'b01100: Enable = 32'b00000000000000000001000000000000;
            5'b01101: Enable = 32'b00000000000000000010000000000000;
            5'b01110: Enable = 32'b00000000000000000100000000000000;
            5'b01111: Enable = 32'b00000000000000001000000000000000;
            5'b10000: Enable = 32'b00000000000000010000000000000000;
            5'b10001: Enable = 32'b00000000000000100000000000000000;
            5'b10010: Enable = 32'b00000000000001000000000000000000;
            5'b10011: Enable = 32'b00000000000010000000000000000000;
            5'b10100: Enable = 32'b00000000000100000000000000000000;
            5'b10101: Enable = 32'b00000000001000000000000000000000;
            5'b10110: Enable = 32'b00000000010000000000000000000000;
            5'b10111: Enable = 32'b00000000100000000000000000000000;
            5'b11000: Enable = 32'b00000001000000000000000000000000;
            5'b11001: Enable = 32'b00000010000000000000000000000000;
            5'b11010: Enable = 32'b00000100000000000000000000000000;
            5'b11011: Enable = 32'b00001000000000000000000000000000;
            5'b11100: Enable = 32'b00010000000000000000000000000000;
            5'b11101: Enable = 32'b00100000000000000000000000000000;
            5'b11110: Enable = 32'b01000000000000000000000000000000;
            5'b11111: Enable = 32'b10000000000000000000000000000000;
            default:  Enable = 32'b00000000000000000000000000000001;
        endcase
    end
	else
	begin
	Enable = 32'd0;
	end
endmodule
