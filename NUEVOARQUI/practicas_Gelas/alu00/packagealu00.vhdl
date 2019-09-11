library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packagealu00 is

	component toposc00
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
	
	component xora00
		port(clkxoral: in std_logic;
			 opcodexoral: in std_logic_vector(3 downto 0);
			 portAxoral: in std_logic_vector(7 downto 0);
			 portBxoral: in std_logic_vector(7 downto 0);
			 inFlagxoral: in std_logic;
			 outxoral: out std_logic_vector(7 downto 0);
			 outFlagxoral: out std_logic);
	end component;
	
	component nanda00
		port(clkaal: in std_logic;
			 opcodeaal: in std_logic_vector(3 downto 0);
			 portAaal: in std_logic_vector(7 downto 0);
			 portBaal: in std_logic_vector(7 downto 0);
			 inFlagaal: in std_logic;
			 outaal: out std_logic_vector(7 downto 0);
			 outFlagaal: out std_logic);
	end component;
	
	component nora00
		port(clknoral: in std_logic;
			 opcodenoral: in std_logic_vector(3 downto 0);
			 portAnoral: in std_logic_vector(7 downto 0);
			 portBnoral: in std_logic_vector(7 downto 0);
			 inFlagnoral: in std_logic;
			 outnoral: out std_logic_vector(7 downto 0);
			 outFlagnoral: out std_logic);
	end component;
	
	component xnora00
		port(clkxnoral: in std_logic;
			 opcodexnoral: in std_logic_vector(3 downto 0);
			 portAxnoral: in std_logic_vector(7 downto 0);
			 portBxnoral: in std_logic_vector(7 downto 0);
			 inFlagxnoral: in std_logic;
			 outxnoral: out std_logic_vector(7 downto 0);
			 outFlagxnoral: out std_logic);
	end component;
	
	component nota00
		port(clknotaal: in std_logic;
			 opcodenotaal: in std_logic_vector(3 downto 0);
			 portAnotaal: in std_logic_vector(7 downto 0);
			 inFlagnotaal: in std_logic;
			 outnotaal: out std_logic_vector(7 downto 0);
			 outFlagnotaal: out std_logic);
	end component;
	
	component adder8bita00
		port(clkadderal: in std_logic;
			 opcodeadderal: in std_logic_vector(3 downto 0);
			 portAadderal: in std_logic_vector(7 downto 0);
			 portBadderal: in std_logic_vector(7 downto 0);
			 inFlagadderal: in std_logic;
			 outadderal: out std_logic_vector(7 downto 0);
			 outFlagadderal: out std_logic);
	end component;
	
	component substract8bita00
		port(clksubsal: in std_logic;
			 opcodesubsal: in std_logic_vector(3 downto 0);
			 portAsubsal: in std_logic_vector(7 downto 0);
			 portBsubsal: in std_logic_vector(7 downto 0);
			 inFlagsubsal: in std_logic;
			 outsubsal: out std_logic_vector(7 downto 0);
			 outFlagsubsal: out std_logic);
	end component;
	
	component mult8bita00
		port(clkmultal: in std_logic;
			 opcodemultal: in std_logic_vector(3 downto 0);
			 portAmultal: in std_logic_vector(7 downto 0);
			 portBmultal: in std_logic_vector(7 downto 0);
			 inFlagmultal: in std_logic;
			 outmultal: out std_logic_vector(15 downto 0);
			 outFlagmultal: out std_logic);
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