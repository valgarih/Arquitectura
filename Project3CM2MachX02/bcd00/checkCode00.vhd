library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity checkCode00 is
  port(
       clkch: in std_logic;
	   resetch: in std_logic;
	   inCodech: in std_logic_vector(3 downto 0);
       outFlagch: out std_logic);
end checkCode00;

architecture checkCode0 of checkCode00 is
begin
  pcheck: process(clkch)
  begin
    case resetch is
	  when '0' =>
	    outFlagch <= '0';
	  when '1' =>
	    if (clkch'event and clkch = '1') then
		  if (inCodech < "0110") then
			outFlagch <= '0';
		  else
		    outFlagch <= '1';
		  end if;
		end if;
	  when others => null;
	end case;
  end process pcheck;
end checkCode0;