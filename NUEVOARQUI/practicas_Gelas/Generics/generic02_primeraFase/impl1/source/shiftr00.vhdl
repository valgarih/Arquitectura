library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.components.all;

entity shiftr00 is
  port(
       clksr: in std_logic;
	   codopsr: in std_logic_vector(4 downto 0);
	   portAsr: in std_logic_vector(7 downto 0);
	   inFlagsr: in std_logic;
	    
	   outsr: out std_logic_vector(7 downto 0);
       outFlagsr: out std_logic);
end shiftr00;

architecture shiftr0 of shiftr00 is
begin
   psr: process(clksr, codopsr, inFlagsr)
   variable aux: bit:='0';
     begin
	     if (clksr'event and clksr = '1') then
		     if (codopsr = "00111") then
				if (inFlagsr = '1') then
					if (aux = '0') then
						aux:= '1';
						outsr <= portAsr;
					   outFlagsr <= '1';
					 else
					   outFlagsr <= '1';
					end if;
					 else
						outsr(7) <= '0';
						outsr(6 downto 0) <= portAsr(7 downto 1);
					   outFlagsr <= '0';
			   end if;
			 else
			   outsr <= (others => 'Z');
			   outFlagsr <= 'Z';
			   aux:='0';
			 end if;
		 end if;
     end process psr;
end shiftr0;