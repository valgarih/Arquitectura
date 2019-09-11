library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packagefamu00 is
	component hamu00
		port(
			Amu0: in std_logic;
			Bmu0: in std_logic;
			Smu0: out std_logic;
			Cmu0: out std_logic
		);
	end component;
	component ormu
	port(
		Aom: in std_logic;
		Bom: in std_logic;
		Yom: out std_logic
	);
	end component;
end packagefamu00;