library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;

entity or01 is 
port (
	Aa: in std_logic_vector(7 downto 0);
	Ba: in std_logic_vector(7 downto 0);
	Ya: out std_logic_vector(7 downto 0));
end or01;

architecture or0 of or01 is 
begin
	Ya <= Aa or Ba;
end or0;