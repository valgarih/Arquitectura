library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity org01 is
  port(
       clko: in std_logic;
	   codopo: in std_logic_vector(4 downto 0);
	   portAo: in std_logic_vector(7 downto 0);
	   portBo: in std_logic_vector(7 downto 0);
	   inFlago: in std_logic;
	   outo: out std_logic_vector(7 downto 0);
       outFlago: out std_logic);
end org01;

architecture org0 of org01 is
begin
  por: process(clko, inFlago)
  variable aux: bit:='0';
    begin
	  if (clko'event and clko = '1') then
	    if (codopo = "00001") then
		    if (inFlago <= '1') then
			  if (aux = '0') then
			     aux:='1';
				 outo <= portAo or portBo;
				 outFlago <= '1';
			  else
			     outFlago <= '0';
			  end if;
			else--inFlaga
			  outFlago <= '0';
			end if;--inFlaga
		else--codop
		   outo <= (others => 'Z');
		   outFlago <= 'Z';
		   aux:='0';
		end if;--codop
	  end if;
    end process por;
end org0;