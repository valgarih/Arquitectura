library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagealu01.all;

entity topalu01 is
port(
	 clk00: inout std_logic;
	 cdiv00: in std_logic_vector(4 downto 0);
	 enal: in std_logic;
	 opcodeal0: in std_logic_vector(4 downto 0);
	 portAal0: in std_logic_vector(7 downto 0);
	 portBal0: in std_logic_vector(7 downto 0);
	 outFlagInstal0: inout std_logic;
	 outFlagal0: inout std_logic;
	 outoverf0: out std_logic;
	 outal0: out std_logic_vector(7 downto 0));
end topalu01;

architecture topalu0 of topalu01 is
signal soutal: std_logic_vector(7 downto 0);
signal saddSubs: std_logic_vector(7 downto 0);
signal smultSubs: std_logic_vector(15 downto 0);
signal sSL, soutoverf: std_logic;
begin
	AL00: toposc00 port map(clk0 => clk00,
							cdiv0 => cdiv00);
	
	AL01: anda00 port map(clkal => clk00,
						  opcodeal => opcodeal0,
						  portAal => portAal0,
						  portBal => portBal0,
						  inFlagal => outFlagal0,
						  outal => outal0,
						  outFlagal => outFlagInstal0);
	
	AL02: ora00 port map(clkoral => clk00,
						 opcodeoral => opcodeal0,
						 portAoral => portAal0,
						 portBoral => portBal0,
						 inFlagoral => outFlagal0,
						 outoral => outal0,
						 outFlagoral => outFlagInstal0);
						 
	AL03: xoral00 port map(clkxoral => clk00,
						 opcodexoral => opcodeal0,
						 portAxoral => portAal0,
						 portBxoral => portBal0,
						 inFlagxoral => outFlagal0,
						 outxoral => outal0,
						 outFlagxoral => outFlagInstal0);
	
    AL04: notal00 port map(clknotal => clk00,
						 opcodenotal => opcodeal0,
						 portAnotal => portAal0,
						 --portBnotal => portBal0,
						 inFlagnotal => outFlagal0,
						 outnotal => outal0,
						 outFlagnotal => outFlagInstal0);	
						 
	AL05: nandal00 port map(clknandal => clk00,
						 opcodenandal => opcodeal0,
						 portAnandal => portAal0,
						 portBnandal => portBal0,
						 inFlagnandal => outFlagal0,
						 outnandal => outal0,
						 outFlagnandal => outFlagInstal0);		
    						 
	AL06: noral00 port map(clknoral => clk00,
						 opcodenoral => opcodeal0,
						 portAnoral => portAal0,
						 portBnoral => portBal0,
						 inFlagnoral => outFlagal0,
						 outnoral => outal0,
						 outFlagnoral => outFlagInstal0);
						 
	AL07: xnoral00 port map(clkxnoral => clk00,
						 opcodexnoral => opcodeal0,
						 portAxnoral => portAal0,
						 portBxnoral => portBal0,
						 inFlagxnoral => outFlagal0,
						 outxnoral => outal0,
						 outFlagxnoral => outFlagInstal0);					 
						 
	AL08: topadder8bit00 port map(
								  Ai => portAal0,
								  Bi => portBal0,
								  SL => sSL,
								  So => saddSubs,
								  LED => soutoverf);
								  
	AL09: topmult8bit00 port map(
								 Am => portAal0,
								 Bm => portBal0,
								 Rm => smultSubs);							  
	
	AL10: addal00 port map(
						   clkadd => clk00,
						   opcodeadd => opcodeal0,
						   inFlagadd => outFlagal0,
						   inLEDoverfadd => soutoverf,
						   inadd => saddsubs,
						   outadd => soutal,
						   outFlagadd => outFlagInstal0,
						   outSLadd => sSL,
						   outLEDoverfadd => outoverf0);
						   
	AL11: subsal00 port map(clksubs => clk00,
						   opcodesubs => opcodeal0,
						   inFlagsubs => outFlagal0,
						   inLEDoverfsubs => soutoverf,
						   insubs => saddsubs,
						   outsubs => soutal,
						   outFlagsubs => outFlagInstal0,
						   outSLsubs => sSL,
						   outLEDoverfsubs => outoverf0);
	
	AL12: acal00 port map(clkacal => clk00,
						  enacal => enal,
						  inacal => saddsubs,
						  inFlagacal => outFlagal0,
						  outacal => soutal,
						  outFlagacal => outFlagInstal0);

end topalu0;