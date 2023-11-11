library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX is
    Port ( i0: in  STD_LOGIC;
           i1 : in  STD_LOGIC;
           s : in  STD_LOGIC;
           o : out  STD_LOGIC);
end MUX;

architecture GateLevel of MUX is

begin
	
		o <= ((not s) and i0) or (s and i1);
		
end GateLevel;

