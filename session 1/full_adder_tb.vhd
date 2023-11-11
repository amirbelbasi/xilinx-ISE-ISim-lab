LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder_tb IS
END full_adder_tb;

ARCHITECTURE behavior OF full_adder_tb IS
COMPONENT full_adder
PORT(
	I0: IN  std_logic;
	I1: IN  std_logic;
	Cin: IN  std_logic;
	S: OUT  std_logic;
	Cout: OUT  std_logic
);
END COMPONENT;

   signal I0 : std_logic := '0';
   signal I1 : std_logic := '0';
   signal Cin : std_logic := '0';

   signal S : std_logic;
   signal Cout : std_logic;
BEGIN
   uut: full_adder PORT MAP(I0 => I0, I1 => I1, Cin => Cin, S => S, Cout => Cout);
	process is begin
		wait for 10 ns;
		I0 <= '1';
		I1 <= '0';
		Cin <= '0';
		
		wait for 10 ns;
		I0 <= '0';
		I1 <= '1';
		Cin <= '0';
		
		wait for 10 ns;
		I0 <= '0';
		I1 <= '0';
		Cin <= '1';
		
		wait for 10 ns;
		I0 <= '1';
		I1 <= '1';
		Cin <= '0';
		
		wait for 10 ns;
		I0 <= '1';
		I1 <= '0';
		Cin <= '1';
		
		wait for 10 ns;
		I0 <= '0';
		I1 <= '1';
		Cin <= '1';
		
		wait for 10 ns;
		I0 <= '1';
		I1 <= '1';
		Cin <= '1';
	end process;
END;
