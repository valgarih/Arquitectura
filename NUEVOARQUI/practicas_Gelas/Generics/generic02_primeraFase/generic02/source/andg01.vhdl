library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity andg01 is
  port(
       clka: in std_logic;
	   codopa: in std_logic_vector(4 downto 0);
	   portAa: in std_logic_vector(7 downto 0);
	   portBa: in std_logic_vector(7 downto 0);
	   inFlaga: in std_logic;
	   outa: out std_logic_vector(7 downto 0);
       outFlaga: out std_logic);
end andg01;

architecture andg0 of andg01 is
begin
  pand: process(clka, inFlaga)
  variable aux: bit:='0';
    begin
	  if (clka'event and clka = '1') then
	    if (codopa = "00000") then
		    if (inFlaga <= '1') then
			  if (aux = '0') then
			     aux:='1';
				 outa <= portAa and portBa;
				 outFlaga <= '1';
			  else
			     outFlaga <= '0';
			  end if;
			else--inFlaga
			  outFlaga <= '0';
			end if;--inFlaga
		else--codop
		   outa <= (others => 'Z');
		   outFlaga <= 'Z';
		   aux:='0';
		end if;--codop
	  end if;
    end process pand;
end andg0;