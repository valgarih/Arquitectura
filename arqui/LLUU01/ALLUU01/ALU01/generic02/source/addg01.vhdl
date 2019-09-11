library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;
library machxo2;
use machxo2.all;

entity addg01 is
  port(
       clkad: in std_logic;
	   SLad: in std_logic;
	   codopad: in std_logic_vector(4 downto 0);
	   inFlagad: in std_logic;
	   outsad: in std_logic_vector(7 downto 0);
	   LEDsad: in std_logic;
	   outad: out std_logic_vector(7 downto 0);
	   LEDad: out std_logic;
       outFlagad: out std_logic);
end addg01;

architecture addg0 of addg01 is
begin
  pas: process(clkad, inFlagad)
  variable aux: bit:='0';
    begin
	  if (clkad'event and clkad = '1') then
	    if ((codopad = "00111") and (SLad = '0')) then
		    if (inFlagad <= '1') then
			  if (aux = '0') then
			     aux:='1';
				 outad <= outsad;
				 LEDad <= LEDsad;
				 outFlagad <= '1';
			  else
			     outFlagad <= '0';
			  end if;
			else--inFlaga
			  outFlagad <= '0';
			end if;--inFlaga
		else--codop
		   outad <= (others => 'Z');
		   outFlagad <= 'Z';
		   LEDad <= 'Z';
		   aux:='0';
		end if;--codop
	  end if;
    end process pas;
end addg0;