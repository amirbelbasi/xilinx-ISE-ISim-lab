Library IEEE;
USE IEEE.Std_logic_1164.all;

entity DFF is 
   port(
      Q : out std_logic;    
      clk :in std_logic;  
   sync_reset: in std_logic;  
      D :in  std_logic    
   );
end DFF;
architecture Behavioral of DFF is  
begin  
 process(clk)
 begin 
    if(rising_edge(clk)) then
   if(sync_reset='1') then 
    Q <= '0';
   else 
    Q <= D; 
   end if;
    end if;       
 end process;  
end Behavioral; 