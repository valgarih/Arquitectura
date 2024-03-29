library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library lattice;
use lattice.all;

entity contRead00 is
	port
	(
		clkr: in std_logic;
		enr: in std_logic;
		outr: inout std_logic_vector(4 downto 0)
	);
end contRead00;

architecture contRead0 of contRead00 is
begin
	pcontR: process(clkr)
	begin
		if(clkr'event and clkr = '1') then
			case enr is
				when '0' =>
					outr <= (others => '0');
				when '1' =>
					if(outr < "11111") then
						outr <= outr + 1;
					else
						outr <= outr;
					end if;
				when others => null;
			end case;
		end if;
	end process pcontR;
end contRead0;