library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;

entity multicomb00 is
  port(
       clkmc: in std_logic;
	   codopmc: in std_logic_vector(4 downto 0);
	   portAmc: in std_logic_vector(7 downto 0);
	   inFlagmc: in std_logic;
	   outmc: out std_logic_vector(7 downto 0);
       outFlagmc: out std_logic);
end multicomb00;

architecture multicomb0 of multicomb00 is
begin
						
   pmc: process(clkmc, codopmc, inFlagmc)
   variable aux: bit:='0';
     begin
	     if (clkmc'event and clkmc = '1') then
		     if (codopmc = "01101") then
			     if (inFlagmc = '1') then
				    if (aux = '0') then
					   aux:= '1';
				       
					    outmc <= portAmc;
				       
					   outFlagmc <= '1';
					 else
				       outFlagmc <= '1';
				    end if;
				 else
				   outFlagmc <= '0';
				 end if;
			 else
			   outmc <= (others => 'Z');
			   outFlagmc <= 'Z';
			   aux:='0';
			 end if;
		 end if;
     end process pmc;
end multicomb0;