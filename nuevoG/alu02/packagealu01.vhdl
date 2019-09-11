library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packagealu01 is
	component toposc00
		port(
			clk0: inout std_logic;
			cdiv0: in std_logic_vector (4 downto 0));
	end component;
	
	component topadder8bit00
		port(
			SL: in std_logic;
			Ai: in std_logic_vector(7 downto 0);
			Bi: in std_logic_vector(7 downto 0);
			So: out std_logic_vector(7 downto 0);
			LED: out std_logic);
	end component;
	
	component topmult8bit00
		port(
			Am: in std_logic_vector(7 downto 0);
			Bm: in std_logic_vector(7 downto 0);
			Rm: out std_logic_vector(15 downto 0));
	end component;
	
	component anda00
		port(clkal: in std_logic;
			opcodeal: in std_logic_vector(4 downto 0);
			portAal: in std_logic_vector(7 downto 0);
			portBal: in std_logic_vector(7 downto 0);
			inFlagal: in std_logic;
			outal: out std_logic_vector(7 downto 0);
			outFlagal: out std_logic);
	end component;
	
	component ora00
		port(clkoral: in std_logic;
			opcodeoral: in std_logic_vector(4 downto 0);
			portAoral: in std_logic_vector(7 downto 0);
			portBoral: in std_logic_vector(7 downto 0);
			inFlagoral: in std_logic;
			outoral: out std_logic_vector(7 downto 0);
			outFlagoral: out std_logic);
	end component;
	
	component xoral00
		port(clkxoral: in std_logic;
			opcodexoral: in std_logic_vector(4 downto 0);
			portAxoral: in std_logic_vector(7 downto 0);
			portBxoral: in std_logic_vector(7 downto 0);
			inFlagxoral: in std_logic;
			outxoral: out std_logic_vector(7 downto 0);
			outFlagxoral: out std_logic);
	end component;
	
	component notal00
		port(clknotal: in std_logic;
			opcodenotal: in std_logic_vector(4 downto 0);
			portAnotal: in std_logic_vector(7 downto 0);
			--portBnotal: in std_logic_vector(7 downto 0);
			inFlagnotal: in std_logic;
			outnotal: out std_logic_vector(7 downto 0);
			outFlagnotal: out std_logic);
	end component;
	
	component nandal00
		port(clknandal: in std_logic;
			opcodenandal: in std_logic_vector(4 downto 0);
			portAnandal: in std_logic_vector(7 downto 0);
			portBnandal: in std_logic_vector(7 downto 0);
			inFlagnandal: in std_logic;
			outnandal: out std_logic_vector(7 downto 0);
			outFlagnandal: out std_logic);
	end component;
	
	component noral00
		port(clknoral: in std_logic;
			opcodenoral: in std_logic_vector(4 downto 0);
			portAnoral: in std_logic_vector(7 downto 0);
			portBnoral: in std_logic_vector(7 downto 0);
			inFlagnoral: in std_logic;
			outnoral: out std_logic_vector(7 downto 0);
			outFlagnoral: out std_logic);
	end component;
	
	component xnoral00
		port(clkxnoral: in std_logic;
			opcodexnoral: in std_logic_vector(4 downto 0);
			portAxnoral: in std_logic_vector(7 downto 0);
			portBxnoral: in std_logic_vector(7 downto 0);
			inFlagxnoral: in std_logic;
			outxnoral: out std_logic_vector(7 downto 0);
			outFlagxnoral: out std_logic);
	end component;
	
	component addal00
		port(
			clkadd: in std_logic;
			opcodeadd: in std_logic_vector(4 downto 0);
			inFlagadd: in std_logic;
			inLEDoverfadd: in std_logic;
			inadd: in std_logic_vector(7 downto 0);
			outadd: out std_logic_vector(7 downto 0);
			outFlagadd: out std_logic;
			outSLadd: out std_logic;
			outLEDoverfadd: out std_logic);
	end component;
	
	component subsal00
		port(
			clksubs: in std_logic;
			opcodesubs: in std_logic_vector(4 downto 0);
			inFlagsubs: in std_logic;
			inLEDoverfsubs: in std_logic;
			insubs: in std_logic_vector(7 downto 0);
			outsubs: out std_logic_vector(7 downto 0);
			outFlagsubs: out std_logic;
			outSLsubs: out std_logic;
			outLEDoverfsubs: out std_logic);
	end component;
	
	component acal00
		port(
			clkacal: in std_logic;
			enacal: in std_logic;
			inacal: in std_logic_vector(7 downto 0);
			inFlagacal: in std_logic;
			outacal: out std_logic_vector(7 downto 0);
			outFlagacal: out std_logic);
	end component;
	
end packagealu01;