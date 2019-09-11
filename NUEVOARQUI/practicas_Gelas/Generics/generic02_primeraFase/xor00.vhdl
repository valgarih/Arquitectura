library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;

entity xor00 is
  port(
       clkx: in std_logic;
	   codopx: in std_logic_vector(4 downto 0);
	   portAx: in std_logic_vector(7 downto 0);
	   portBx: in std_logic_vector(7 downto 0);
	   inFlagx: in std_logic;
	   outx: out std_logic_vector(7 downto 0);
	    
       outFlagx: out std_logic);
end xor00;

architecture xor0 of xor00 is
begin
   pxor: process(clkx, codopx, inFlagx)
   variable aux: bit:='0';
     begin
	     if (clkx'event and clkx = '1') then
		     if (codopx = "00001") then
			     if (inFlagx = '1') then
				    if (aux = '0') then
					   aux:= '1';
				       outx <= portAx xor portBx;
				       outFlagx <= '1';
					 else
				       outFlagx <= '1';
				    end if;
				 else
				   outFlagx <= '0';
				 end if;
			 else
			   outx <= (others => 'Z');
			   outFlagx <= 'Z';
			   aux:='0';
			 end if;
		 end if;
     end process pxor;
end xor0;