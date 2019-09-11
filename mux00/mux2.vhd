library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;



entity mux00 is
port(
	Aa:in std_logic_vector(7 downto 0);
	Ba:in std_logic_vector(7 downto 0) ;
	Sel:in std_logic_vector(2 downto 0);
	Ya: out std_logic_vector (7 downto 0);
	Y2: out std_logic_vector (7 downto 0)
	);
end mux00;

architecture mux0 of mux00 is 
	begin
		with Sel select 
		 Ya<=Aa and Ba when "000",
			 Aa or Ba when "001",
			 Aa xor Ba when "010",
			 not(Aa) when "011",
			 Aa nand Ba when "100",
			 Aa nor Ba when "101",
			 Aa xnor Ba when "110",
			 "00000000" when others;	
			Y2<=Ya;
	end mux0;