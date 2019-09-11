library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;

entity or00 is
  port(
       clko: in std_logic;
	   codopo: in std_logic_vector(4 downto 0);
	   portAo: in std_logic_vector(7 downto 0);
	   portBo: in std_logic_vector(7 downto 0);
	   inFlago: in std_logic;
	   outo: out std_logic_vector(7 downto 0);
	    
       outFlago: out std_logic);
end or00;

architecture or0 of or00 is
begin
   por: process(clko, codopo, inFlago)
   variable aux: bit:='0';
     begin
	     if (clko'event and clko = '1') then
		     if (codopo = "00011") then
			     if (inFlago = '1') then
				    if (aux = '0') then
					   aux:= '1';
				       outo <= portAo or portBo;
				       outFlago <= '1';
					 else
				       outFlago <= '1';
				    end if;
				 else
				   outFlago <= '0';
				 end if;
			 else
			   outo <= (others => 'Z');
			   outFlago <= 'Z';
			   aux:='0';
			 end if;
		 end if;
     end process por;
end or0;