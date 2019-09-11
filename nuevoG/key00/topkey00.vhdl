library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagekey00.all;

entity topkey00 is 
port(clk00: inout std_logic;
     cdiv00: in std_logic_vector(4 downto 0);
	 en0: in std_logic;
	 inkey0: in std_logic_vector(3 downto 0);
	 outr0: out std_logic_vector(3 downto 0);
	 soutr0: out std_logic_vector(3 downto 0);
	 outcoder0: out std_logic_vector(6 downto 0);
	 outtransist0: out std_logic_vector(3 downto 0)
	 );
end topkey00;

architecture topkey0 of topkey00 is
signal soutr: std_logic_vector(3 downto 0);
begin 

outtransist0 <= "1110";
outr0 <= soutr;
soutr0 <= soutr;

K00: toposc00 port map (clk0 => clk00,
					    cdiv0 => cdiv00);
						
K01: contring00 port map (clks => clk00,
						  en => en0,
						  outr => soutr);
						
K02: coder00 port map (inkey => inkey0,
					   clkc => clk00,
					   incont => soutr,
					   outcoder => outcoder0);						
end topkey0;

