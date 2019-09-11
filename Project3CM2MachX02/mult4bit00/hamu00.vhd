library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagehamu00.all;

entity hamu00 is
port(
	Amu0: in std_logic;
	Bmu0: in std_logic;
	Smu0: out std_logic;
	Cmu0: out std_logic   
);
end hamu00;

architecture hamu0 of hamu00 is
begin
	H00: xormu port map(Axm=>Amu0,Bxm=>Bmu0,Yxm=>Smu0);
	H01: andmu port map(Aam=>Amu0,Bam=>Bmu0,Yam=>Cmu0);
end hamu0;