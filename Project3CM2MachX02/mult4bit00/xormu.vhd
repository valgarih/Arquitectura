library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity xormu is
	port(
		Axm: in std_logic;
		Bxm: in std_logic;
		Yxm: out std_logic
	);
end xormu;

architecture xorm of xormu is
begin
	Yxm <= Axm xor Bxm;
end xorm;