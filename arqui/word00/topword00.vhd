library ieee;
use ieee.std_logic_1164.all;

library lattice;
use lattice.all;

use packageword00.all;

entity topword00 is
	port
	(
		clk0: inout std_logic;
		cdiv0: in std_logic_vector(4 downto 0);
		enc0: in std_logic;
		outtransist0: inout std_logic_vector(3 downto 0);
		outtransistled0: inout std_logic_vector(3 downto 0);
		outcoder0: out std_logic_vector(6 downto 0)
	);
end topword00;

architecture topword0 of topword00 is
signal scontcr: std_logic_vector(3 downto 0);
begin
	
	outtransist0 <= scontcr;
	outtransistled0 <= scontcr;
	
	W00: topdiv00 port map
	(
		oscout0 => clk0,
		indiv0 => cdiv0
	);
	
	W01: contring00 port map
	(
		clkc => clk0,
		enc => enc0,
		outc => scontcr
	);
	
	W02: coder00 port map
	(
		incontc => scontcr,
		outcoder => outcoder0
	);
end topword0;