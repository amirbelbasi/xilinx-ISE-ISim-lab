library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA is
    Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           z : in  STD_LOGIC;
           s : out  STD_LOGIC;
           c : out  STD_LOGIC);
end FA;

architecture GateLevel of FA is

begin

	s <= x xor y xor z;
	c <= (x and y) or (x and z) or (y and z);

end GateLevel;