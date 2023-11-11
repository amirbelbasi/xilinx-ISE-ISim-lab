`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module Mult(
    input Clk,
    input Rst,
    input Start,
    input [7:0] A,
    input [7:0] B,
    output [15:0] RC,
    output Stop
    );
	wire Load,LSB,Add,Shift,C_Out;
	wire [7:0] RA,RB,Add_Out;
	
//M_Cand Unit1 (.A(A), .Clk(Clk), .Rst(Rst), .Load(Load), .RA(RA));
M_Cand Unit1 (A,Clk,Rst,Load,RA);

Control Unit2 (LSB,Clk,Rst,Load,Add,Shift,Stop,Start);

Adder Unit3 (RA,RB,Add_Out,C_Out);

M_Res Unit4 (Clk,Rst,Add,Shift,Load,B,{C_Out,Add_Out},RC,RB,LSB);
  
	 

endmodule
