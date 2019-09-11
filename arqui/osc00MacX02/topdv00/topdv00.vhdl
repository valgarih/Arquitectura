library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;
use packagediv00.all;

entity topdv00 is 
	port(
		 cdiv0: in std_logic_vector(4 downto 0);
		 clk0: inout std_logic);
end topdv00;

architecture topdv0 of topdv00 is 
signal sclk: std_logic;
begin
	
	D00: osc00 port map(osc_int => sclk);
	
	D01: div00 port map(clkdiv => sclk,
					   indiv => cdiv0,
					   outdiv => clk0);
	
end topdv0;
