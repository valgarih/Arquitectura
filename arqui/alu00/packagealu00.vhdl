library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packagealu00 is

	component topdv00
		port(clk0: inout std_logic;
			 cdiv0: in std_logic_vector(4 downto 0));
	end component;
	
	component anda00
		port(clkal: in std_logic;
			 opcodeal: in std_logic_vector(3 downto 0);
			 portAal: in std_logic_vector(7 downto 0);
			 portBal: in std_logic_vector(7 downto 0);
			 inFlagal: in std_logic;
			 outal: out std_logic_vector(7 downto 0);
			 outFlagal: out std_logic);
	end component;
	
	component ora00
		port(clkoral: in std_logic;
			 opcodeoral: in std_logic_vector(3 downto 0);
			 portAoral: in std_logic_vector(7 downto 0);
			 portBoral: in std_logic_vector(7 downto 0);
			 inFlagoral: in std_logic;
			 outoral: out std_logic_vector(7 downto 0);
			 outFlagoral: out std_logic);
	end component;
	
	component ac800
		port(clkac: in std_logic;
			 enac: in std_logic;
			 inac: in std_logic_vector(7 downto 0);
			 inFlagac: in std_logic;
			 outac: out std_logic_vector(7 downto 0);
			 outFlagac: out std_logic);
	end component;

end packagealu00;