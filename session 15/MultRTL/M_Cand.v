`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module M_Cand(
    input [7:0] A,
    input Clk,
    input Rst,
    input Load,
    output [7:0] RA
    );
	 
	wire [7:0] Mux;
	assign Mux = (Load)? A : RA;
		
	DFF MCand0 (Clk,Rst,Mux[0],RA[0]);
	DFF MCand1 (Clk,Rst,Mux[1],RA[1]);
	DFF MCand2 (Clk,Rst,Mux[2],RA[2]);
	DFF MCand3 (Clk,Rst,Mux[3],RA[3]);
	DFF MCand4 (Clk,Rst,Mux[4],RA[4]);
	DFF MCand5 (Clk,Rst,Mux[5],RA[5]);
	DFF MCand6 (Clk,Rst,Mux[6],RA[6]);
	DFF MCand7 (Clk,Rst,Mux[7],RA[7]);

endmodule
