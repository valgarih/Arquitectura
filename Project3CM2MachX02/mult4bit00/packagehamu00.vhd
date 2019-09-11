library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packagehamu00 is
	component xormu
	port
	(
		Axm: in std_logic;
		Bxm: in std_logic;
		Yxm: out std_logic
	);
	end component;
	
	component andmu
	port(
		Aam: in std_logic;
		Bam: in std_logic;
		Yam: out std_logic
	);
	end component;
end packagehamu00;