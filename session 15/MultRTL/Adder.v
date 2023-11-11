`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module Adder(
    input [7:0] RA,
    input [7:0] RB,
    output [7:0] Add_Out,
    output C_Out
    );
	 
	Fa Bit0 (RA[0],RB[0],1'b0,Add_Out[0],c0);
	Fa Bit1 (RA[1],RB[1],c0,Add_Out[1],c1);
	Fa Bit2 (RA[2],RB[2],c1,Add_Out[2],c2);
	Fa Bit3 (RA[3],RB[3],c2,Add_Out[3],c3);
	Fa Bit4 (RA[4],RB[4],c3,Add_Out[4],c4);
	Fa Bit5 (RA[5],RB[5],c4,Add_Out[5],c5);
	Fa Bit6 (RA[6],RB[6],c5,Add_Out[6],c6);
	Fa Bit7 (RA[7],RB[7],c6,Add_Out[7],C_Out);

endmodule
