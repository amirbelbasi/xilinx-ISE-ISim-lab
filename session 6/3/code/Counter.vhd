library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Counter is
    Port ( 
			  Clock  : in   STD_LOGIC;
           Output : out  unsigned(3 downto 0)
			 );
end Counter;

architecture Behavioral of Counter is

	signal temp : unsigned(3 downto 0) := (others => '0');
	
begin
	
	Output <= temp;
	
	process(Clock)
	begin
		
		if rising_edge(Clock) then
			
			temp <= temp + 1;
			
		end if;
		
	end process;

end Behavioral;

