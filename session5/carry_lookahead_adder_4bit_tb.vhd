LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY carry_lookahead_adder_4bit_tb IS
END carry_lookahead_adder_4bit_tb;
 
ARCHITECTURE behavior OF carry_lookahead_adder_4bit_tb IS
    COMPONENT carry_lookahead_adder_4bit
    PORT(
         A0 : IN  std_logic;
         A1 : IN  std_logic;
         A2 : IN  std_logic;
         A3 : IN  std_logic;
         B0 : IN  std_logic;
         B1 : IN  std_logic;
         B2 : IN  std_logic;
         B3 : IN  std_logic;
         Cin : IN  std_logic;
         S0 : INOUT  std_logic;
         S1 : INOUT  std_logic;
         S2 : INOUT  std_logic;
         S3 : INOUT  std_logic;
         Cout : INOUT  std_logic
        );
    END COMPONENT;
   --Inputs
   signal A0 : std_logic := '0';
   signal A1 : std_logic := '0';
   signal A2 : std_logic := '0';
   signal A3 : std_logic := '0';
   signal B0 : std_logic := '0';
   signal B1 : std_logic := '0';
   signal B2 : std_logic := '0';
   signal B3 : std_logic := '0';
   signal Cin : std_logic := '0';

	--BiDirs
   signal S0 : std_logic;
   signal S1 : std_logic;
   signal S2 : std_logic;
   signal S3 : std_logic;
   signal Cout : std_logic;
 
BEGIN
   uut: carry_lookahead_adder_4bit PORT MAP (
          A0 => A0,
          A1 => A1,
          A2 => A2,
          A3 => A3,
          B0 => B0,
          B1 => B1,
          B2 => B2,
          B3 => B3,
          Cin => Cin,
          S0 => S0,
          S1 => S1,
          S2 => S2,
          S3 => S3,
          Cout => Cout
        );
   process is begin
			wait for 10 ns;
          A0 <= '0';
          A1 <= '0';
          A2 <= '0';
          A3 <= '0';
          B0 <= '0';
          B1 <= '0';
          B2 <= '0';
          B3 <= '0';
          Cin <= '0';
			 
			wait for 10 ns;
          A0 <= '0';
          A1 <= '0';
          A2 <= '0';
          A3 <= '1';
          B0 <= '0';
          B1 <= '0';
          B2 <= '0';
          B3 <= '0';
          Cin <= '0';
			 
			 wait for 10 ns;
          A0 <= '0';
          A1 <= '1';
          A2 <= '0';
          A3 <= '0';
          B0 <= '0';
          B1 <= '0';
          B2 <= '1';
          B3 <= '0';
          Cin <= '0';
			 
			 wait for 10 ns;
          A0 <= '1';
          A1 <= '0';
          A2 <= '0';
          A3 <= '1';
          B0 <= '0';
          B1 <= '0';
          B2 <= '0';
          B3 <= '1';
          Cin <= '0';
			 
			 wait for 10 ns;
          A0 <= '0';
          A1 <= '1';
          A2 <= '0';
          A3 <= '1';
          B0 <= '0';
          B1 <= '1';
          B2 <= '0';
          B3 <= '1';
          Cin <= '0';
			 
			 wait for 10 ns;
          A0 <= '0';
          A1 <= '0';
          A2 <= '0';
          A3 <= '0';
          B0 <= '0';
          B1 <= '0';
          B2 <= '0';
          B3 <= '0';
          Cin <= '1';
			 
			 wait for 10 ns;
          A0 <= '0';
          A1 <= '0';
          A2 <= '0';
          A3 <= '1';
          B0 <= '0';
          B1 <= '0';
          B2 <= '0';
          B3 <= '0';
          Cin <= '1';
			 
			 wait for 10 ns;
          A0 <= '0';
          A1 <= '1';
          A2 <= '0';
          A3 <= '0';
          B0 <= '0';
          B1 <= '0';
          B2 <= '1';
          B3 <= '0';
          Cin <= '1';
			 
			 wait for 10 ns;
          A0 <= '1';
          A1 <= '0';
          A2 <= '0';
          A3 <= '1';
          B0 <= '0';
          B1 <= '0';
          B2 <= '0';
          B3 <= '1';
          Cin <= '1';
			 
			 wait for 10 ns;
          A0 <= '0';
          A1 <= '1';
          A2 <= '0';
          A3 <= '1';
          B0 <= '0';
          B1 <= '1';
          B2 <= '0';
          B3 <= '1';
          Cin <= '1';
   end process;
END;
