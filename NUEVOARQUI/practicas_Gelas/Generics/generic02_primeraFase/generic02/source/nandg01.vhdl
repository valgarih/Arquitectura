library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity nandg01 is
  port(
       clkna: in std_logic;
	   codopna: in std_logic_vector(4 downto 0);
	   portAna: in std_logic_vector(7 downto 0);
	   portBna: in std_logic_vector(7 downto 0);
	   inFlagna: in std_logic;
	   outna: out std_logic_vector(7 downto 0);
       outFlagna: out std_logic);
end nandg01;

architecture nandg0 of nandg01 is
begin
  pnand: process(clkna, inflagna, codopna)
  variable aux: bit:='0';
  begin
    if (clkna'event and clkna = '1') then
	  if (codopna = "00100") then
		if (inFlagna = '1') then
		  if (aux = '0') then
		    aux:='1';
			outna <= portAna nand portBna;
			outFlagna <= '1';
		  else--aux
		    outFlagna <= '0';
		  end if;
		else--inFlagx
		  outFlagna <= '0';
		end if;--inFlagx
	  else--codop
	    aux:='0';
		outFlagna <='Z';
		outna <= (others =>'Z');
	  end if;--codop
	end if;
  end process pnand;
end nandg0;