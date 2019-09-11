library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity contring00 is
	port(
		clkr: in std_logic;
		enr: in std_logic;
		outr: out std_logic_vector(3 downto 0));
end contring00;

architecture contring0 of contring00 is
signal scont: std_logic_vector(3 downto 0);
begin
	pcont: process(clkr)
	begin
		if rising_edge (clkr) then
			if(enr = '0') then
				outr <= (others => '0');
				scont <= "1000";
			else
				scont(3) <= scont(0);
				scont(2 downto 0) <= scont(3 downto 1);
				outr <= scont;
			end if;
		end if;
	end process pcont;
end contring0;