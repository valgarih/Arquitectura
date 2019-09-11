library ieee;
use ieee.std_logic_1164.all;

library lattice;
use lattice.all;

entity shiftRL00 is
	port
	(
		clkcr: in std_logic;
		encr: in std_logic;
		outcr: out std_logic_vector(3 downto 0)
	);
end shiftRL00;

architecture shiftRL0 of shiftRL00 is
signal scontcr: std_logic_vector(3 downto 0);
begin
	pring: process(clkcr)
	begin 
		if(clkcr'event and clkcr = '1') then --condición global
			case encr is
				when '0' =>
					outcr <= (others => '0');
					scontcr <= "0001";
				when '1' =>
					scontcr(0) <= scontcr(3);
					scontcr(3 downto 1) <= scontcr(2 downto 0);
					outcr <= scontcr;	
				when others => null;
			end case;
		end if;
	end process pring;
end shiftRL0;