library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity contring00 is
  port(
       clkcr: in std_logic;
	   enablecr: in std_logic;
	   rwcr: in std_logic;
       outcr: out std_logic_vector(3 downto 0));
end contring00;

architecture contring0 of contring00 is
signal soutr: std_logic_vector(3 downto 0);
begin
  pring: process(clkcr)
  begin
    if (clkcr'event and clkcr = '1') then
    case enablecr is
	  when '0' =>
	       soutr <= "1000";
		   outcr <= "0000";
	  when '1' =>
	    if (rwcr = '0') then
	       soutr(3) <= soutr(0);
		   soutr(2 downto 0) <= soutr(3 downto 1);
		   outcr <= soutr;
		elsif (rwcr = '1') then
		   soutr <= "1000";
		   outcr <= "0000";
		end if;
	  when others => null;
	end case;
  end if;
  end process pring;
end contring0;