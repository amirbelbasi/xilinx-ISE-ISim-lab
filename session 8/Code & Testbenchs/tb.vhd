--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:59:32 11/10/2021
-- Design Name:   
-- Module Name:   /home/bizhaan/my_files/projects/ise/prac12/prac12/tb.vhd
-- Project Name:  prac12
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BCD_ADDER
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
 
    COMPONENT BCD_ADDER
    PORT(
         inputt1 : IN  std_logic_vector(3 downto 0);
         inputt2 : IN  std_logic_vector(3 downto 0);
         cinn : IN  std_logic;
         outputt : OUT  std_logic_vector(3 downto 0);
         coutt : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal inputt1 : std_logic_vector(3 downto 0) := (others => '0');
   signal inputt2 : std_logic_vector(3 downto 0) := (others => '0');
   signal cinn : std_logic := '0';

 	--Outputs
   signal outputt : std_logic_vector(3 downto 0);
   signal coutt : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BCD_ADDER PORT MAP (
          inputt1 => inputt1,
          inputt2 => inputt2,
          cinn => cinn,
          outputt => outputt,
          coutt => coutt
        );


 

   -- Stimulus process
   stim_proc: process
   begin		

      -- insert stimulus here 
		
		inputt1 <= "1001";
		inputt2 <= "0111";
		cin <= '1';
		
      wait;
   end process;

END;
