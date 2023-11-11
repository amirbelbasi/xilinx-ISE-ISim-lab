library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_FF is
    Port ( 
			  T : in  STD_LOGIC;
           Clock : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Q : inout  STD_LOGIC;
           QNot : inout  STD_LOGIC
			 );
end T_FF;

architecture GateLevel of T_FF is
	
	signal x1, x2, x3, x4 : STD_LOGIC;	
	
begin
	
	x1 <= T and QNot;
	x2 <= T and Q;
	
	x3 <= x1 nand Clock;
	x4 <= x2 nand Clock;
	
	Q <= not (x3 and (not(Reset)) and Qnot);
	QNot <= not (x4 and Reset and Q);

end GateLevel;
