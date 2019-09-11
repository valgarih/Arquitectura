library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;
library machxo2;
use machxo2.all;

entity xnorg01 is
  port(
       clkxn: in std_logic;
	   codopxn: in std_logic_vector(4 downto 0);
	   portAxn: in std_logic_vector(7 downto 0);
	   portBxn: in std_logic_vector(7 downto 0);
	   inFlagxn: in std_logic;
	   outxn: out std_logic_vector(7 downto 0);
       outFlagxn: out std_logic);
end xnorg01;

architecture xnorg0 of xnorg01 is
begin
  pxnor: process(clkxn, inflagxn, codopxn)
  variable aux: bit:='0';
  begin
    if (clkxn'event and clkxn = '1') then
	  if (codopxn = "00110") then
		if (inFlagxn = '1') then
		  if (aux = '0') then
		    aux:='1';
			outxn <= portAxn xnor portBxn;
			outFlagxn <= '1';
		  else--aux
		    outFlagxn <= '0';
		  end if;
		else--inFlagx
		  outFlagxn <= '0';
		end if;--inFlagx
	  else--codop
	    aux:='0';
		outFlagxn <='Z';
		outxn <= (others =>'Z');
	  end if;--codop
	end if;
  end process pxnor;
end xnorg0;