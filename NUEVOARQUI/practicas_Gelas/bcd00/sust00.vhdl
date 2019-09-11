library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity sust00 is
	port(
	     clksu: in std_logic;
		 opcodesu: in std_logic_vector(3 downto 0);
		 inAC8su: in std_logic_vector(7 downto 0);
		 inAC12se: in std_logic_vector(11 downto 0);
		 );
end sust00;

architecture sust0 of sust00 is
begin
	
end sust0;