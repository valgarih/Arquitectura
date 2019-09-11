library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;
library machxo2;
use machxo2.all;

entity xorg01 is
  port(
       clkx: in std_logic;
	   codopx: in std_logic_vector(4 downto 0);
	   portAx: in std_logic_vector(7 downto 0);
	   portBx: in std_logic_vector(7 downto 0);
	   inFlagx: in std_logic;
	   outx: out std_logic_vector(7 downto 0);
       outFlagx: out std_logic);
end xorg01;

architecture xorg01 of xorg01 is
begin
  pxor: process(clkx, inflagx, codopx)
  variable aux: bit:='0';
  begin
    if (clkx'event and clkx = '1') then
	  if (codopx = "00010") then
		if (inFlagx = '1') then
		  if (aux = '0') then
		    aux:='1';
			outx <= portAx xor portBx;
			outFlagx <= '1';
		  else--aux
		    outFlagx <= '0';
		  end if;
		else--inFlagx
		  outFlagx <= '0';
		end if;--inFlagx
	  else--codop
	    aux:='0';
		outFlagx <='Z';
		outx <= (others =>'Z');
	  end if;--codop
	end if;
  end process pxor;
end xorg01;