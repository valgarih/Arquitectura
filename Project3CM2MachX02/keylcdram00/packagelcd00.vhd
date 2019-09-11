library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packagelcd00 is

	component topdiv00
		port
		(
		indiv0: in std_logic_vector(4 downto 0);
		oscout0: inout std_logic
		);
	end component;
	
	component shiftRL00
		port
		(
			clkcr: in std_logic;
			encr: in std_logic;
			outcr: out std_logic_vector(5 downto 0)
		);
	end component;
	
	component coder00
		port
		(
			clkk: in std_logic;
			enk: in std_logic;
			rwc: in std_logic;
			inkeyk: in std_logic_vector(12 downto 0);
			incontk: in std_logic_vector(5 downto 0);
			outcoderk: out std_logic_vector(7 downto 0);
			outcontr: inout std_logic_vector(4 downto 0)
		);
	end component;
  
	component lcdContConfig00
		port
		(
			clkcc: in std_logic;
			enablecc: in std_logic;
			inFlagcc: in std_logic;
			outcontcc: inout std_logic_vector(4 downto 0)
		);
	end component;
  
	component lcdConfig00
		port
		(
			clkcf: in std_logic;
			enablecf: in std_logic;
			incontcf: in std_logic_vector(4 downto 0);
			commandcf: out std_logic_vector(10 downto 0);
			outFlagcf: out std_logic
		);
	end component;

	component lcdData00
		port
		(
			clkw: in std_logic;
			enablew: in std_logic;
			rwdata: in std_logic;
			inFlagw: in std_logic;
			inWordw: in std_logic_vector(7 downto 0);
			outWordw: out std_logic_vector(10 downto 0)
		);
	end component;
  
	component lcdmux00
		port
		(
			enablem: in std_logic;
			inFlagm: in std_logic;
			inWordConfigm: in std_logic_vector(10 downto 0);
			inWordDatam: in std_logic_vector(10 downto 0);
			outWordm: out std_logic_vector(10 downto 0)
		);
	end component;
	
	component ram00
		port
		(
			clkra: in std_logic;
			enra: in std_logic;
			rwra: in std_logic;
			inwordra: in std_logic_vector(10 downto 0);
			indirWra: in std_logic_vector(4 downto 0);
			indirRra: in std_logic_vector(4 downto 0);
			outwordra: out std_logic_vector(10 downto 0)
		);
	end component;
	
	component contread00
		port
		(
			clkrd: in std_logic;
			enrd: in std_logic;
			rwrd: in std_logic;
			incontkeyrd: in std_logic_vector(4 downto 0);
			outcontrd: inout std_logic_vector(4 downto 0)
		);	
	end component;
end packagelcd00;