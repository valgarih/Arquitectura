library ieee;
use ieee.std_logic_1164.all;

library lattice;
use lattice.all;

package packagebarrelRL00 is
	component topdiv00
		port
		(
			indiv0: in std_logic_vector(4 downto 0);
			oscout0: inout std_logic
		);
	end component;
	
	component barrelRL00
		port
		(
			clksRL: in std_logic;
			ens: in std_logic;
			ins: in std_logic_vector(7 downto 0);
			notimes: in std_logic_vector(3 downto 0);
			outs: out std_logic_vector(7 downto 0)
		);
	end component;
end packagebarrelRL00;