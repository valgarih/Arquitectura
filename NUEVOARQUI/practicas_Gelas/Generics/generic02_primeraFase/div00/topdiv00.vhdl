library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;
use packagediv00.all;

entity topdiv00 is
  port(
       --clk0: in std_logic;
	   --stdby0: in std_logic;
       indiv0: in std_logic_vector(3 downto 0);
	   --osc_int0: out std_logic;
       outdiv0: inout std_logic);
end topdiv00;

architecture topdiv0 of topdiv00 is
signal clk0, stdby0: std_logic;
begin

  U0: osc00 port map(stdby => stdby0,
                     osc_int => clk0);
  
  U1: div0 port map(clkdiv => clk0,
                    indiv => indiv0,
                    outdiv => outdiv0);
					
  U2: enab00 port map(enable0 => stdby0);
  
end topdiv0;