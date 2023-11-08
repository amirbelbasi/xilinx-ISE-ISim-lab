Library IEEE;
USE IEEE.std_logic_1164.all;

Entity not_gate is
Port(
	A: in std_logic;
	B: out std_logic
);
End Entity not_gate;

Architecture gatelevel of not_gate is
Begin
	B <= not A;
End gatelevel;