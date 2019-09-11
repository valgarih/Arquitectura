library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.components.all;

entity lcdmux00 is 
	port(
		inFlagmuxconfigm: in std_logic;
		inwordconfigm: in std_logic_vector (7 downto 0);
		inworddatam: in std_logic_vector(7 downto 0);
		inRWcm: in std_logic;
		inRScm: in std_logic;
		inENcm: in std_logic;
		inRWdm: in std_logic;
		inRSdm: in std_logic;
		inENdm: in std_logic;
		outRWm: out std_logic;
		outRSm: out std_logic;
		outENm: out std_logic;
		outwordm: out std_logic_vector (7 downto 0));
end lcdmux00;


architecture lcdmux0 of lcdmux00 is--signal scontrol: std_logic_vector (1 downto 0);
begin
--scontrol <=(inFlagmuxconfigm) & (inFlagmuxdatam);
 with inFlagmuxconfigm select
	outwordm <= inwordconfigm when '0',
				inworddatam when '1',
				"00000000" when others;
 
 with inFlagmuxconfigm select
	outwordm <= inwordconfigm when '0',
				inworddatam when '1',
				"00000000" when others;
 
 with inFlagmuxconfigm select
	outRWm <= inRWcm when '0',
			  inRWdm when '1',
			  '0' when others;

with inFlagmuxconfigm select
	outRSm <= inRScm when '0',
			  inRSdm when '1',
			  '0' when others;
			  
with inFlagmuxconfigm select
	outENm <= inENcm when '0',
			  inENdm when '1',
			  '0' when others;

	
end lcdmux0;

