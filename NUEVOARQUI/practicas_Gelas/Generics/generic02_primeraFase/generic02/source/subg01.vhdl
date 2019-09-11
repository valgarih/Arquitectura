library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity subg01 is
  port(
       clksb: in std_logic;
	   SLsb: in std_logic;
	   codopsb: in std_logic_vector(4 downto 0);
	   inFlagsb: in std_logic;
	   outssb: in std_logic_vector(7 downto 0);
	   LEDssb: in std_logic;
	   outsb: out std_logic_vector(7 downto 0);
	   LEDsb: out std_logic;
       outFlagsb: out std_logic);
end subg01;

architecture subg0 of subg01 is
begin
  psb: process(clksb, inFlagsb)
  variable aux: bit:='0';
    begin
	  if (clksb'event and clksb = '1') then
	    if ((codopsb = "01000") and (SLsb = '1')) then
		    if (inFlagsb <= '1') then
			  if (aux = '0') then
			     aux:='1';
				 outsb <= outssb;
				 LEDsb <= LEDssb;
				 outFlagsb <= '1';
			  else
			     outFlagsb <= '0';
			  end if;
			else--inFlaga
			  outFlagsb <= '0';
			end if;--inFlaga
		else--codop
		   outsb <= (others => 'Z');
		   outFlagsb <= 'Z';
		   LEDsb <= 'Z';
		   aux:='0';
		end if;--codop
	  end if;
    end process psb;
end subg0;