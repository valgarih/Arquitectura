library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity shiftRL00 is 
port(
	 RL: in std_logic;
	 RD1: in std_logic;
	 RD2: in std_logic;
	 clks: in std_logic;
	 en: in std_logic;
	 ins: in std_logic_vector(7 downto 0);
	 outs: out std_logic_vector(7 downto 0));
end shiftRL00;

architecture shiftRL0 of shiftRL00 is
signal sins: std_logic_vector(7 downto 0);
begin
	pshift: process(clks)
	begin
	if(clks'event and clks = '1') then
		if(RL = '0') then
			case en is
				when '0' =>
					outs <= (others => '0');
					sins <= ins;
				when '1' => 
					--sins(0) <= sins(7);
					sins(0) <= '0';
					sins(7 downto 1) <= sins(6 downto 0);
					outs <= sins;
				when others => null;
			end case;
		else 
			case en is
				when '0' => 
					outs <= (others => '0');
					sins <= ins;
				when '1' => 
					--sins(7) <= sins(0);
					sins(7) <= '0';
					sins(6 downto 0) <= sins(7 downto 1);
					outs <= sins;
				when others => null;
			end case;
		end if;	
		if(RD1 = '1') then
			case en is
				when '0' =>
					outs <= (others => '0');
					sins <= ins;
				when '1' => 
					sins(0) <= sins(7);
					--sins(0) <= '0';
					sins(7 downto 1) <= sins(6 downto 0);
					outs <= sins;
				when others => null;
			end case;
		end if;	
		if(RD2 = '1') then
			case en is
				when '0' =>
					outs <= (others => '0');
					sins <= ins;
				when '1' => 
					sins(7) <= sins(0);
					--sins(7) <= '0';
					sins(6 downto 0) <= sins(7 downto 1);
					outs <= sins;
				when others => null;
			end case;
		end if;	
	 end if;
	end process pshift;
end shiftRL0;