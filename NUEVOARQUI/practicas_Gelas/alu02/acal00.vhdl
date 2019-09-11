library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity acal00 is
port(
	clkacal: in std_logic;
	enacal: in std_logic;
	inacal: in std_logic_vector(7 downto 0);
	inFlagacal: in std_logic;
	outacal: out std_logic_vector(7 downto 0);
	outFlagacal: out std_logic);
end acal00;

architecture acal0 of acal00 is
begin
	pacal: process(clkacal)
	variable aux: bit:='0';
		begin
		if(clkacal'event and clkacal='1') then
			case aux is
				when '0' =>
					if((inFlagacal='1')or(enacal ='1'))then
						aux:='1';
						outacal <= inacal;
						outFlagacal <= '1';
					else
						outFlagacal <= '1';
						aux:='0';
					end if;
				when '1' =>
					outFlagacal <='0';
				when others => null;
			end case;
		end if;
	end process pacal;
end acal0;