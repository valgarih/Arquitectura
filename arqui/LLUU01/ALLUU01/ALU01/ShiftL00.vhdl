library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library lattice;
use lattice.components.all;
library machxo2;
use machxo2.all;

entity ShiftL00 is
  port(
       clksl: in std_logic;
	   codopsl: in std_logic_vector(4 downto 0);
	   corrsl: in std_logic_vector(2 downto 0);
	   portAsl: in std_logic_vector(7 downto 0);
	   inFlagsl: in std_logic;
	   outsl: out std_logic_vector(7 downto 0);
       outFlagsl: out std_logic);
end ShiftL00;

architecture ShiftL0 of ShiftL00 is
begin
  pshiftl: process(clksl, inflagsl, codopsl, corrsl)
  variable aux: bit:='0';
  begin
    if (clksl'event and clksl = '1') then
	  if (codopsl = "01010") then
		if (inFlagsl = '1') then
		  if (aux = '0') then
		    aux:='1';
			outsl <= std_logic_vector(shift_left(unsigned(portAsl),to_integer(unsigned(corrsl))));  
			outFlagsl <= '1';
		  else--aux
		    outFlagsl <= '0';
		  end if;
		else--inFlagx
		  outFlagsl <= '0';
		end if;--inFlagx
	  else--codop
	    aux:='0';
		outFlagsl <='Z';
		outsl <= (others =>'Z');
	  end if;--codop
	end if;
  end process pshiftl;
end ShiftL0;