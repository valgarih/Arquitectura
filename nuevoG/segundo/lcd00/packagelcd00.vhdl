library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

package  packagelcd00 is

	component toposc00
		port(clk0: inout std_logic;
			 cdiv0: in std_logic_vector(4 downto 0));
	end component;

	component lcdcontconfig00
		port(clkcc: in std_logic;
			 resetcc: in std_logic;
			 inFlagcc: in std_logic;
			 outcontcc: inout std_logic_vector(4 downto 0);
			 outFlagcc: out std_logic);
	end component;
		
	component lcdconfig00
		port(clkc: in std_logic;
			 resetc: in std_logic;
			 inFlagc: in std_logic;
			 incontc: in std_logic_vector(4 downto 0);
			 outwordconfigc: out std_logic_vector(7 downto 0);
			 outFlagc: out std_logic;
			 RWc: out std_logic;
			 RSc: out std_logic;
			 ENc: out std_logic);
	end component;
	
	component lcdcontdata00
		port(clkcd: in std_logic;
			 resetcd:in std_logic;
			 inFlagconfigcd: in std_logic;
			 inFlagdatacd: in std_logic;
			 outcontcd: inout std_logic_vector(5 downto 0);
			 --outcontcd: inout std_logic_vector(4 downto 0);
			 outFlagcd: out std_logic;
			 RWcd: out std_logic;
			 RScd: out std_logic;
			 ENcd: out std_logic);
	end component;
	
	component lcddata00
		port(clkd: in std_logic;
			 resetd: in std_logic;
			 inFlagconfigd: in std_logic;
			 inFlagdatad: in std_logic;
			 indird: in std_logic_vector(5 downto 0);
			 --indird: in std_logic_vector(4 downto 0);
			 outwordd: out std_logic_vector(7 downto 0);
			 outFlagd: out std_logic);
	end component;
	
	component lcdmux00
		port(inFlagconfigm: in std_logic;
			 resetm: in std_logic;
			 inWordconfigm: in std_logic_vector(7 downto 0);
			 inWorddatam: in std_logic_vector(7 downto 0);
			 RWc: in std_logic;
			 RSc: in std_logic;
			 ENc: in std_logic;
			 RWd: in std_logic;
			 RSd: in std_logic;
			 ENdd: in std_logic;
			 outWordm: out std_logic_vector(7 downto 0);
			 RWm: out std_logic;
			 RSm: out std_logic;
			 ENm: out std_logic);
	end component;

end packagelcd00;