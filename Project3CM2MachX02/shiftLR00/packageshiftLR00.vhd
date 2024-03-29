library ieee;
use ieee.std_logic_1164.all;

library lattice;
use lattice.all;

package packageshiftLR00 is
	component topdiv00
		port
		(
			indiv0: in std_logic_vector(4 downto 0);
			oscout0: inout std_logic
		);
	end component;
	
	component shiftLR00
		port
		(
			clksLR: in std_logic;
			ens: in std_logic;
			ins: in std_logic_vector(7 downto 0);
			outs: out std_logic_vector(7 downto 0)
		);
	end component;
end packageshiftLR00;