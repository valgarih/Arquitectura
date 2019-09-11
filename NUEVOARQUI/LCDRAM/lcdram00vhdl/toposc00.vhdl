library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
use packageosc00.all;

entity toposc00 is
  port(
       indiv0: in std_logic_vector(4 downto 0);
       oscout0: inout std_logic);
end toposc00;

architecture toposc0 of toposc00 is
signal sclk: std_logic;
begin 

  D00: osc00 port map(osc_int => sclk);
  
  D01: div00 port map(clkdiv => sclk,
                      indiv => indiv0,
                      outdiv => oscout0);

end toposc0;