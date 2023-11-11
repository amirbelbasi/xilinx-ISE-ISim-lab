library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CSA is
    Port ( input1 : in  STD_LOGIC_VECTOR (2 downto 0);
           input2 : in  STD_LOGIC_VECTOR (2 downto 0);
           input3 : in  STD_LOGIC_VECTOR (2 downto 0);
           sum : out  STD_LOGIC_VECTOR (2 downto 0);
           carry : out  STD_LOGIC_VECTOR (2 downto 0));
end CSA;

architecture GateLevel of CSA is
	
  COMPONENT FA
  PORT (
			  x        : in  STD_LOGIC;
           y        : in  STD_LOGIC;
           z        : in  STD_LOGIC;
			  s        : out STD_LOGIC;
			  c        : out STD_logic
  );
  END COMPONENT;
	
begin

	FA_1 : FA
			Port map(
					x => input1(0),
					y => input2(0),
					z => input3(0),
					s => sum(0),
					c => carry(0)
					);
	FA_2 : FA
			Port map(
					x => input1(1),
					y => input2(1),
					z => input3(1),
					s => sum(1),
					c => carry(1)
					);
	FA_3 : FA
			Port map(
					x => input1(2),
					y => input2(2),
					z => input3(2),
					s => sum(2),
					c => carry(2)
					);

end GateLevel;

