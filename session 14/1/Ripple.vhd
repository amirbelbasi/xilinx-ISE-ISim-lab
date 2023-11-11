library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ripple is
    Port ( input1 : in  STD_LOGIC_VECTOR (3 downto 0);
	        input2 : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end Ripple;

architecture GatetLevel of Ripple is
  COMPONENT FA
  PORT (
			  x        : in  STD_LOGIC;
           y        : in  STD_LOGIC;
           z        : in  STD_LOGIC;
			  s        : out STD_LOGIC;
			  c        : out STD_logic
  );
  END COMPONENT;
  signal temp : STD_LOGIC_VECTOR (2 downto 0) := "000";

begin
		FA_1 : FA
			Port map(
					x => input1(0),
					y => input2(0),
					z => cin,
					s => output(0),
					c => temp(0)
					);
		FA_2 : FA
			Port map(
					x => input1(1),
					y => input2(1),
					z => temp(0),
					s => output(1),
					c => temp(1)
					);
		FA_3 : FA
			Port map(
					x => input1(2),
					y => input2(2),
					z => temp(1),
					s => output(2),
					c => temp(2)
					);
		FA_4 : FA
			Port map(
					x => input1(3),
					y => input2(3),
					z => temp(2),
					s => output(3),
					c => cout
					);
	
end GatetLevel;
