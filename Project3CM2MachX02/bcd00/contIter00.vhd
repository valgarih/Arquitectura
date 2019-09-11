library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library lattice;
use lattice.all;

entity contIter00 is
	port
	(
		clkIter: in std_logic;
		inFlagIter: in std_logic;
		resetIter: in std_logic;
		outContIter: inout std_logic_vector(3 downto 0);
		outFlagIter: out std_logic
	);
end contIter00;

architecture contIter0 of contIter00 is
begin	
	pcontIter: process(clkIter)
	begin
		if(clkIter'event and clkIter = '1') then
			case resetIter is
				when '0' =>
					outContIter <= (others => '0');			
					outFlagIter <= '0';
				when '1' =>
					case inFlagIter is
						when '1' => 
							if(outContIter > "0111") then
								outContIter <= outContIter + '1';
								outFlagIter <= '0';
							else
								outContIter <= outContIter;
								outFlagIter <= '1';
							end if;
						when '0' => 
							outFlagIter <= '0';
						when others => null;
					end case;
				when others => null;
			end case;
		end if;
	end process pcontIter;
end contIter0;