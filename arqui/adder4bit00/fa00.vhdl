library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;
library machxo2;
use machxo2.all;
use packagefa00.all;

entity fa00 is
  port(
       C00: in std_logic;
	   A00: in std_logic;
	   B00: in std_logic;
	   S00: out std_logic;
       C01: out std_logic);
end fa00;

architecture fa0 of fa00 is
signal Sint1, Cint1, Cint2: std_logic;
begin

  FAha00: ha00 port map(A0 => A00,
                           B0 => B00,
						   S0 => Sint1,
                           C0 => Cint1);
  
  FAha01: ha00 port map(A0 => C00,
                           B0 => Sint1,
						   S0 => S00,
                           C0 => Cint2);
  
  FAo: or00 port map(Ao => Cint2,
                     Bo => Cint1,
                     Yo => C01);

end fa0;