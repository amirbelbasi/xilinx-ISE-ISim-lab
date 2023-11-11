library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SD is
	Port (
			input  : in  STD_LOGIC;
			clock  : in STD_LOGIC;
			output : out STD_LOGIC
			);
end SD;

architecture GateLevel of SD is

  COMPONENT D_FF
  PORT (
			  D        : in     STD_LOGIC;
           Clock    : in     STD_LOGIC;
           Q        : inout  STD_LOGIC;
			  QNot     : inout  STD_LOGIC
  );
  END COMPONENT;

	signal DA, DB, DC : STD_LOGIC;
	signal QA, QAN, QB, QBN, QC, QCN : STD_LOGIC;
	
begin
	
	DFF_A : D_FF
		Port map(
					D => DA,
					Clock => clock,
					Q => QA,
					QNot => QAN
					);
	DFF_B : D_FF
		Port map(
					D => DB,
					Clock => clock,
					Q => QB,
					QNot => QBN
					);
					
	DFF_C : D_FF
		Port map(
					D => DC,
					Clock => clock,
					Q => QC,
					QNot => QCN
					);
	
	DA <= (not(input) and QA and QBN and QCN) or (input and QA and QC) or (input and QAN and QB);
	DB <= (input and QAN and QBN and QC) or (not(input) and QAN and QB and QCN) or (not(input) and QA and QCN) or (input and QA and QC);
	DC <= (QB and QC) or (not(input) and QAN and QCN) or (not(input) and QB) or (not(input) and QA and QC);
	
	output <= (not(input) and QA and QBN and QCN) or (input and QB and QC);

end GateLevel;

