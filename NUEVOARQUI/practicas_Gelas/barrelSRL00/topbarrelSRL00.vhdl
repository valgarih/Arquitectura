library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagebarrelSRL00.all;

entity topbarrelSRL00 is
	port(
		 rl0: in std_logic;
		 rd1: in std_logic;
		 rd2: in std_logic;
		 clk00: inout std_logic;
		 cdiv00: in std_logic_vector (4 downto 0);
		 en0: in std_logic;
		 control0: in std_logic_vector (3 downto 0);
		 ins0: in std_logic_vector (7 downto 0);
		 outs0: out std_logic_vector (7 downto 0)
		 );
	
end topbarrelSRL00;

architecture topbarrelSRL0 of topbarrelSRL00 is
begin

BSRL00: toposc00 port map(clk0 => clk00,
						  cdiv0 => cdiv00);

BSRL01: barrelSRL00 port map(
							 RL => rl0,
							 RD1 => rd1,
							 RD2 => rd2,
							 clks => clk00,
							 en => en0,
							 control => control0,
							 ins => ins0,
							 outs => outs0);
end topbarrelSRL0;

