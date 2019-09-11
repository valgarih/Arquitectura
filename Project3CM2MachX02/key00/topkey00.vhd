library ieee;
use ieee.std_logic_1164.all;

library lattice;
use lattice.all;

use packagekey00.all;

entity topkey00 is
	port
	(
		clk0: inout std_logic;
		cdiv0: in std_logic_vector(4 downto 0);
		en0: in std_logic;
		inkey0: in std_logic_vector(3 downto 0);
		outr0: out std_logic_vector(3 downto 0);
		outcoder0: out std_logic_vector(6 downto 0);
		outcoderled0: out std_logic_vector(6 downto 0);
		outtransist0: out std_logic_vector(3 downto 0)
	);
end topkey00;

architecture topkey0 of topkey00 is
signal soutcr: std_logic_vector(3 downto 0);
signal soutcoder: std_logic_vector(6 downto 0);
begin
	outtransist0 <= "0001";
	outr0 <= soutcr;
	outcoder0 <= soutcoder;
	outcoderled0 <= soutcoder;
	
	K00: topdiv00 port map
	(
		indiv0 => cdiv0,
		oscout0 => clk0
	);
	
	K01: contring00 port map
	(
		clkcr => clk0,
		encr => en0,
		outcr => soutcr
	);
	
	K02: coder00 port map
	(
		clkk => clk0,
		enk => en0,
		inkeyk => inkey0,
		incontk => soutcr,
		outcoderk => soutcoder
	);
end topkey0;