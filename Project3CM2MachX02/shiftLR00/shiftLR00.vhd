library ieee;
use ieee.std_logic_1164.all;

library lattice;
use lattice.all;

entity shiftLR00 is
	port
	(
		clksLR: in std_logic;
		ens: in std_logic;
		ins: in std_logic_vector(7 downto 0);
		outs: out std_logic_vector(7 downto 0)
	);
end shiftLR00;

architecture shiftLR0 of shiftLR00 is
signal sins: std_logic_vector(7 downto 0);
-- singal scontrol: std_logic_vector(2 downto 0);
begin
	psLR: process(clksLR)
	begin
		if(clksLR'event and clksLR = '1') then
			case ens is
				when '0' => 
					outs <= (others => '0');
					sins <= ins;
				when '1' =>
					sins(7) <= sins(0);
					sins(6 downto 0) <= sins(7 downto 1);
					outs <= sins;
				when others => null;
			end case;
		end if;
	end process psLR;
end shiftLR0;