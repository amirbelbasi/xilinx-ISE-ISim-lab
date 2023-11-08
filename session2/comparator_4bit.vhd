Library IEEE;
USE IEEE.std_logic_1164.all;

Entity comparator_4bit is
Port(
	a,b: in std_logic_vector(3 downto 0);
	AGTB, AETB, ASTB: out std_logic
);
End Entity comparator_4bit;

architecture behavioral of comparator_4bit is
begin
if a > b then
	AGTB <= '1';
else
	AGTB <= '0';
end if;
if a > b then
	AETB <= '1';
else
	AETB <= '0';
end if;
if a > b then
	ASTB <= '1';
else
	ASTB <= '0';
end if;
end behavioral;
