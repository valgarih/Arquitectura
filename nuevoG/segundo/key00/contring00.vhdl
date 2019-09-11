library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity contring00 is 
port(
	  clks: in std_logic;
	  en: in std_logic;
	  outr: out std_logic_vector(3 downto 0));

end contring00;

architecture contring0 of contring00 is
signal scontr: std_logic_vector(3 downto 0);
begin 

pcontr: process(clks)
begin 
  if(clks' event and clks='1')then 
     case en is 
	 when '0' => 
	     outr <= (others => '0');
		 scontr <= "1000";
	 
	 when '1' =>
	     scontr(3) <= scontr(0);
		 scontr(2 downto 0) <= scontr(3 downto 1);
		 outr <= scontr;
	 
	 when others  => null;
      end case;
  end if;
end process pcontr;

end contring0;