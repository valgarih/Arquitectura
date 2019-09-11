library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;

package packagediv00 is

  component osc00
     port(
        stdby: in std_logic;
        osc_int: out std_logic);
  end component;
  
  component div0
    port(
        clkdiv: in std_logic;
		indiv: in std_logic_vector(3 downto 0);
        outdiv: inout std_logic);
  end component;
  
  component enab00
    port(
       enable0: in std_logic);
  end component;

end packagediv00;