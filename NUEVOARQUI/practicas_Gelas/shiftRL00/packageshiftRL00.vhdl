library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packageshiftRL00 is

	component toposc00
		port(
		 clk0: inout std_logic;
		 cdiv0: in std_logic_vector (4 downto 0));

	end component;
	
	component shiftRL00
		port(
		RD1: in std_logic;
		RD2: in std_logic;
		RL: in std_logic;
		clks: in std_logic;
		en: in std_logic;
		ins: in std_logic_vector(7 downto 0);
		outs: out std_logic_vector(7 downto 0));
	end component;
	
end packageshiftRL00;