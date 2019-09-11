library ieee;
use ieee.std_logic_1164.all;

library lattice;
use lattice.all;

entity coder00 is
	port
	(
		incontc: std_logic_vector(3 downto 0);
		outcoder: out std_logic_vector(6 downto 0)
	);
end coder00;

architecture coder0 of coder00 is
begin
	with incontc select
	 outcoder <= "0001000" when "0001", --A
				 "1110001" when "0010", --L
				 "0000001" when "0100", --O
				 "1001000" when "1000", --H
				 "1111111" when others;
end coder0;