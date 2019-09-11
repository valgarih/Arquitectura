library ieee;
use ieee.std_logic_1164.all;

library lattice;
use lattice.all;

use packagesequence00.all;

entity topsequence00 is 
	port
	(
		clk: inout std_logic;
		cdiv: in std_logic_vector(4 downto 0);
		ens: in std_logic;
		ins: in std_logic_vector(7 downto 0);
		outs: out std_logic_vector(7 downto 0);
		outseq: inout std_logic;
		outassert: out std_logic
	);
end topsequence00;

architecture topsequence0 of topsequence00 is
begin
	S00: topshiftRL00 port map
	(
		clk0 => clk,
		cdiv0 => cdiv,
		ens0 => ens,
		ins0 => ins,
		outs0 => outs,
		outseq0 => outseq
	);
	
	S01: sequence00 port map
	(
		clkS => clk,
		enS => ens,
		seq => outseq,
		detected => outassert
	);
end topsequence0; 