library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity encoder is
port(
input: in std_logic_vector(3 downto 0);
output: out std_logic_vector(1 downto 0)
);
end encoder;

architecture Behavioral of encoder is

begin
output <= "00" when input = "0001" else
          "01" when input = "0010" else
          "10" when input = "0100" else
          "11" when input = "1000";


end Behavioral;

