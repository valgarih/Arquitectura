library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity andmu is
	port(
		Aam: in std_logic;
		Bam: in std_logic;
		Yam: out std_logic
	);
end andmu;

architecture andm of andmu is
begin
	Yam <= Aam and Bam;
end andm;