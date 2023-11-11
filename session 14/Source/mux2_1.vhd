library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_1 is
Port(
	D0, D1, S: in std_logic;
	O: out std_logic
);
end mux2_1;

architecture structure of mux2_1 is

component or_gate is
port(
	A, B: in std_logic;
	C: out std_logic
);
End Component or_gate;

component and_gate is
port(
	A, B: in std_logic;
	C: out std_logic
);
End Component and_gate;

component not_gate is
Port(
	A: in std_logic;
	B: out std_logic
);
End component not_gate;

signal internal_signal0, internal_signal1, internal_signal2: std_logic;

begin
	not_gate_instance0: not_gate port map (A=>S, B=>internal_signal0);
	and_gate_instance0: and_gate port map (A=>internal_signal0, B=>D0, C=>internal_signal1);
	and_gate_instance1: and_gate port map (A=>D1, B=>S, C=>internal_signal2);
	or_gate_instance0: or_gate port map (A=>internal_signal1, B=>internal_signal2, C=>O);
end structure;