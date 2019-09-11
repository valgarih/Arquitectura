library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity rotR00 is
  port(
       clkrr: in std_logic;
	   codoprr: in std_logic_vector(4 downto 0);
	   corrrr: in std_logic_vector(2 downto 0);
	   portArr: in std_logic_vector(7 downto 0);
	   inFlagrr: in std_logic;
	   outrr: out std_logic_vector(7 downto 0);
       outFlagrr: out std_logic);
end rotR00;

architecture rotR0 of rotR00 is
begin
  protr: process(clkrr, inflagrr, codoprr, corrrr)
  variable aux: bit:='0';
  begin
    if (clkrr'event and clkrr = '1') then
	  if (codoprr = "01101") then
		if (inFlagrr = '1') then
		  if (aux = '0') then
		    aux:='1';
			outrr <= std_logic_vector(rotate_right(unsigned(portArr),to_integer(unsigned(corrrr))));  
			outFlagrr <= '1';
		  else--aux
		    outFlagrr <= '0';
		  end if;
		else--inFlagx
		  outFlagrr <= '0';
		end if;--inFlagx
	  else--codop
	    aux:='0';
		outFlagrr <='Z';
		outrr <= (others =>'Z');
	  end if;--codop
	end if;
  end process protr;
end rotR0;