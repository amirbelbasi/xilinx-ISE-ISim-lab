Library IEEE;
USE IEEE.Std_logic_1164.all;

entity RisingEdge_DFlipFlop_AsyncResetLow is
   port(
      clk :in std_logic;
      async_reset: in std_logic;
      D :in  std_logic;
		Q : out std_logic
   );
end RisingEdge_DFlipFlop_AsyncResetLow;

architecture Behavioral of RisingEdge_DFlipFlop_AsyncResetLow is
begin
	process(clk, async_reset)
	begin
		if(async_reset = '0') then Q <= '0';
		elsif(rising_edge(clk)) then Q <= D;
		end if;  
	end process;
end Behavioral;