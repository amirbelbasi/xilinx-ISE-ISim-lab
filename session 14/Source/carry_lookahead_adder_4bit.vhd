library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity carry_lookahead_adder_4bit is
Port(
	A0, A1, A2, A3, B0, B1, B2, B3, Cin: in std_logic;
	S0, S1, S2, S3, Cout : inout std_logic
);
end carry_lookahead_adder_4bit;

architecture structure of carry_lookahead_adder_4bit is

component full_adder is
Port(
	I0, I1, Cin: in std_logic;
	S, Cout : out std_logic
);
End Component full_adder;

component carry_lookahead_adder_logic_4bit is
Port(
	A0, A1, A2, A3, B0, B1, B2, B3, Cin: in std_logic;
	C0, C1, C2, Cout: inout std_logic
);
end component carry_lookahead_adder_logic_4bit;

signal C0, C1, C2, Dummy: std_logic;

begin

	full_adder_instance0: full_adder port map (I0=>A0, I1=>B0, Cin=>Cin, S=>S0, Cout=>Dummy);
	full_adder_instance1: full_adder port map (I0=>A1, I1=>B1, Cin=>C0, S=>S1, Cout=>Dummy);
	full_adder_instance2: full_adder port map (I0=>A2, I1=>B2, Cin=>C1, S=>S2, Cout=>Dummy);
	full_adder_instance3: full_adder port map (I0=>A3, I1=>B3, Cin=>C2, S=>S3, Cout=>Dummy);
	
	carry_lookahead_adder_logic_4bit_instance0: carry_lookahead_adder_logic_4bit port map
	(A0=>A0, A1=>A1, A2=>A2, A3=>A3, B0=>B0, B1=>B1, B2=>B2, B3=>B3, Cin=>Cin, C0=>C0, C1=>C1, C2=>C2, Cout=>Cout);

end structure;