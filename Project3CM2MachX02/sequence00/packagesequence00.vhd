library ieee;
use ieee.std_logic_1164.all;

library lattice;
use lattice.all;

package packagesequence00 is
	component topshiftRL00
		port
		(
			clk0: inout std_logic;
			cdiv0: in std_logic_vector(4 downto 0);
			ens0: in std_logic;
			ins0: in std_logic_vector(7 downto 0);
			outs0: out std_logic_vector(7 downto 0);
			outseq0: out std_logic
		);
	end component;
	
	component sequence00
		port
		(  
			clkS: in std_logic;  
			enS: in std_logic;   
			seq: in std_logic;   
			detected: out std_logic 
		 );
	end component;
end packagesequence00;