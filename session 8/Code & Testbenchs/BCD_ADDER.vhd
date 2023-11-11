library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD_ADDER is
    Port ( inputt1 : in  STD_LOGIC_VECTOR (3 downto 0);
           inputt2 : in  STD_LOGIC_VECTOR (3 downto 0);
           cinn : in  STD_LOGIC;
           outputt : out  STD_LOGIC_VECTOR (3 downto 0);
           coutt : out  STD_LOGIC);
end BCD_ADDER;

architecture GateLevel of BCD_ADDER is
  COMPONENT Ripple
  PORT (
			  input1 : in  STD_LOGIC_VECTOR (3 downto 0);
	        input2 : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC
  );
  END COMPONENT;
  
  signal sum   : std_logic_vector (3 downto 0) := "0000";
  signal carry : std_logic := '0';
  signal temp  : std_logic := '0';
  signal x     : std_logic := '0';

begin
	ripple_1 : Ripple
			Port map(
					input1 => inputt1,
					input2 => inputt2,
					cin => cinn,
					output => sum,
					cout => carry
					);
	
	temp <= ((sum(3) and sum(1)) or (sum(3) and sum(2)) or carry);
	
	ripple_2 : Ripple
			Port map(
					input1 => sum,
					input2 => '0'&temp&temp&'0',
					cin => '0',
					output => outputt,
					cout => x
					);
	coutt <= temp;

end GateLevel;
