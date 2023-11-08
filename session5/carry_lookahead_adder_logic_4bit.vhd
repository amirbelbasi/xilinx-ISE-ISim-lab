library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity carry_lookahead_adder_logic_4bit is
Port(
	A0, A1, A2, A3, B0, B1, B2, B3, Cin: in std_logic;
	C0, C1, C2, Cout: inout std_logic
);
end carry_lookahead_adder_logic_4bit;

architecture structure of carry_lookahead_adder_logic_4bit is
component xor_gate is
port(
	A, B: in std_logic;
	C: out std_logic
);
End Component xor_gate;

component and_gate is
port(
	A, B: in std_logic;
	C: out std_logic
);
End Component and_gate;

component or_gate is
port(
	A, B: in std_logic;
	C: out std_logic
);
End Component or_gate;

signal P0, P1, P2, P3, G0, G1, G2, G3, P0Cin, P1C0, P2C1, P3C2: std_logic;

begin
	xor_gate_instance0: xor_gate port map (A=>A0, B=>B0, C=>P0);
	xor_gate_instance1: xor_gate port map (A=>A1, B=>B1, C=>P1);
	xor_gate_instance2: xor_gate port map (A=>A2, B=>B2, C=>P2);
	xor_gate_instance3: xor_gate port map (A=>A3, B=>B3, C=>P3);
	
	and_gate_instance0: and_gate port map (A=>A0, B=>B0, C=>G0);
	and_gate_instance1: and_gate port map (A=>A1, B=>B1, C=>G1);
	and_gate_instance2: and_gate port map (A=>A2, B=>B2, C=>G2);
	and_gate_instance3: and_gate port map (A=>A3, B=>B3, C=>G3);

	and_gate_instance4: and_gate port map (A=>P0, B=>Cin, C=>P0Cin);
	or_gate_instance0: or_gate port map (A=>G0, B=>P0Cin, C=>C0);
	and_gate_instance5: and_gate port map (A=>P1, B=>C0, C=>P1C0);
	or_gate_instance1: or_gate port map (A=>G1, B=>P1C0, C=>C1);
	and_gate_instance6: and_gate port map (A=>P2, B=>C1, C=>P2C1);
	or_gate_instance2: or_gate port map (A=>G2, B=>P2C1, C=>C2);
	and_gate_instance7: and_gate port map (A=>P3, B=>C2, C=>P3C2);
	or_gate_instance3: or_gate port map (A=>G3, B=>P3C2, C=>Cout);
end structure;

