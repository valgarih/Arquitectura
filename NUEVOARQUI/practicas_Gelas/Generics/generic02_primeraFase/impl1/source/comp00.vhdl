library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.components.all;

entity comp00 is
  port(
       clkc0: in std_logic;
	   codopc0: in std_logic_vector(4 downto 0);
	   portAc0: in std_logic_vector(7 downto 0);
	   portBc0: in std_logic_vector(7 downto 0);
	   inFlagc0: in std_logic;
	    
	   outc0: out std_logic_vector(7 downto 0);
       outFlagc0: out std_logic);
end comp00;

architecture comp0 of comp00 is
begin
   pc0: process(clkc0, codopc0, inFlagc0)
   variable aux: bit:='0';
     begin
	     if (clkc0'event and clkc0 = '1') then
		     if (codopc0 = "01111") then
			     if (inFlagc0 = '1') then
				    if (aux = '0') then
						aux:= '1';
						if(portAc0 = portBc0) then
							outc0 <= "00000100";
						elsif (portAc0 > portBc0) then
							outc0 <= "00000010";
						else
							outc0 <= "00000001";
						end if;
				       outFlagc0 <= '1';
					 else
				       outFlagc0 <= '1';
				    end if;
				 else
				   outFlagc0 <= '0';
				 end if;
			 else
			   outc0 <= (others => 'Z');
			   outFlagc0 <= 'Z';
			   aux:='0';
			 end if;
		 end if;
     end process pc0;
end comp0;