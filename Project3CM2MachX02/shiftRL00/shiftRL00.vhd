library ieee;
use ieee.std_logic_1164.all;

library lattice;
use lattice.all;

entity shiftRL00 is
	port
	(
		clksRL: in std_logic;
		ens: in std_logic;
		ins: in std_logic_vector(7 downto 0);
		outs: out std_logic_vector(7 downto 0);
		outseq: out std_logic
	);
end shiftRL00;

architecture shiftRL0 of shiftRL00 is
signal sins: std_logic_vector(7 downto 0);
-- singal scontrol: std_logic_vector(2 downto 0);
begin
	psRL: process(clksRL)
	begin
		if(clksRL'event and clksRL = '1') then
			case ens is
				when '0' => 
					outs <= (others => '0');
					sins <= ins;
					outseq <= '0';
				when '1' =>
					sins(0) <= sins(7);
					sins(7 downto 1) <= sins(6 downto 0);
					outs <= sins;
					outseq <= sins(0);
				when others => null;
			end case;
		end if;
	end process psRL;
end shiftRL0;