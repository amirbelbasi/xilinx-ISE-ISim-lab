library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CSA_M is
    Port ( input1 : in  STD_LOGIC_VECTOR (3 downto 0);
           input2 : in  STD_LOGIC_VECTOR (3 downto 0);
           output1 : out  STD_LOGIC_VECTOR (7 downto 0));
end CSA_M;

architecture GateLevel of CSA_M is
 COMPONENT CSA
  PORT (
			  input1 : in  STD_LOGIC_VECTOR (2 downto 0);
           input2 : in  STD_LOGIC_VECTOR (2 downto 0);
           input3 : in  STD_LOGIC_VECTOR (2 downto 0);
           sum : out  STD_LOGIC_VECTOR (2 downto 0);
           carry : out  STD_LOGIC_VECTOR (2 downto 0));
  END COMPONENT;
  
  COMPONENT Ripple
  PORT (
			  input1 : in  STD_LOGIC_VECTOR (2 downto 0);
           input2 : in  STD_LOGIC_VECTOR (2 downto 0);
           cin : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (2 downto 0);
           cout: out  STD_LOGIC);
  END COMPONENT;
  signal tsum1, tsum2, tsum3 : STD_LOGIC_VECTOR (2 downto 0) := "000";
  signal tcarry1, tcarry2, tcarry3 : STD_LOGIC_VECTOR (2 downto 0) := "000";
begin
			output1(0) <= input1(0) and input2(0);
			output1(1) <= tsum1(0);
			output1(2) <= tsum2(0);
			output1(3) <= tsum3(0);
			
			CSA_1 : CSA
			Port map(
					input1 => (input1(3) and input2(0))&(input1(2) and input2(0))&(input1(1) and input2(0)),
					input2 => (input1(2) and input2(1))&(input1(1) and input2(1))&(input1(0) and input2(1)),
					input3 => "000",
					sum => tsum1,
					carry => tcarry1
					);
			CSA_2 : CSA
			Port map(
					input1 => (input1(3) and input2(1))&(tsum1(2))&(tsum1(1)),
					input2 => tcarry1,
					input3 => (input1(2) and input2(2))&(input1(1) and input2(2))&(input1(0) and input2(2)),
					sum => tsum2,
					carry => tcarry2
					);
	      CSA_3 : CSA
			Port map(
					input1 => (input1(3) and input2(2))&(tsum2(2))&(tsum2(1)),
					input2 => (input1(2) and input2(3))&(input1(1) and input2(3))&(input1(0) and input2(3)),
					input3 => tcarry2,
					sum => tsum3,
					carry => tcarry3
					);
			ripp : Ripple
			Port map(
					input1 => tcarry3,
					input2 => (input1(3) and input2(3))&(tsum3(2))&(tsum3(1)),
					cin => '0',
					output => output1(6 downto 4),
					cout => output1(7)
					);

end GateLevel;

