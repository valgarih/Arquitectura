library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;



package packagecontrol is
	component topdiv00
		port( 
			clk0: inout std_logic ;
			indiv0: in std_logic_vector ( 4 downto 0 ) );
	end component;
	

	
	component control
		port
	(
		clkc: in std_logic;
		enc: in std_logic;
		outc: out std_logic;
		outc1: out std_logic;
		aux1: out std_logic_vector(4 downto 0)
	);
	end component;
end packagecontrol;

