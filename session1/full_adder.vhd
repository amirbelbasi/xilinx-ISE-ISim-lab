Library IEEE;
USE IEEE.std_logic_1164.all;

Entity full_adder is
Port(
	I0, I1, Cin: in std_logic;
	S, Cout : out std_logic
);
End Entity full_adder;

Architecture structure of full_adder is

component or_gate is
port(
	A, B: in std_logic;
	C: out std_logic
);
End Component or_gate;

component half_adder is
port(
	in1, in2: in std_logic;
	out1, out2: out std_logic
);
End Component half_adder;

signal internal_signal0, internal_signal1, internal_signal2: std_logic;

Begin
	half_adder_instance0: half_adder port map (in1=>I0, in2=>I1, out1=>internal_signal0, out2=>internal_signal1);
	half_adder_instance1: half_adder port map (in1=>internal_signal0, in2=>Cin, out1=>S, out2=>internal_signal2);
	or_gate_instance0: or_gate port map (A=>internal_signal1, B=>internal_signal2, C=>Cout);
End structure;