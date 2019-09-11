library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;

entity and01 is 
port (
	Aa: in std_logic_vector(7 downto 0);
	Ba: in std_logic_vector(7 downto 0);
	Ya: out std_logic_vector(7 downto 0));
end and01;

architecture and0 of and01 is 
begin
	Ya <= Aa and Ba;
end and0;