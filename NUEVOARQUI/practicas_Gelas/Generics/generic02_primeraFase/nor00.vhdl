library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;

entity nor00 is
  port(
       clkno: in std_logic;
	   codopno: in std_logic_vector(4 downto 0);
	   portAno: in std_logic_vector(7 downto 0);
	   portBno: in std_logic_vector(7 downto 0);
	   inFlagno: in std_logic;
	    
	   outno: out std_logic_vector(7 downto 0);
       outFlagno: out std_logic);
end nor00;

architecture nor0 of nor00 is
begin
   pnor: process(clkno, codopno, inFlagno)
   variable aux: bit:='0';
     begin
	     if (clkno'event and clkno = '1') then
		     if (codopno = "00101") then
			     if (inFlagno = '1') then
				    if (aux = '0') then
					   aux:= '1';
				       outno <= not(portAno or portBno);
				       outFlagno <= '1';
					 else
				       outFlagno <= '1';
				    end if;
				 else
				   outFlagno <= '0';
				 end if;
			 else
			   outno <= (others => 'Z');
			   outFlagno <= 'Z';
			   aux:='0';
			 end if;
		 end if;
     end process pnor;
end nor0;