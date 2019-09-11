library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;
use packageosc00.all;

entity toposc00 is
  port(
       indiv0: in std_logic_vector(3 downto 0);
       outosc0: inout std_logic);
end toposc00;

architecture toposc0 of toposc00 is
signal sclkdiv: std_logic;
begin

  O00: osc00 port map(osc_int => sclkdiv);
  
  O01: div00 port map(clkdiv => sclkdiv,
                      indiv => indiv0,
                      outosc => outosc0);

end toposc0;