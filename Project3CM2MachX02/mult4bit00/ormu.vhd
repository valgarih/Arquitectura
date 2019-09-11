library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity ormu is
port(
	Aom: in std_logic;
	Bom: in std_logic;
	Yom: out std_logic
);
end ormu;

architecture orm of ormu is
begin
	Yom <= Aom or Bom;
end orm;