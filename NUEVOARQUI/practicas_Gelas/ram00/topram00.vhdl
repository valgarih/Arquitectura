library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
use packageram00.all;

entity topram00 is
port(
	clk00: inout std_logic;
	cdiv00: in std_logic_vector(4 downto 0);
	en0, rw0: in std_logic;
	inkey0: in std_logic_vector(3 downto 0);
	outring0: out std_logic_vector(4 downto 0);
	outled0: out std_logic_vector(4 downto 0);
	outFlag0: inout std_logic;
	inFlag0: inout std_logic;
	outcontcw0: inout std_logic_vector(4 downto 0);
	outcontr0: inout std_logic_vector(4 downto 0);
	outword0: out std_logic_vector(6 downto 0);
	outtransist0: out std_logic_vector(3 downto 0)
	);
end topram00;

architecture topram0 of topram00 is
signal soutring0: std_logic_vector(4 downto 0);
signal soutcontw0: std_logic_vector(4 downto 0);
signal soutcoderWord: std_logic_vector(6 downto 0);
signal soutWordra: std_logic_vector(6 downto 0);
begin 
	outtransist0 <= "1110";
	outring0 <= soutring0;
	outled0 <= soutring0;
	outcontcw0 <= soutcontw0; --contEscritura
	
	W00: toposc00 port map(clk0 => clk00,
						   cdiv0 => cdiv00);
							
	W01: contring00 port map(clks => clk00,
							 en => en0,
							 outr => soutring0);
							 
	W02: coderram00 port map(clkc => clk00,
							 enc => en0,
							 inFlagc => inFlag0,
							 inkey => inkey0,
							 incont => soutring0,
							 outcontc => soutcontw0,
							 outcoder => soutcoderWord,
							 outFlagc => outFlag0);
							 
	W03: ram00 port map(
						clkra => clk00,
						enra => en0,
						rwra => rw0,
						inFlagra => outFlag0,
						indirWra => soutcontw0,
						indirRra => outcontr0,
						inWordra => soutcoderWord,
						outWordra => soutWordra,
						outFlagra => inFlag0);
						
	W04: contRead00 port map(
							clkcr => clk00,
							encr => en0,
							rwcr => rw0,
							limitecr => soutcontw0,
							outcontcr => outcontr0);
							
	W05: muxram00 port map(
							enmux => en0,
							rwmux => rw0,
							inWordkey => soutcoderWord,
							inWordram => soutWordra,
							outwordmux => outword0);
end topram0;