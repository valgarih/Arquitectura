library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;

entity not00 is
  port(
       clkn: in std_logic;
	   codopn: in std_logic_vector(4 downto 0);
	   portAn: in std_logic_vector(7 downto 0);
	   inFlagn: in std_logic;
	   outn: out std_logic_vector(7 downto 0);
	    
       outFlagn: out std_logic);
end not00;

architecture not0 of not00 is
begin
   pnot: process(clkn, codopn, inFlagn)
   variable aux: bit:='0';
     begin
	     if (clkn'event and clkn = '1') then
		     if (codopn = "00010") then
			     if (inFlagn = '1') then
				    if (aux = '0') then
					   aux:= '1';
				       outn <= not(portAn);
				       outFlagn <= '1';
					 else
				       outFlagn <= '1';
				    end if;
				 else
				   outFlagn <= '0';
				 end if;
			 else
			   outn <= (others => 'Z');
			   outFlagn <= 'Z';
			   aux:='0';
			 end if;
		 end if;
     end process pnot;
end not0;