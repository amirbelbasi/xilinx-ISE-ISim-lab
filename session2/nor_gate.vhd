Library IEEE;
USE IEEE.std_logic_1164.all;

Entity nor_gate is
Port(
	A, B: in std_logic;
	C: out std_logic
);
End Entity nor_gate;

Architecture gatelevel of nor_gate is
Begin
	C <= A nor B;
End gatelevel;