library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity lcdcontdata00 is
  port(
       clkcd: in std_logic;
	   resetcd: in std_logic;
	   inFlagconfigcd: in std_logic;
	   inFlagdatacd: in std_logic;
	   outcontcd: inout std_logic_vector(4 downto 0);
	   outFlagcd: out std_logic;
	   RWcd: out std_logic;
	   RScd: out std_logic;
       ENcd: out std_logic);
end lcdcontdata00;

architecture lcdcontdata0 of lcdcontdata00 is
begin
  pcontcd: process(clkcd)
  begin
    if (clkcd'event and clkcd = '1') then
	  case resetcd is
	    when '0' =>
		  outcontcd <= "00000";
		  outFlagcd <= '0';
		  RWcd <= '0';
		  RScd <= '0';
		  ENcd <= '0';
		when '1' =>
		  case inFlagconfigcd is
		    when '0' =>
			  outcontcd <= "00000";
			  outFlagcd <= '0';
			  RWcd <= '0';
			  RScd <= '0';
			  ENcd <= '0';
			when '1' =>
			  case inFlagdatacd is
			    when '0' =>
				 if (outcontcd < "01110") then
				  outcontcd <= outcontcd + '1';
				  outFlagcd <= '1';
				  RWcd <= '0';
				  RScd <= '1';
				  ENcd <= '1';
				end if;
				when '1' =>
				  outcontcd <= outcontcd;
				  outFlagcd <= '0';
				  RWcd <= '0';
				  RScd <= '1';
				  ENcd <= '0';
				when others => null;
			  end case;
			when others => null;
		  end case;
		when others => null;
	  end case;
	end if;
  end process pcontcd;
end lcdcontdata0;