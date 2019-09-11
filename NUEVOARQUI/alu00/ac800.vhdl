library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity ucg01 is
  port(
       clkuc: in std_logic;
	   enableuc: in std_logic;
	   inFlaguc: inout std_logic;
	   inuc: in std_logic_vector(15 downto 0);
	   outuc: out std_logic_vector(15 downto 0);
       outFlaguc: inout std_logic);
end ucg01;

architecture ucg0 of ucg01 is
begin
  puc: process(clkuc)
  variable aux: bit:='0';
  begin
    if (clkuc'event and clkuc = '1') then
	  if ((inFlaguc = '1') or (enableuc = '1')) then
	    if (aux = '0') then
		   aux:='1';
		   outuc <= inuc;
		   outFlaguc <= '1';
		else
		   aux:='0';
		   outFlaguc <= '0';
		end if;--aux
	  else--inFlag
		 outFlaguc <= '0';
	  end if;
	end if;
  end process puc;
end ucg0;