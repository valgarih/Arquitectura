library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.components.all;
use packagelcd00.all;

entity toplcd00 is 
	port (
			clk00 : inout std_logic;
			cdiv00: in std_logic_vector (4 downto 0);
			reset0: in std_logic;
			outFLagcc0: inout std_logic;
			outFLagc0: inout std_logic;
		--	outFLagcd0: inout std_logic;
		--  outFLagd0: inout std_logic;
			outcontconfig0: inout std_logic_vector (4 downto 0);
			outcontdata0: inout std_logic_vector (4 downto 0);
			outwordLED0: out std_logic_vector (7 downto 0);
			outwordLCD0: out std_logic_vector (7 downto 0);
			outRWLCD0: out std_logic;
			outRSLCD0: out std_logic;
			outENLCD0: out std_logic;
			outRWLED0: out std_logic;
			outRSLED0: out std_logic;
			outENLED0: out std_logic);
			
end toplcd00;

architecture toplcd0 of toplcd00 is 
signal scommand: std_logic_vector(7 downto 0);
signal sword: std_logic_vector(7 downto 0);
signal sRWc, sRSc, sENc: std_logic;
signal sRWd, sRSd, sENd: std_logic;
signal soutword: std_logic_vector(7 downto 0);
signal soutRWd, soutRSd, soutENd: std_logic;

begin

outRWLCD0 <= soutRWd;
outRSLCD0 <= soutRSd;
outENLCD0 <= soutENd;

outRWLED0 <= soutRWd;
outRSLED0 <= soutRSd;
outENLED0 <= soutENd;

outwordLED0 <= soutword;
outwordLCD0 <= soutword;



	LCD00: topdv00 port map(  clk0 => clk00,
							  cdiv0 => cdiv00);
	
	LCD01: lcdContConfig00 port map(  clkcc => clk00,
									enablecc => reset0, 
									inFlagcc => outFLagc0, 
									outcontcc => outcontconfig0,
									outFlagcc => outFLagcc0 
									);
	
	LC02: lcdConfig00 port  map( clkc => clk00,
								resetc => reset0,
								inFlagc => outFLagcc0,
							    incontc => outcontconfig0,
								outCommandc => scommand,
								outFlagc => outFLagc0,
								RWc => sRWc,
								RSc => sRSc ,
								ENc => sENc);
	
	LC03: lcdContData00 port  map(  clkcd => clk00,
								  resetcd => reset0,
								  inFlagcd => outFLagc0,
								  RWcd => sRWd,
								  RScd => sRSd,
								  ENcd => sENd,
								  outcontcd => outcontdata0
									);
	
	LC04: lcdData00 port  map(  inFlagd => reset0,
								resetd => outFLagc0,
								incontd => outcontdata0, 
								outwordd => sword);
	
	LC05: lcdmux00 port  map( inFlagmuxconfigm => outFLagc0,
							inwordconfigm => scommand,
							inworddatam => sword,
							inRWcm => sRWc,
							inRScm => sRSc, 
							inENcm => sENc,
							inRWdm => sRWd,
							inRSdm => sRSd,
							inENdm => sENd,
							outRWm => soutRWd,
							outRSm => soutRSd,
							outENm => soutENd,
							outwordm => soutword );
	
end toplcd0;