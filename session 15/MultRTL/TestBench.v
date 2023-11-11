`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////

module TestBench;

	// Inputs
	reg Clk;
	reg Rst;
	reg Start;
	reg [7:0] A;
	reg [7:0] B;

	// Outputs
	wire [15:0] RC;
	wire Stop;

	Mult uut (
		.Clk(Clk), 
		.Rst(Rst), 
		.Start(Start), 
		.A(A), 
		.B(B), 
		.RC(RC), 
		.Stop(Stop)
	);

	initial begin
		Clk = 0;
		Rst = 0;
		Start = 0;
		A = 6;
		B = 7;
		#20;
      Rst=1; 
		#10;
		Start=1;
		#20;
		Start=0;
		// Add stimulus here

	end
      always #5 Clk=~Clk;
endmodule

