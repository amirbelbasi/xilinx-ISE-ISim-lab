library ieee;
use ieee.std_logic_1164.all;

entity shift_register_4bit is
	port (clk, load: in std_logic;
	pin: in std_logic_vector(3 downto 0);
	sout: out std_logic);
end shift_register_4bit;

architecture RTL of shift_register_4bit is
	component DFF is 
   port(
      Q : out std_logic;    
      clk :in std_logic;  
		sync_reset: in std_logic;  
      D :in  std_logic    
   );
	end component;
	
	
end RTL;