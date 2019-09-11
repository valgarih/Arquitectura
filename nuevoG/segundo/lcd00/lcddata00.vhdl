library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity lcddata00 is
	port(clkd: in std_logic;
		 resetd: in std_logic;
		 inFlagconfigd: in std_logic;
		 inFlagdatad: in std_logic;
		 indird: in std_logic_vector(5 downto 0);
		 --indird: in std_logic_vector(4 downto 0);
		 outwordd: out std_logic_vector(7 downto 0);
		 outFlagd: out std_logic);

end lcddata00;


architecture lcddata0 of lcddata00 is
type arraydata is array(0 to 63) of std_logic_vector(7 downto 0);
constant worddata: arraydata:=("00100000", --espacio
							   "00100000", --espacio
							   "01010011", --S
							   "01000101", --E
							   "01010010", --R
							   "01000111", --G
							   "01001001", --I
							   "01001111", --O
							   "00100000", --espacio
							   "00100000", --espacio
							   "01011001", --Y
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "00100000", --espacio
							   "01001011", --K
							   "01000001", --A
							   "01010010", --R
							   "01001100", --L
							   "01000001", --A
							   others=> "00100000"); -- espacio
begin
	pdata: process(clkd)
	begin
		if(clkd'event and clkd = '1') then
			case resetd is
				when '0' =>
					outwordd <= "00000000";
					outFlagd <= '0';
				when '1' =>
					case inFlagconfigd is
						when '0' =>
							outwordd <= "00000000";
							outFlagd <= '0';
						when '1' =>
							case inFlagdatad is
								when '0' =>
									outwordd <= worddata(conv_integer(indird));
									outFlagd <= '1';
								when '1' =>
									outFlagd <= '0';
								when others => null;
							end case;
						when others => null;
					end case;
				when others => null;
			end case;
		end if;
	end process pdata;
end lcddata0;