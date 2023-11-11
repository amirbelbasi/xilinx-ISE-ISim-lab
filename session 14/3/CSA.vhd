library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CSA is
    Port ( input1 : in  STD_LOGIC_VECTOR (3 downto 0);
	        input2 : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end CSA;

architecture GatetLevel of CSA is
  COMPONENT FA
  PORT (
			  x        : in  STD_LOGIC;
           y        : in  STD_LOGIC;
           z        : in  STD_LOGIC;
			  s        : out STD_LOGIC;
			  c        : out STD_logic
  );
  END COMPONENT;
  
  COMPONENT MUX
  PORT (
			  i0       : in  STD_LOGIC;
           i1       : in  STD_LOGIC;
           s        : in  STD_LOGIC;
			  o        : out STD_LOGIC
  );
  END COMPONENT;
  
  signal temp1 : STD_LOGIC_VECTOR (2 downto 0) := "000";
  signal temp2 : STD_LOGIC_VECTOR (2 downto 0) := "000";
  signal i0   : STD_LOGIC_VECTOR (4 downto 0) := "00000";
  signal i1   : STD_LOGIC_VECTOR (4 downto 0) := "00000";

begin
		FA_1 : FA
			Port map(
					x => input1(0),
					y => input2(0),
					z => '0',
					s => i1(0),
					c => temp1(0)
					);
		FA_2 : FA
			Port map(
					x => input1(1),
					y => input2(1),
					z => temp1(0),
					s => i1(1),
					c => temp1(1)
					);
		FA_3 : FA
			Port map(
					x => input1(2),
					y => input2(2),
					z => temp1(1),
					s => i1(2),
					c => temp1(2)
					);
		FA_4 : FA
			Port map(
					x => input1(3),
					y => input2(3),
					z => temp1(2),
					s => i1(3),
					c => i1(4)
					);
					
					
		FA_5 : FA
			Port map(
					x => input1(0),
					y => input2(0),
					z => '1',
					s => i0(0),
					c => temp2(0)
					);
		FA_6 : FA
			Port map(
					x => input1(1),
					y => input2(1),
					z => temp2(0),
					s => i0(1),
					c => temp2(1)
					);
		FA_7 : FA
			Port map(
					x => input1(2),
					y => input2(2),
					z => temp2(1),
					s => i0(2),
					c => temp2(2)
					);
		FA_8 : FA
			Port map(
					x => input1(3),
					y => input2(3),
					z => temp2(2),
					s => i0(3),
					c => i0(4)
					);
					
		MUX_1 : MUX
			Port map(
					i0 => i0(0),
					i1 => i1(0),
					s => cin,
					o => output(0)
					);
					
		MUX_2 : MUX
			Port map(
					i0 => i0(1),
					i1 => i1(2),
					s => cin,
					o => output(2)
					);
					
		MUX_3 : MUX
			Port map(
					i0 => i0(2),
					i1 => i1(2),
					s => cin,
					o => output(2)
					);
					
		MUX_4 : MUX
			Port map(
					i0 => i0(3),
					i1 => i1(3),
					s => cin,
					o => output(3)
					);
					
		MUX_5 : MUX
			Port map(
					i0 => i0(4),
					i1 => i1(4),
					s => cin,
					o => cout
					);
	
end GatetLevel;