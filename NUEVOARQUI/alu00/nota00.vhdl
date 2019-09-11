library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity notg01 is
  port(
       clkn: in std_logic;
	   codopn: in std_logic_vector(4 downto 0);
	   portAn: in std_logic_vector(7 downto 0);
	   inFlagn: in std_logic;
	   outn: out std_logic_vector(7 downto 0);
       outFlagn: out std_logic);
end notg01;

architecture notg0 of notg01 is
begin
  pnot: process(clkn, inflagn, codopn)
  variable aux: bit:='0';
  begin
    if (clkn'event and clkn = '1') then
	  if (codopn = "00011") then
		if (inFlagn = '1') then
		  if (aux = '0') then
		    aux:='1';
			outn <= not portAn;
			outFlagn <= '1';
		  else--aux
		    outFlagn <= '0';
		  end if;
		else--inFlagx
		  outFlagn <= '0';
		end if;--inFlagx
	  else--codop
	    aux:='0';
		outFlagn <='Z';
		outn <= (others =>'Z');
	  end if;--codop
	end if;
  end process pnot;
end notg0;