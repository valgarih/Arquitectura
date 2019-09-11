library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity muxram00 is
port(
	enmux: in std_logic;
	rwmux: in std_logic;
	inWordkey: in std_logic_vector(6 downto 0);
	inWordram: in std_logic_vector(6 downto 0);
	outwordmux: out std_logic_vector(6 downto 0)
	);
end muxram00;

architecture muxram0 of muxram00 is
begin
	pmux: process(inWordkey, inWordram)
	begin 
		case enmux is
			when '0' =>
				outwordmux <= "1111111";
			when '1' => 
				case rwmux is
					when '0' => 
						outwordmux <= inWordkey;
					when '1' => 
						outwordmux <= inWordram;
					when others => null;
				end case;
			when others => null;
		end case;
	end process pmux;
end muxram0;