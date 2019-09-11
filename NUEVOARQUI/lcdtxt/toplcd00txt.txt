library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagelcd00.all;

entity toplcd00 is
  port(
       clk00: inout std_logic;
	   cdiv00: in std_logic_vector(4 downto 0);
	   reset0: in std_logic;
	   soutFlagcontconfig0: inout std_logic;
	   outFlagconfig0: inout std_logic;
	   outFlagdata0: inout std_logic;
	   outFlagcontdata0: inout std_logic;
	   outword0: out std_logic_vector(7 downto 0);
	   outwordled0: out std_logic_vector(7 downto 0);
	   outcontconfig0: inout std_logic_vector(4 downto 0);
	   outcontdata0: inout std_logic_vector(4 downto 0);
	   RW0: out std_logic;
	   RS0: out std_logic;
       EN0: out std_logic;
	   ENled0: out std_logic);
end toplcd00;

architecture toplcd0 of toplcd00 is
signal soutword0: std_logic_vector(7 downto 0);
signal souflagcc: std_logic;
signal swordconfig: std_logic_vector(7 downto 0);
signal sworddata: std_logic_vector(7 downto 0);
signal sRWc, sRSc, sENc: std_logic;
signal sRWd, sRSd, sENd: std_logic;
signal sEN0: std_logic;
begin
outword0 <= soutword0;
outwordled0 <= soutword0;
EN0 <= sEN0;
ENled0 <= sEN0;

  L00: toposc00 port map(clk0 => clk00,
                         cdiv0 => cdiv00);
  
  L01: lcdContConfig00 port map(clkcc => clk00,
                                resetcc => reset0,
								inFlagcc => outFlagconfig0,
								outcontcc => outcontconfig0,
                                outFlagcc => soutFlagcontconfig0);
  
  L02: lcdconfig00 port map(clkc => clk00,
                            resetc => reset0,
							inFlagc => soutFlagcontconfig0,
							incontc => outcontconfig0,
							outWordc => swordconfig,
							outFlagc => outFlagconfig0,
							RWc => sRWc,
							RSc => sRSc,
                            ENc => sENc);
  
  L03: lcdcontdata00 port map(clkcd => clk00,
                              resetcd => reset0,
							  inFlagconfigcd => outFlagconfig0,
							  inFlagdatacd => outFlagdata0,
							  outcontcd => outcontdata0,
							  outFlagcd => outFlagcontdata0,
							  RWcd => sRWd,
							  RScd => sRSd,
                              ENcd => sENd);
  
  L04: lcddata00 port map(clkd => clk00,
						  resetd => reset0,
						  inFlagconfigd => outFlagconfig0,
						  inFlagd => outFlagcontdata0,
						  incontd => outcontdata0,
						  outwordd => sworddata,
                          outFlagd => outFlagdata0);
  
  L05: lcdmux00 port map(inFlagmuxconfig => outFlagconfig0,
                         resetmux => reset0,
                         inwordconfig => swordconfig,
						 inworddata => sworddata,
						 inRWc => sRWc,
						 inRSc => sRSc,
						 inENc => sENc,
						 inRWd => sRWd,
						 inRSd => sRSd,
						 inENd => sENd,
						 outwordmux => soutword0,
						 RWm => RW0,
						 RSm => RS0,
                         ENm => sEN0);
end toplcd0;