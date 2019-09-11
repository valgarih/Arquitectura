library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;

entity Mux is 
port (
	Sel: in std_logic_vector(2 downto 0);
	Am: in std_logic_vector(7 downto 0);
	Bm: in std_logic_vector(7 downto 0);
	Ym: out std_logic_vector(7 downto 0));
end Mux;

architecture Mux0 of Mux is 
begin
	with sel select
		Ym <= Am and Bm when "000",
			  Am or Bm  when "001",
			  Am xor Bm  when "010",
			  Am nand Bm when "011",
			  Am nor Bm when "100",
			  Am xnor Bm when "101",
			  not (Am) when "110",
			  "00000000" when others;
end Mux0;