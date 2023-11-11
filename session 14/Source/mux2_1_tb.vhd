LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux2_1_tb IS
END mux2_1_tb;
 
ARCHITECTURE behavior OF mux2_1_tb IS 
    COMPONENT mux2_1
    PORT(
         D0 : IN  std_logic;
         D1 : IN  std_logic;
         S : IN  std_logic;
         O : OUT  std_logic
        );
    END COMPONENT;
   --Inputs
   signal D0 : std_logic := '0';
   signal D1 : std_logic := '0';
   signal S : std_logic := '0';

 	--Outputs
   signal O : std_logic;
BEGIN
   uut: mux2_1 PORT MAP (
          D0 => D0,
          D1 => D1,
          S => S,
          O => O
        );
	process is begin
		wait for 10 ns;
		D0 <= '0';
		D1 <= '0';
		S <= '0';
		
		wait for 10 ns;
		D0 <= '1';
		D1 <= '0';
		S <= '0';
		
		wait for 10 ns;
		D0 <= '0';
		D1 <= '1';
		S <= '0';
		
		wait for 10 ns;
		D0 <= '1';
		D1 <= '1';
		S <= '0';
		
		wait for 10 ns;
		D0 <= '0';
		D1 <= '0';
		S <= '1';
		
		wait for 10 ns;
		D0 <= '1';
		D1 <= '0';
		S <= '1';
		
		wait for 10 ns;
		D0 <= '0';
		D1 <= '1';
		S <= '1';
		
		wait for 10 ns;
		D0 <= '1';
		D1 <= '1';
		S <= '1';
	end process;

END;
