library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagefamu00.all;

entity famu00 is
	port(
			Cmu00: in std_logic;
			Amu00: in std_logic;
			Bmu00: in std_logic;
			Smu00: out std_logic;
			Cmu01: out std_logic
		);
end famu00;

architecture famu0 of famu00 is
signal Sint1,Cint1,Cint2: std_logic;
begin
	FA00: hamu00 port map
	(
		Amu0=>Amu00,
		Bmu0=>Bmu00,
		Smu0=>Sint1,
		Cmu0=>Cint1
	);
	
	FA01: hamu00 port map
	(
		Amu0=>Cmu00,
		Bmu0=>Sint1,
		Smu0=>Smu00,
		Cmu0=>Cint2
	);
	
	FA02: ormu port map
	(
		Aom=>Cint2,
		Bom=>Cint1,
		Yom=>Cmu01
	);
	
end famu0;