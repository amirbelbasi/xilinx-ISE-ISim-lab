--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   07:29:15 11/10/2021
-- Design Name:   
-- Module Name:   /home/bizhaan/my_files/projects/ise/prac9/prac9/tb.vhd
-- Project Name:  prac9
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ADD_SHIFT
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ADD_SHIFT
    PORT(
         input1 : IN  std_logic_vector(3 downto 0);
         input2 : INOUT  std_logic_vector(3 downto 0);
         output : OUT  std_logic_vector(7 downto 0);
         clock : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal input1 : std_logic_vector(3 downto 0) := (others => '0');
   signal clock : std_logic := '0';

	--BiDirs
   signal input2 : std_logic_vector(3 downto 0);

 	--Outputs
   signal output : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ADD_SHIFT PORT MAP (
          input1 => input1,
          input2 => input2,
          output => output,
          clock => clock
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clock_period*10;

		input1 <= "1010";
		input2 <= "0110";

      wait;
   end process;

END;
