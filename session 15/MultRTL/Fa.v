`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module Fa(
    input a,
    input b,
    input cin,
    output s,
    output c
    );
	
	xor(f1,a,b);
	xor(s,f1,cin);
	and(f2,f1,cin);
	and(f3,a,b);
	or(c,f2,f3);
	
endmodule
