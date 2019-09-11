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
	 outac0: out std_logic_vector(7 downto 0));
	 
end topalu00;

architecture topalu0 of topalu00 is
signal soutinst :std_logic_vector(7 downto 0);
signal soutinst1 :std_logic_vector(15 downto 0);
begin
	AC00: topdv00 port map(clk0 => clk00,
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
						  

	AC03: ac800 port map(clkac => clk00,
						 enac => en0,
						 inac => soutinst,
						 inFlagac => outFlaginside,
						 outac => outac0,
						 outFlagac => outFlagac0);
						 
						 
end topalu0;