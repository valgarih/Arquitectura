library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity ShiftR00 is
  port(
       clksr: in std_logic;
	   codopsr: in std_logic_vector(4 downto 0);
	   corrsr: in std_logic_vector(2 downto 0);
	   portAsr: in std_logic_vector(7 downto 0);
	   inFlagsr: in std_logic;
	   outsr: out std_logic_vector(7 downto 0);
       outFlagsr: out std_logic);
end ShiftR00;

architecture ShiftR0 of ShiftR00 is
begin
  pshiftr: process(clksr, inflagsr, codopsr, corrsr)
  variable aux: bit:='0';
  begin
    if (clksr'event and clksr = '1') then
	  if (codopsr = "01011") then
		if (inFlagsr = '1') then
		  if (aux = '0') then
		    aux:='1';
			outsr <= std_logic_vector(shift_right(unsigned(portAsr),to_integer(unsigned(corrsr))));      
			outFlagsr <= '1';
		  else--aux
		    outFlagsr <= '0';
		  end if;
		else--inFlagx
		  outFlagsr <= '0';
		end if;--inFlagx
	  else--codop
	    aux:='0';
		outFlagsr <='Z';
		outsr <= (others =>'Z');
	  end if;--codop
	end if;
  end process pshiftr;
end ShiftR0;