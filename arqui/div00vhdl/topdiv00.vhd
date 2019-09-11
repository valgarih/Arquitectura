library ieee;
use ieee.std_logic_1164.all;

library lattice;
use lattice.all;

use packagediv00.all;

entity topdiv00 is
	port
	(
		indiv0: in std_logic_vector(4 downto 0);
		oscout0: inout std_logic;
		indiv1: in std_logic_vector(4 downto 0);
		oscout1: inout std_logic
	);
end topdiv00;

architecture topdiv0 of topdiv00 is
signal sclk: std_logic;
begin
	D00: osc00 port map
	(
		osc_int => sclk
	);
	
	D01: div00 port map 
	(
		clkdiv => sclk,
		outosc => oscout0,
		indiv => indiv0
	);
	
	D02: div01 port map 
	(
		clkdiv1 => sclk,
		outosc1 => oscout1,
		indiv1 => indiv1
	);
end topdiv0;