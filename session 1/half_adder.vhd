Library IEEE;
USE IEEE.std_logic_1164.all;

Entity half_adder is
Port(
	in1, in2: in std_logic;
	out1, out2 : out std_logic
);
End Entity half_adder;

Architecture structure of half_adder is
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

Begin
	xor_gate_instance0: xor_gate port map (A=>in1, B=>in2, C=>out1);
	and_gate_instance0: and_gate port map (A=>in1, B=>in2, C=>out2);
End structure;