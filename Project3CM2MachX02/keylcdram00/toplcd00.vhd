library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagelcd00.all;

entity toplcd00 is
	port
	(
		clk0: inout std_logic;
		cdiv0: in std_logic_vector(4 downto 0);
		en0: in std_logic;
		rw0: in std_logic;
		outFlagConfig0: inout std_logic;
		outContConfig0: inout std_logic_vector(4 downto 0);
		outWordlcd0: out std_logic_vector(10 downto 0);
		inkey0: in std_logic_vector(12 downto 0);
		outcont0: out std_logic_vector(5 downto 0)
	);
end toplcd00;

architecture toplcd0 of toplcd00 is
signal sWordConfig: std_logic_vector(10 downto 0);
signal sWordData: std_logic_vector(10 downto 0);
signal sWordDataCOD: std_logic_vector(7 downto 0);
signal sWordDataRam: std_logic_vector(10 downto 0);
signal scont: std_logic_vector(5 downto 0);
signal soutcontr: std_logic_vector(4 downto 0);
signal soutpointer: std_logic_vector(4 downto 0);
begin
outcont0 <= scont;

	LC00: topdiv00 port map
	(
		oscout0 => clk0,
		indiv0 => cdiv0
	);
	
	LC01: shiftRL00 port map
	(
		clkcr => clk0,
		encr => en0,
		outcr => scont
	);
	
	LC02: lcdContConfig00 port map
	(
		clkcc => clk0,
		enablecc => en0,
		inFlagcc => outFlagConfig0,
		outcontcc => outContConfig0
	);

	LC03: lcdConfig00 port map
	(
		clkcf => clk0,
		enablecf => en0,
		incontcf => outContConfig0,
		commandcf => sWordConfig,
		outFlagcf => outFlagConfig0
	);
	
	LC04: coder00 port map
	(
		clkk => clk0,
		enk => en0,
		rwc => rw0,
		inkeyk => inkey0,
		incontk => scont,
		outcoderk => sWordDataCOD,
		outcontr => soutcontr
	); 
	
	LC05: ram00 port map
	(
		clkra => clk0,
		enra => en0,
		rwra => rw0,
		inwordra => sWordData,
		indirWra => soutcontr,
		indirRra => soutpointer,
		outwordra => sWordDataRam 
	);
	
	LC06: contread00 port map
	(
		clkrd => clk0,
		enrd => en0,
		rwrd => rw0, 
		incontkeyrd => soutcontr,
		outcontrd => soutpointer 	
	);
	
	LC07: lcdData00 port map
	(
		clkw => clk0,
		enablew => en0,
		rwdata => rw0,
		inFlagw => outFlagConfig0,
		inWordw => sWordDataCOD,
		outWordw => sWordData
	);
	
	LC08: lcdmux00 port map
	(
		enablem => en0,
		inFlagm => outFlagConfig0,
		inWordConfigm => sWordConfig,
		inWordDatam => sWordDataRam,
		outWordm => outWordlcd0
	);
end toplcd0;