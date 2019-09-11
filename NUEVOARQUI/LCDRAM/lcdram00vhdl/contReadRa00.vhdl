library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity contReadRa00 is
  port(
       clkrd: in std_logic;
	   enablerd: in std_logic;
	   rwrd: in std_logic;
	   incontWrd: in std_logic_vector(4 downto 0);
       outcontRrd: inout std_logic_vector(4 downto 0);
	   RWcd: out std_logic;
	   RScd: out std_logic;
	   ENcd: out std_logic;
       outFlagcd: out std_logic);
end contReadRa00;

architecture contReadRa0 of contReadRa00 is
begin
  pcontr: process(clkrd)
  variable aux: bit:='0';
  begin
     if (clkrd'event and clkrd = '1') then
	   case enablerd is
	     when '0' =>
		   outcontRrd <= (others => '0');
		 when '1' =>
		   case rwrd is
		     when '0' =>
		       outcontRrd <= (others => '0');
			 when '1' =>
			   if (outcontRrd < incontWrd) then
			     if(aux = '0') then
				   aux:='1';
				   outFlagcd <= '1';
				   RWcd <= '0';
				   RScd <= '1';
				   Encd <= '1';
				 elsif(aux = '1') then
				   aux:='0';
			       outcontRrd <= outcontRrd + '1';
				   outFlagcd <= '0';
				   RWcd <='0';
				   RScd <= '1';
				   ENcd <= '0';
				 end if;
			   else
			     outcontRrd <= outcontRrd;
			   end if;
			 when others => null;
		   end case;
		 when others => null;
	   end case;
	 end if;
  end process pcontr;
end contReadRa0;