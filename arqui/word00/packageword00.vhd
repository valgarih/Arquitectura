library ieee;
use ieee.std_logic_1164.all;

library lattice;
use lattice.all;

package packageword00 is
	component topdiv00
		port
		(
			indiv0: in std_logic_vector(4 downto 0);
			oscout0: inout std_logic
		);
	end component;
	
	component contring00
		port
		(
			clkc: in std_logic;
			enc: in std_logic;
			outc: out std_logic_vector(3 downto 0)
		);
	end component;
	
	component coder00
		port
		(
			incontc: std_logic_vector(3 downto 0);
			outcoder: out std_logic_vector(6 downto 0)
		);
	end component;
end packageword00;