library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library lattice;
use lattice.components.all;
library machxo2;
use machxo2.all;

entity rotL00 is
  port(
       clkrl: in std_logic;
	   codoprl: in std_logic_vector(4 downto 0);
	   corrrl: in std_logic_vector(2 downto 0);
	   portArl: in std_logic_vector(7 downto 0);
	   inFlagrl: in std_logic;
	   outrl: out std_logic_vector(7 downto 0);
       outFlagrl: out std_logic);
end rotL00;

architecture rotL0 of rotL00 is
begin
  protl: process(clkrl, inflagrl, codoprl, corrrl)
  variable aux: bit:='0';
  begin
    if (clkrl'event and clkrl = '1') then
	  if (codoprl = "01100") then
		if (inFlagrl = '1') then
		  if (aux = '0') then
		    aux:='1';
			outrl <= std_logic_vector(rotate_left(unsigned(portArl),to_integer(unsigned(corrrl))));      
			outFlagrl <= '1';
		  else--aux
		    outFlagrl <= '0';
		  end if;
		else--inFlagx
		  outFlagrl <= '0';
		end if;--inFlagx
	  else--codop
	    aux:='0';
		outFlagrl <='Z';
		outrl <= (others =>'Z');
	  end if;--codop
	end if;
  end process protl;
end rotL0;