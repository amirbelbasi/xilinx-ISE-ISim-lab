
library ieee;
use ieee.std_logic_1164.all;
entity encoder_tb is
end entity encoder_tb;
architecture test of encoder_tb is
component encoder is
port(
input: in std_logic_vector(3 downto 0);
output: out std_logic_vector(1 downto 0)
);
end component;
signal i :std_logic_vector(3 downto 0);
signal o : std_logic_vector(1 downto 0);
begin
enc:encoder port map ( input => i, output => o);
i <= "0001", 
"0010" after 50 ns, 
"1000" after 200 ns;
end test;



