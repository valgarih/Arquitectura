library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

package packagediv00 is


  component osc00
  port(
     tmr_out: out std_logic  );
  end component;


  component div00
  port( 
	clkdiv: in std_logic ;
	indiv: in std_logic_vector ( 4 downto 0 );
	outdiv: inout std_logic  );
  end component;

end packagediv00;

