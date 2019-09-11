library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packagemult4bit00 is
	component andmu
		port
		(
			Aam: in std_logic;
			Bam: in std_logic;
			Yam: out std_logic
		);
	end component;
	
	component famu00
		port
		(
			Cmu00: in std_logic;
			Amu00: in std_logic;
			Bmu00: in std_logic;
			Smu00: out std_logic;
			Cmu01: out std_logic
		);
	end component;
end packagemult4bit00;