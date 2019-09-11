library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;
library machxo2;
use machxo2.all;

entity norg01 is
  port(
       clkno: in std_logic;
	   codopno: in std_logic_vector(4 downto 0);
	   portAno: in std_logic_vector(7 downto 0);
	   portBno: in std_logic_vector(7 downto 0);
	   inFlagno: in std_logic;
	   outno: out std_logic_vector(7 downto 0);
       outFlagno: out std_logic);
end norg01;

architecture norg0 of norg01 is
begin
  pnor: process(clkno, inflagno, codopno)
  variable aux: bit:='0';
  begin
    if (clkno'event and clkno = '1') then
	  if (codopno = "00101") then
		if (inFlagno = '1') then
		  if (aux = '0') then
		    aux:='1';
			outno <= portAno nor portBno;
			outFlagno <= '1';
		  else--aux
		    outFlagno <= '0';
		  end if;
		else--inFlagx
		  outFlagno <= '0';
		end if;--inFlagx
	  else--codop
	    aux:='0';
		outFlagno <='Z';
		outno <= (others =>'Z');
	  end if;--codop
	end if;
  end process pnor;
end norg0;