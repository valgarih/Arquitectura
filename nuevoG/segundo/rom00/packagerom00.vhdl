library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packagerom00 is
	
	component toposc00
	port(
		 clk0: inout std_logic;
		 cdiv0: in std_logic_vector (4 downto 0));
	end component;
	
	
	
	component rom00
	port(
		clkro: in std_logic;
		enro: in std_logic;
		indirRro: in std_logic_vector(4 downto 0);
		outwordro: out std_logic_vector(6 downto 0)
	);
	end component;
	
	
	component contRead00
	
	
	port (
		clkcr: in std_logic;
		encr: in std_logic;
		outcr: inout std_logic_vector (4 downto 0)
		);
	
	end component;
end packagerom00;
