`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module Control(
    input LSB,
    input Clk,
    input Rst,
    output reg Load,
    output reg Add,
    output reg Shift,
    output reg Stop,
    input Start
    );
	parameter IDLE=3'b000;
	parameter INIT=3'b001;
	parameter TEST=3'b010;
	parameter ADD=3'b011;
	parameter SHIFT=3'b100;
	
	reg [7:0] Cntr,State,NextState;
	
	always @(posedge Clk or negedge Rst)
		begin
			if (~Rst)
				State=IDLE;
				else
				State=NextState;
		end
	
	always @(*)
		begin
			Load=0;
			Add=0;
			Shift=0;
			Stop=0;
			case(State)
				IDLE  :begin Stop=1;Cntr=0; if (Start) NextState=INIT; else  NextState=IDLE; end 
				INIT  :begin Load=1;NextState=TEST; end 
				TEST  :begin if (LSB) NextState=ADD; else  NextState=SHIFT; end 
				ADD   :begin Add=1; NextState=SHIFT; end 
				SHIFT :begin Shift=1; Cntr=Cntr+1; if(Cntr==8) NextState=IDLE; else NextState=TEST; end 
			endcase
		end
	
endmodule
