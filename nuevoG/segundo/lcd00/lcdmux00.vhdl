library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity lcdmux00 is
port(inFlagconfigm: in std_logic;
	 resetm: in std_logic;
	 inWordconfigm: in std_logic_vector(7 downto 0);
	 inWorddatam: in std_logic_vector(7 downto 0);
	 RWc: in std_logic;
	 RSc: in std_logic;
	 ENc: in std_logic;
	 RWd: in std_logic;
	 RSd: in std_logic;
	 ENdd: in std_logic;
	 outWordm: out std_logic_vector(7 downto 0);
	 RWm: out std_logic;
	 RSm: out std_logic;
	 ENm: out std_logic);
end lcdmux00;

architecture lcdmux0 of lcdmux00 is
begin
	pmux: process(inWordconfigm, inWorddatam)
	begin
		case resetm is
			when '0' =>
				outWordm <= "00000000";
				RWm <= '0';
				RSm <= '0';
				ENm <= '0';
			when '1' =>
				case inFlagconfigm is
					when '0' =>
						outWordm <= inWordconfigm;
						RWm <= RWc;
						RSm <= RSc;
						ENm <= ENc;
					when '1' =>
						outWordm <= inWorddatam;
						RWm <= RWd;
						RSm <= RSd;
						ENm <= ENdd;
					when others => null;
				end case;
			when others => null;
		end case;
	end process pmux;
end lcdmux0;