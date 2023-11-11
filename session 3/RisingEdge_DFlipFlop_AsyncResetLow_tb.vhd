Library IEEE;
USE IEEE.Std_logic_1164.all;
 
ENTITY RisingEdge_DFlipFlop_AsyncResetLow_tb IS
END RisingEdge_DFlipFlop_AsyncResetLow_tb;
 
ARCHITECTURE behavior OF RisingEdge_DFlipFlop_AsyncResetLow_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RisingEdge_DFlipFlop_AsyncResetLow
    PORT(
         clk : IN  std_logic;
         async_reset : IN  std_logic;
         D : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal async_reset : std_logic := '0';
   signal D : std_logic := '0';

 	--Outputs
   signal Q : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RisingEdge_DFlipFlop_AsyncResetLow PORT MAP (
          clk => clk,
          async_reset => async_reset,
          D => D,
          Q => Q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      --wait for 50 ns;	

      wait for clk_period*5;

      -- insert stimulus here
		async_reset <= '0';
      D <= '0';
		wait for clk_period/2;
		
		async_reset <= '0';
      D <= '1';
		wait for clk_period/2;
		
		async_reset <= '0';
      D <= '0';
		wait for clk_period/2;
		
		async_reset <= '0';
      D <= '0';
		wait for clk_period/2;
		
		async_reset <= '0';
      D <= '1';
		wait for clk_period/2;
		
		async_reset <= '0';
      D <= '0';
		wait for clk_period/2;
		
		async_reset <= '1';
      D <= '0';
		wait for clk_period/2;
		
		async_reset <= '1';
      D <= '1';
		wait for clk_period/2;
		
		async_reset <= '1';
      D <= '0';
		wait for clk_period/2;
		
		async_reset <= '1';
      D <= '0';
		wait for clk_period/2;
		
		async_reset <= '1';
      D <= '1';
		wait for clk_period/2;
		
		async_reset <= '1';
      D <= '0';
		wait for clk_period/2;
		
      wait;
   end process;

END;
