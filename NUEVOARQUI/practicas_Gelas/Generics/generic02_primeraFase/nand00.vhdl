library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;

entity nand00 is
  port(
       clkna: in std_logic;
	   codopna: in std_logic_vector(4 downto 0);
	   portAna: in std_logic_vector(7 downto 0);
	   portBna: in std_logic_vector(7 downto 0);
	   inFlagna: in std_logic;
	   outna: out std_logic_vector(7 downto 0);
	    
       outFlagna: out std_logic);
end nand00;

architecture nand0 of nand00 is
begin
   pnand: process(clkna, inFlagna, codopna)
   variable aux: bit:='0';
      begin
	     if (clkna'event and clkna = '1') then
		    if (codopna = "00100") then
			   if (inFlagna = '1') then
			     if (aux = '0') then
				    aux:='1';
			        outna <= not(portAna and portBna);
				    outFlagna <= '1';
				 else
				   outFlagna <= '1';
				 end if;
			   else
			     outFlagna <= '0';
			   end if;
			else
			   outna <= (others => 'Z');
			   outFlagna <= 'Z';
			   aux:='0';
			end if;
		 end if;
   end process pnand;
end nand0;