library ieee;
use ieee.std_logic_1164.all;

library lattice;
use lattice.all;

use packageshiftLR00.all;

entity topshiftLR00 is 
	port
	(
		clk0: inout std_logic;
		cdiv0: in std_logic_vector(4 downto 0);
		ens0: in std_logic;
		ins0: in std_logic_vector(7 downto 0);
		outs0: out std_logic_vector(7 downto 0)
	);
end topshiftLR00;

architecture topshiftLR0 of topshiftLR00 is
begin
	SLR00: topdiv00 port map
	(
		indiv0 => cdiv0,
		oscout0 => clk0
	);
	
	SLR01: shiftLR00 port map
	(
		clksLR => clk0,
		ens => ens0,
		ins => ins0,
		outs => outs0
	);
end topshiftLR0; 