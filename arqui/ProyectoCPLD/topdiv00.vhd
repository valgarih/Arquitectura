library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use packagediv00.all;

entity topdiv00 is

port( 
	clk0: inout std_logic ;
	indiv0: in std_logic_vector ( 4 downto 0 ) );
   attribute loc: string;
   attribute loc of clk0: signal is "p5";
   attribute loc of indiv0: signal is "p125, p124, p123, p122, p121";
end;

architecture topdiv0 of topdiv00 is
signal sclk: std_logic;
begin

  U1: osc00 port map(tmr_out => sclk);

  U2: div00 port map(clkdiv => sclk,
                     indiv => indiv0,
                     outdiv => clk0);

end topdiv0;

