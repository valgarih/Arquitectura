library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.components.all;

entity comp2 is
  port(
       clkc2: in std_logic;
	   codopc2: in std_logic_vector(4 downto 0);
	   portAc2: in std_logic_vector(7 downto 0);
	   inFlagc2: in std_logic;
	    
	   outc2: out std_logic_vector(7 downto 0);
       outFlagc2: out std_logic);
end comp2;

architecture comp0 of comp2 is
begin
   pc2: process(clkc2, codopc2, inFlagc2)
   variable aux: bit:='0';
     begin
	     if (clkc2'event and clkc2 = '1') then
		     if (codopc2 = "01101") then
			     if (inFlagc2 = '1') then
				    if (aux = '0') then
						aux:= '1';
						outc2 <= not(portAc2) + 1;
				       outFlagc2 <= '1';
					 else
				       outFlagc2 <= '1';
				    end if;
				 else
				   outFlagc2 <= '0';
				 end if;
			 else
			   outc2 <= (others => 'Z');
			   outFlagc2 <= 'Z';
			   aux:='0';
			 end if;
		 end if;
     end process pc2;
end comp0;