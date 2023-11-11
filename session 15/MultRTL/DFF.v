`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module DFF(
    input Clk,
    input Rst,
    input D,
    output reg Q
    );

	always @(posedge Clk or negedge Rst)
		begin
			if (~Rst)
				Q=0;
				else
					Q=D;
		end
		
endmodule
