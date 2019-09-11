library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use packagecontrol.all;

entity topcontrol is

port( 
	clktop: inout std_logic ;
	indivtop: in std_logic_vector ( 4 downto 0 );
	enctop: in std_logic;
	outctop: out std_logic;
	outctop1: out std_logic;
	auxtop: out std_logic_vector ( 4 downto 0 ) );
   
   attribute loc: string;
   attribute loc of clktop: signal is "p4";
   attribute loc of outctop: signal is "p5";
   attribute loc of outctop1: signal is "p6";
   attribute loc of enctop: signal is "p104";
   attribute loc of indivtop: signal is "p125, p124, p123, p122, p121,";
   attribute loc of auxtop: signal is "p7, p8, p9, p11, p12";
end;

architecture topcontrol00 of topcontrol is
begin


  U1: topdiv00 port map(clk0 => clktop,
                     indiv0 => indivtop);

  U2: control port map(clkc => clktop,
                     enc => enctop,
                     outc => outctop,
		     outc1 => outctop1,
		     aux1 => auxtop );

end topcontrol00;




