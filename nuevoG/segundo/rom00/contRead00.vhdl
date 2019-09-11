library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity contRead00 is

port (
		clkcr: in std_logic;
		encr: in std_logic;
		outcr: inout std_logic_vector (4 downto 0)
		);

end contRead00;

architecture contRead0 of contRead00 is
begin
	pcontr:  process(clkcr)
	begin
		if (clkcr'event and clkcr = '1') then 
			case encr is 
				when '0'  => 
					outcr <= "00000";
				when '1' =>
					if (outcr < "10000") then 
						outcr <= outcr + '1';
						
					else
						outcr <= outcr;
						
					end if;
				when others => null;
			end case;
		end if;
	end process;
end contRead0;

