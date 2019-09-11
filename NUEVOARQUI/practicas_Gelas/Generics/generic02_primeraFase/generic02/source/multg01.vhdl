library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity multg01 is
  port(
       clkmult: in std_logic;
	   codopmult: in std_logic_vector(4 downto 0);
	   inmult: in std_logic_vector(15 downto 0);
	   inFlagmult: in std_logic;
	   outmult: out std_logic_vector(15 downto 0);
       outFlagmult: out std_logic);
end multg01;

architecture multg0 of multg01 is
begin
  pmult: process(clkmult, inFlagmult)
  variable aux: bit:='0';
    begin
	  if (clkmult'event and clkmult = '1') then
	    if ((codopmult = "01001")) then
		    if (inFlagmult <= '1') then
			  if (aux = '0') then
			     aux:='1';
				 outmult <= inmult;
				 outFlagmult <= '1';
			  else
			     outFlagmult <= '0';
			  end if;
			else--inFlaga
			  outFlagmult <= '0';
			end if;--inFlaga
		else--codop
		   outmult <= (others => 'Z');
		   outFlagmult <= 'Z';
		   aux:='0';
		end if;--codop
	  end if;
    end process pmult;
end multg0;