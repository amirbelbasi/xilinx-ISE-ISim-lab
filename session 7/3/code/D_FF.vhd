library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF is
    Port ( 
			  D        : in   STD_LOGIC;
           Clock    : in   STD_LOGIC;
           Q        : inout  STD_LOGIC;
			  QNot     : inout  STD_LOGIC
			 );
end D_FF;

architecture GateLevel of D_FF is
	
	signal x1, x2 : STD_LOGIC;
	
begin
	
	x1 <= D nand Clock;
	X2 <= (not(D)) nand Clock;
	
	Q <= x1 nand QNot;
	QNot <= x2 nand Q;

end GateLevel;