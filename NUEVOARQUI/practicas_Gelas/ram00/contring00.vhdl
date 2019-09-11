library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity contring00 is
  port(
       clks: in std_logic;
	   en: in std_logic;
       outr: out std_logic_vector(4 downto 0));
end contring00;

architecture contring0 of contring00 is
signal sshift: std_logic_vector(4 downto 0);
begin
  pcontr: process(clks)
  begin
    if (clks'event and clks = '1') then
	  case en is
	    when '0' =>
		  outr <= (others => '0');
		  sshift <= "10000";
		when '1' =>
		  sshift(4) <= sshift(0);
		  sshift(3 downto 0) <= sshift(4 downto 1);
		  outr <= sshift;
		when others => null;
	  end case;
	end if;
  end process pcontr;
end contring0;