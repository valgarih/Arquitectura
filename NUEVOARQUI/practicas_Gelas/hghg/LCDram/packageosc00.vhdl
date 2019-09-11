library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

package packageosc00 is

	component osc00
		port (osc_int: out std_logic);
	end component;
	
	component div00
		port(
		clkdiv: in std_logic;
		indiv: in std_logic_vector(4 downto 0);
		oscout: inout std_logic);
	end component;

end packageosc00;