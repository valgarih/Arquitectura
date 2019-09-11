library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity countring00 is 
	port(
				clkr: in std_logic;
				enr: in std_logic;
				outr: out std_logic_vector (3 downto 0) );
end countring00;

architecture countring0 of countring00 is 
	signal scont: std_logic_vector (3 downto 0);
begin
	pcont: process(clkr)
	begin
		if (clkr'event and clkr = '1') then
			case enr is
				when '0' =>
					outr <= (others => '0');
					scont <= "1000";
				when '1' =>
				scont (3) <= scont (0);
				scont (2 downto 0) <= scont (3 downto 1);
				outr <= scont;
				when others => null;
			end case;
		end if;	
	end process pcont;
end countring0;