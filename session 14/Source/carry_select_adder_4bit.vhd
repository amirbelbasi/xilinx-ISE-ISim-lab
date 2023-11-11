library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity carry_select_adder_4bit is
Port(
	A0, A1, A2, A3, B0, B1, B2, B3, Cin: in std_logic;
	S0, S1, S2, S3, Cout : out std_logic
);
end carry_select_adder_4bit;

architecture structure of carry_select_adder_4bit is

component full_adder is
Port(
	I0, I1, Cin: in std_logic;
	S, Cout : out std_logic
);
End Component full_adder;

component mux2_1 is
Port(
	D0, D1, S: in std_logic;
	O: out std_logic
);
end component mux2_1;

signal C0, C1, C2, C3, C4, C5, C6, C7, Sum0, Sum1, Sum2, Sum3, Sum4, Sum5, Sum6, Sum7: std_logic;

begin

	full_adder_instance0: full_adder port map (I0=>A0, I1=>B0, Cin=>'0', S=>Sum0, Cout=>C0);
	full_adder_instance4: full_adder port map (I0=>A0, I1=>B0, Cin=>'1', S=>Sum4, Cout=>C4);
	full_adder_instance1: full_adder port map (I0=>A1, I1=>B1, Cin=>C0, S=>Sum1, Cout=>C1);
	full_adder_instance5: full_adder port map (I0=>A1, I1=>B1, Cin=>C4, S=>Sum5, Cout=>C5);
	full_adder_instance2: full_adder port map (I0=>A2, I1=>B2, Cin=>C1, S=>Sum2, Cout=>C2);
	full_adder_instance6: full_adder port map (I0=>A2, I1=>B2, Cin=>C5, S=>Sum6, Cout=>C6);
	full_adder_instance3: full_adder port map (I0=>A3, I1=>B3, Cin=>C2, S=>Sum3, Cout=>C3);
	full_adder_instance7: full_adder port map (I0=>A3, I1=>B3, Cin=>C6, S=>Sum7, Cout=>C7);
	
	mux2_1_instance0: mux2_1 port map (D0=>Sum0, D1=>Sum4, S=>Cin, O=>S0);
	mux2_1_instance1: mux2_1 port map (D0=>Sum1, D1=>Sum5, S=>Cin, O=>S1);
	mux2_1_instance2: mux2_1 port map (D0=>Sum2, D1=>Sum6, S=>Cin, O=>S2);
	mux2_1_instance3: mux2_1 port map (D0=>Sum3, D1=>Sum7, S=>Cin, O=>S3);
	mux2_1_instance4: mux2_1 port map (D0=>C3, D1=>C7, S=>Cin, O=>Cout);

end structure;