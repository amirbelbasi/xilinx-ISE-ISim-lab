library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CLA is
    Port ( input1 : in  STD_LOGIC_VECTOR (3 downto 0);
	        input2 : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end CLA;

architecture GatetLevel of CLA is

  signal p : STD_LOGIC_VECTOR (3 downto 0) := "0000";
  signal g : STD_LOGIC_VECTOR (3 downto 0) := "0000";
  signal c : STD_LOGIC_VECTOR (3 downto 0) := "0000";

begin
		p(0) <= input1(0) xor input2(0);
		p(1) <= input1(1) xor input2(1);
		p(2) <= input1(2) xor input2(2);
		p(3) <= input1(3) xor input2(3);
		
		g(0) <= input1(0) and input2(0);
		g(1) <= input1(1) and input2(1);
		g(2) <= input1(2) and input2(2);
		g(3) <= input1(3) and input2(3);
		
		c(1) <= g(0) or (p(0) and cin);
		c(2) <= g(1) or (p(1) and g(0)) or (p(1) and p(0) and cin);
		c(3) <= g(2) or (p(2) and g(1)) or (p(2) and p(1) and g(0)) or (p(2) and p(1) and p(0) and cin);
		cout <= g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1)) or (p(3) and p(2) and p(1) and g(0)) or (p(3) and p(2) and p(1) and p(0) and cin);
		
		output(0) <= cin xor p(0);
		output(1) <= c(1) xor p(1);
		output(0) <= c(2) xor p(2);
		output(0) <= c(3) xor p(3);
		
end GatetLevel;