`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module M_Res(
    input Clk,
    input Rst,
    input Add,
    input Shift,
    input Load,
    input [7:0] B,
    input [8:0] SUM,
    output [15:0] RC,
    output [7:0] RB,
    output LSB
    );
	 wire [16:0] TEMP;
	 wire [16:0] Inp;
	 
	 assign LSB=TEMP[0];
	 assign RB=TEMP[15:8];
	 assign RC=TEMP[15:0];
	 
	 assign Inp = (Shift)? TEMP>>1 :(Add)? {SUM,TEMP[7:0]} :(Load)? {TEMP[16:8],B} : TEMP;
	 DFF M_Res0 (Clk,Rst,Inp[0],TEMP[0]);
	 DFF M_Res1 (Clk,Rst,Inp[1],TEMP[1]);
	 DFF M_Res2 (Clk,Rst,Inp[2],TEMP[2]);
	 DFF M_Res3 (Clk,Rst,Inp[3],TEMP[3]);
	 DFF M_Res4 (Clk,Rst,Inp[4],TEMP[4]);
	 DFF M_Res5 (Clk,Rst,Inp[5],TEMP[5]);
	 DFF M_Res6 (Clk,Rst,Inp[6],TEMP[6]);
	 DFF M_Res7 (Clk,Rst,Inp[7],TEMP[7]);
	 DFF M_Res8 (Clk,Rst,Inp[8],TEMP[8]);
	 DFF M_Res9 (Clk,Rst,Inp[9],TEMP[9]);
	 DFF M_Res10 (Clk,Rst,Inp[10],TEMP[10]);
	 DFF M_Res11 (Clk,Rst,Inp[11],TEMP[11]);
	 DFF M_Res12 (Clk,Rst,Inp[12],TEMP[12]);
	 DFF M_Res13 (Clk,Rst,Inp[13],TEMP[13]);
	 DFF M_Res14 (Clk,Rst,Inp[14],TEMP[14]);
	 DFF M_Res15 (Clk,Rst,Inp[15],TEMP[15]);
	 DFF M_Res16 (Clk,Rst,Inp[16],TEMP[16]);

endmodule
