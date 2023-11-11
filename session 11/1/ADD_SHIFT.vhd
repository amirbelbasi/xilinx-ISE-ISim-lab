library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ADD_SHIFT is
    Port ( input1 : in  unsigned (3 downto 0);
           input2 : inout  unsigned (3 downto 0);
           output : out  unsigned (7 downto 0);
           clock : in  STD_LOGIC);
end ADD_SHIFT;

architecture GateLevel of ADD_SHIFT is
	
	signal counter : unsigned (1 downto 0) := "11";
	signal temp : unsigned (4 downto 0) := (others => '0');
	
begin

	process(clock)
	begin
	
		if rising_edge(clock) then
		
			if (counter > 0) then
			
				if (input2(0) = '1') then
					temp <= temp + input1;
				end if;
				
				input2 <= temp(0)& input2(3 downto 1);
				temp <= '0'&temp(4 downto 1);
				
				counter <= counter - 1;
				
			end if;
			
		end if;
		
	end process;
	
	output <= temp(3 downto 0) & input2;

end GateLevel;
