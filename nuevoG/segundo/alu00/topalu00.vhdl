library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagealu00.all;

entity topalu00 is
port(clk00: inout std_logic;
	 cdiv00: in std_logic_vector(4 downto 0);
	 en0: in std_logic;
	 opcode0: in std_logic_vector(3 downto 0);
	 outFlaginside: inout std_logic;
	 outFlagac0: inout std_logic;
	 portA0: in std_logic_vector(7 downto 0);
	 portB0: in std_logic_vector(7 downto 0);
	 outac0: out std_logic_vector(7 downto 0);
	 outac01: out std_logic_vector(15 downto 0));
end topalu00;

architecture topalu0 of topalu00 is
signal soutinst :std_logic_vector(7 downto 0);
signal soutinst1 :std_logic_vector(15 downto 0);
begin
	AC00: toposc00 port map(clk0 => clk00,
							cdiv0 => cdiv00);
	AC01: anda00 port map(clkal => clk00,
						  opcodeal => opcode0,
						  portAal => portA0,
						  portBal => portB0,
						  inFlagal => outFlagac0,
						  outal => soutinst,
						  outFlagal => outFlaginside);
	AC02: ora00 port map(clkoral => clk00,
						  opcodeoral => opcode0,
						  portAoral => portA0,
						  portBoral => portB0,
						  inFlagoral => outFlagac0,
						  outoral => soutinst,
						  outFlagoral => outFlaginside);
						  
	AC03: xora00 port map(clkxoral => clk00,
						  opcodexoral => opcode0,
						  portAxoral => portA0,
						  portBxoral => portB0,
						  inFlagxoral => outFlagac0,
						  outxoral => soutinst,
						  outFlagxoral => outFlaginside);
	
	AC04: nanda00 port map(clkaal => clk00,
						   opcodeaal => opcode0,
						   portAaal => portA0,
						   portBaal => portB0,
						   inFlagaal => outFlagac0,
						   outaal => soutinst,
						   outFlagaal => outFlaginside);
	
	AC05: nora00 port map(clknoral => clk00,
						  opcodenoral => opcode0,
						  portAnoral => portA0,
						  portBnoral => portB0,
						  inFlagnoral => outFlagac0,
						  outnoral => soutinst,
						  outFlagnoral => outFlaginside);

	AC06: xnora00 port map(clkxnoral => clk00,
						   opcodexnoral => opcode0,
						   portAxnoral => portA0,
						   portBxnoral => portB0,
						   inFlagxnoral => outFlagac0,
						   outxnoral => soutinst,
						   outFlagxnoral => outFlaginside);
						   
	AC07: nota00 port map(clknotaal => clk00,
						  opcodenotaal => opcode0,
						  portAnotaal => portA0,
						  inFlagnotaal => outFlagac0,
						  outnotaal => soutinst,
						  outFlagnotaal => outFlaginside);
						  
	AC08: adder8bita00 port map(clkadderal => clk00,
							    opcodeadderal => opcode0,
							    portAadderal => portA0,
								portBadderal => portB0,
							    inFlagadderal => outFlagac0,
							    outadderal => soutinst,
							    outFlagadderal => outFlaginside);
								
	AC09: substract8bita00 port map(clksubsal => clk00,
									opcodesubsal => opcode0,
									portAsubsal => portA0,
									portBsubsal => portB0,
									inFlagsubsal => outFlagac0,
									outsubsal => soutinst,
									outFlagsubsal => outFlaginside);
									
	AC10: mult8bita00 port map(clkmultal => clk00,
							   opcodemultal => opcode0,
							   portAmultal => portA0,
							   portBmultal => portB0,
							   inFlagmultal => outFlagac0,
							   outmultal => soutinst1,
							   outFlagmultal => outFlaginside);

	AC11: ac800 port map(clkac => clk00,
						 enac => en0,
						 inac => soutinst,
						 inFlagac => outFlaginside,
						 outac => outac0,
						 outFlagac => outFlagac0);
end topalu0;