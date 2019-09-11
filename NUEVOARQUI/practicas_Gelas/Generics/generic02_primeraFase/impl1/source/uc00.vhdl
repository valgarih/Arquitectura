library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;

entity uc00 is
  port(
       clkuc: in std_logic;
	   enable: in std_logic;
	   inuc: in std_logic_vector(7 downto 0);
	   inuc2 : in std_logic;
	   inuc3 : in std_logic;
	   inFlaguc: inout std_logic;
       outuc: out std_logic_vector(7 downto 0);
	   outuc2: out std_logic;
	   outuc3: out std_logic;
	   outFlaguc: inout std_logic);
end uc00;

architecture uc0 of uc00 is
begin
   puc: process(clkuc, inFlaguc)
   variable aux: bit:='0';
      begin
	     if (clkuc'event and clkuc = '1') then
		    if (inFlaguc = '1') then
			   if (aux = '0') then
			      aux:= '1';
			      outuc <= inuc;
				  outuc2 <= inuc2;
				  outuc3 <= inuc3;
			      outFlaguc <= '1';
			   end if;
			else
			      outFlaguc <= '0';
				  aux:='0';
			end if;
		 end if;
      end process puc;
end uc0;