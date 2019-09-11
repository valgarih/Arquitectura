library ieee;
use ieee.std_logic_1164.all;

library lattice;
use lattice.all;

package packagekey00 is
	component topdiv00
		port
		(
			indiv0: in std_logic_vector(4 downto 0);
			oscout0: inout std_logic
		);
	end component;
	
	component shiftRL00
		port
		(
			clkcr: in std_logic;
			encr: in std_logic;
			outcr: out std_logic_vector(3 downto 0)
		);
	end component;
	
	component coder00
		port
		(
			clkk: in std_logic;
			enk: in std_logic;
			inkeyk: in std_logic_vector(3 downto 0);
			incontk: in std_logic_vector(3 downto 0);
			outcoderk: out std_logic_vector(7 downto 0)
		);
	end component;
end packagekey00;