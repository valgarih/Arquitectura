library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.components.all;

entity rotr00 is
  port(
       clkrr: in std_logic;
	   codoprr: in std_logic_vector(4 downto 0);
	   portArr: in std_logic_vector(7 downto 0);
	   inFlagrr: in std_logic;
	    
	   outrr: inout std_logic_vector(7 downto 0);
       outFlagrr: out std_logic);
end rotr00;

architecture rotr0 of rotr00 is
begin
   prr: process(clkrr, codoprr, inFlagrr)
   variable aux: bit:='0';
     begin
	     if (clkrr'event and clkrr = '1') then
		     if (codoprr = "01001") then
				--outrr <= portArr(7 downto 0);
			     if (inFlagrr = '1') then
				    if (aux = '0') then
						aux:= '1';
						outrr <= portArr;
				       outFlagrr <= '1';
					 else
				       outFlagrr <= '1';
				    end if;
				 else
					--outrr(0) <= portArr(0);
						outrr(7) <= portArr(0);
						outrr(6 downto 0) <= portArr(7 downto 1);
				   outFlagrr <= '0';
				 end if;
			 else
			   outrr <= (others => 'Z');
			   outFlagrr <= 'Z';
			   aux:='0';
			 end if;
		 end if;
     end process prr;
end rotr0;