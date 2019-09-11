library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity lcdmux00 is
	port
	(
		enablem: in std_logic;
		inFlagm: in std_logic;
		inWordConfigm: in std_logic_vector(10 downto 0);
		inWordDatam: in std_logic_vector(10 downto 0);
		outWordm: out std_logic_vector(10 downto 0)
	);
end lcdmux00;

architecture lcdmux0 of lcdmux00 is
signal control: std_logic_vector(1 downto 0);
begin
control <= (enablem)&(inFlagm);
  with control select
    outWordm <= "10101010000" when "00",
	             inWordConfigm when "10",
				 inWordDatam when "11",
				 "10101010000" when others;
end lcdmux0;