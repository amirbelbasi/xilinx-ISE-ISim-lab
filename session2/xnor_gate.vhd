Library IEEE;
USE IEEE.std_logic_1164.all;

Entity xnor_gate is
Port(
	A, B: in std_logic;
	C: out std_logic
);
End Entity xnor_gate;

Architecture gatelevel of xnor_gate is 
Begin
	C <= A xnor B;
End gatelevel;