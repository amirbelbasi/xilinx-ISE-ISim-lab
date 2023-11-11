library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_carry_adder_4bit is
Port(
	A0, A1, A2, A3, B0, B1, B2, B3, Cin: in std_logic;
	S0, S1, S2, S3, Cout : out std_logic
);
end ripple_carry_adder_4bit;

architecture structure of ripple_carry_adder_4bit is

component full_adder is
Port(
	I0, I1, Cin: in std_logic;
	S, Cout : out std_logic
);
End Component full_adder;

signal internal_signalC0, internal_signalC1, internal_signalC2: std_logic;

begin
	full_adder_instance0: full_adder port map (I0=>A0, I1=>B0, Cin=>Cin, S=>S0, Cout=>internal_signalC0);
	full_adder_instance1: full_adder port map (I0=>A1, I1=>B1, Cin=>internal_signalC0, S=>S1, Cout=>internal_signalC1);
	full_adder_instance2: full_adder port map (I0=>A2, I1=>B2, Cin=>internal_signalC1, S=>S2, Cout=>internal_signalC2);
	full_adder_instance3: full_adder port map (I0=>A3, I1=>B3, Cin=>internal_signalC2, S=>S3, Cout=>Cout);
end structure;