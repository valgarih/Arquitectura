library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;

entity init00 is 
	port(
		  clkinit: in std_logic;
		  opcodeinit: in std_logic_vector(3 downto 0);
		  inFlaginit: int std_logic;
		  outac8init: out std_logic_vector(7 downto 0);
		  outac12init: out std_logic_vector(11 downto 0);
		  outFlagac8init: out std_logic;
		  outFlagac12init: out std_logic);
end init00;

architecture init0 of init00 is 
begin 
	pinit: process(clkinit)
	begin 
		if(clkinit'event and clkinit = '1') then 
		if(opcodeinit = "0000") then 
		case inFlaginit is 
			when '1' => 
				if(aux0 = '0') then 
				aux0:= '1';
				outFlagac8init
		else 
		end if;
		end if;
	end process pinit;
end init0;