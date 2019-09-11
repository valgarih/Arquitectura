library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
use packagelcd00.all;

entity toplcd00 is
port(clk00 : inout std_logic;
	 cdiv00: in std_logic_vector(4 downto 0);
	 reset0: in std_logic;
	 outFlagContconfig0: inout std_logic;
	 outContConfig0: inout std_logic_vector(4 downto 0);
	 outFlagConfig0: inout std_logic;
	 outFlagContdata0: inout std_logic;
	 outcontdata0: inout std_logic_vector(5 downto 0);
	 --outcontdata0: inout std_logic_vector(4 downto 0);
	 outFlagdata0: inout std_logic;
	 outWordlcd0: out std_logic_vector(7 downto 0);
	 outWordLED0: out std_logic_vector(7 downto 0);
	 ENled0: out std_logic;
	 RW0: out std_logic;
	 RS0: out std_logic;
	 EN0: out std_logic);
end toplcd00;


architecture toplcd0 of toplcd00 is
signal sword0: std_logic_vector(7 downto 0);
signal swordconfig: std_logic_vector(7 downto 0);
signal sworddata: std_logic_vector(7 downto 0);
signal sEN0: std_logic;
signal sRWc, sRSc, sENc: std_logic;
signal sRWd, sRSd, sENd: std_logic;
begin

outWordlcd0 <= sword0;
outWordLED0 <= sword0;
ENled0 <= sEN0;
EN0 <= sEN0;
	
    L00: toposc00 port map(clk0 => clk00,
						   cdiv0 => cdiv00);

	L01: lcdcontconfig00 port map(clkcc => clk00,
								  resetcc => reset0,
								  inFlagcc => outFlagConfig0,
								  outcontcc => outContConfig0,
								  outFlagcc => outFlagContconfig0);
	
	L02: lcdconfig00 port map(clkc => clk00,
							  resetc => reset0,
							  inFlagc => outFlagContconfig0,
							  incontc => outContConfig0,
							  outwordconfigc => swordconfig,
							  outFlagc => outFlagConfig0,
							  RWc => sRWc,
							  RSc => sRSc,
							  ENc => sENc);
	
	L03: lcdcontdata00 port map(clkcd => clk00,
								resetcd => reset0,
								inFlagconfigcd => outFlagConfig0,
								inFlagdatacd => outFlagdata0,
								outcontcd => outcontdata0,
								outFlagcd => outFlagContdata0,
								RWcd => sRWd,
								RScd => sRSd,
								ENcd => sENd);
	
	L04: lcddata00 port map(clkd => clk00,
							resetd => reset0,
							inFlagconfigd => outFlagConfig0,
							inFlagdatad => outFlagContdata0,
							indird => outcontdata0,
							outwordd => sworddata,
							outFlagd => outFlagdata0);
	
	L05: lcdmux00 port map(resetm => reset0,
						   inFlagconfigm => outFlagConfig0,
						   inWordconfigm => swordconfig,
						   inWorddatam => sworddata,
						   RWc => sRWc,
						   RSc => sRSc,
						   ENc => sENc,
						   RWd => sRWd, 
						   RSd => sRSd,
						   ENdd => sENd,
						   outWordm => sword0,
						   RWm => RW0,
						   RSm => RS0,
						   ENm => sEN0);
						   
	
end toplcd0;