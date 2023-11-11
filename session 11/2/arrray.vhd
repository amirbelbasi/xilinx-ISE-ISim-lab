library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity arrray is
    Port ( input1 : in  STD_LOGIC_VECTOR (3 downto 0);
           input2 : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (7 downto 0));
end arrray;

architecture GateLevel of arrray is
  COMPONENT FA
  PORT (
			  x        : in  STD_LOGIC;
           y        : in  STD_LOGIC;
           z        : in  STD_LOGIC;
			  s        : out STD_LOGIC;
			  c        : out STD_logic
  );
  END COMPONENT;
  
  signal carry : STD_LOGIC_VECTOR (10 downto 0) := (others => '0');
  signal sum : STD_LOGIC_VECTOR (5 downto 0) := (others => '0');
  
begin
	
	output(0) <= input1(0) and input2(0);
	
	FA_1 : FA
			Port map(
					x => input1(0) and input2(1),
					y => input1(1) and input2(0),
					z => '0',
					s => output(1),
					c => carry(0)
					);
	FA_2 : FA
			Port map(
					x => input1(1) and input2(1),
					y => input1(2) and input2(0),
					z => '0',
					s => sum(0),
					c => carry(1)
					);
	FA_3 : FA
			Port map(
					x => input1(3) and input2(0),
					y => input1(2) and input2(1),
					z => '0',
					s => sum(1),
					c => carry(2)
					);
	FA_4 : FA
			Port map(
					x => input1(0) and input2(2),
					y => carry(0),
					z => sum(0),
					s => output(2),
					c => carry(3)
					);
	FA_5 : FA
			Port map(
					x => input1(1) and input2(2),
					y => carry(1),
					z => sum(1),
					s => sum(2),
					c => carry(4)
					);
	FA_6 : FA
			Port map(
					x => input1(2) and input2(2),
					y => input1(3) and input2(1),
					z => carry(2),
					s => sum(3),
					c => carry(5)
					);
	FA_7 : FA
			Port map(
					x => input1(0) and input2(3),
					y => carry(3),
					z => sum(2),
					s => output(3),
					c => carry(6)
					);
	FA_8 : FA
			Port map(
					x => input1(1) and input2(3),
					y => carry(4),
					z => sum(3),
					s => sum(4),
					c => carry(7)
					);
	FA_9 : FA
			Port map(
					x => input1(2) and input2(3),
					y => input1(3) and input2(2),
					z => carry(5),
					s => sum(5),
					c => carry(8)
					);
	FA_10 : FA
			Port map(
					x => carry(6),
					y => sum(4),
					z => '0',
					s => output(4),
					c => carry(9)
					);
	FA_11 : FA
			Port map(
					x => carry(9),
					y => sum(5),
					z => carry(7),
					s => output(5),
					c => carry(10)
					);
	FA_12 : FA
			Port map(
					x => carry(10),
					y => carry(8),
					z => input1(3) and input2(3),
					s => output(6),
					c => output(7)
					);
					
end GateLevel;
