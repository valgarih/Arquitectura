library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;
library machxo2;
use machxo2.all;
use packageha00.all;

entity ha00 is
  port(
       A0: in std_logic;
	   B0: in std_logic;
	   S0: out std_logic;
       C0: out std_logic);
end ha00;

architecture ha0 of ha00 is
begin 
  
  HAa: and00 port map(Aa => A0,
                      Ba => B0,
                      Ya => C0);
  
  HAx: xor00 port map(Ax => A0,
                      Bx => B0,
                      Yx => S0);
  
end ha0;