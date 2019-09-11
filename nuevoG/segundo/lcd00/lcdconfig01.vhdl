library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity lcdconfig01 is

port(clkc1: in std_logic;
	 resetc1: in std_logic;
	 inFlagc1: in std_logic;
	 incontc1: in std_logic_vector(4 downto 0);
	 outwordconfigc1: out std_logic_vector(7 downto 0);
     outFlagc1: out std_logic;
	 RWc1: out std_logic;
	 RSc1: out std_logic;
	 ENc1: out std_logic);

end lcdconfig01;

architecture lcdconfig of lcdconfig01 is
begin
	pconfig: process(clkc1)
	begin
		if(clkc1'event and clkc1='1')then
			case resetc1 is
				when '0' =>
					outwordconfigc1 <= "00000000";
					outFlagc1 <= '0';
					RWc1 <= '0';
					RSc1 <= '0';
					ENc1 <= '0';
				when '1' =>
					case incontc1 is
						when "00001" =>
							if(inFlagc1 = '1') then
								outwordconfigc1 <= "00000001";--CLEAR SCREEN
								RWc1 <= '0';
								RSc1 <= '0';
								ENc1 <= '1';
								outFlagc1 <= '0';
							end if;
						when "00010" =>
							if(inFlagc1 = '1') then
								outwordconfigc1 <= "00000001";--CLEAR SCREEN
								RWc1 <= '0';
								RSc1 <= '0';
								ENc1 <= '0';
								outFlagc1 <= '0';
							end if;
						when "00011" =>
							if(inFlagc1 = '1') then
								outwordconfigc1 <= "00000011";
								RWc1 <= '0';
								RSc1 <= '0';
								ENc1 <= '1';
								outFlagc1 <= '0';
							end if;
						when "00100" =>
							if(inFlagc1 = '1') then
								outwordconfigc1 <= "00000011";
								RWc1 <= '0';
								RSc1 <= '0';
								ENc1 <= '0';
								outFlagc1 <= '0';
							end if;
						when "00101" =>
							if(inFlagc1 = '1') then
								outwordconfigc1 <= "00000110";
								--outwordconfigc <= "00000111";  --00000110
								RWc1 <= '0';
								RSc1 <= '0';
								ENc1 <= '1';
								outFlagc1 <= '0';
							end if;
						when "00110" =>
							if(inFlagc1 = '1') then
								outwordconfigc1 <= "00000110";
								--outwordconfigc <= "00000111";  --00000110
								RWc1 <= '0';
								RSc1 <= '0';
								ENc1 <= '0';
								outFlagc1 <= '0';
							end if;
						when "00111" =>
							if(inFlagc1 = '1') then
								outwordconfigc1 <= "00001111";
								RWc1 <= '0';
								RSc1 <= '0';
								ENc1 <= '1';
								outFlagc1 <= '0';
							end if;
						when "01000" =>
							if(inFlagc1 = '1') then
								outwordconfigc1 <= "00001111";
								RWc1 <= '0';
								RSc1 <= '0';
								ENc1 <= '0';
								outFlagc1 <= '0';
							end if;
						when "01001" =>
							if(inFlagc1 = '1') then
								outwordconfigc1 <= "00011100";
								RWc1 <= '0';
								RSc1 <= '0';
								ENc1 <= '1';
								outFlagc1 <= '0';
							end if;
						when "01010" =>
							if(inFlagc1 = '1') then
								outwordconfigc1 <= "00011100";
								RWc1 <= '0';
								RSc1 <= '0';
								ENc1 <= '0';
								outFlagc1 <= '0';
							end if;
						when "01011" =>
							if(inFlagc1 = '1') then
								outwordconfigc1 <= "00111100";
								RWc1 <= '0';
								RSc1 <= '0';
								ENc1 <= '1';
								outFlagc1 <= '0';
							end if;
						when "01100" =>
							if(inFlagc1 = '1') then
								outwordconfigc1 <= "00111100";
								RWc1 <= '0';
								RSc1 <= '0';
								ENc1 <= '0';
								outFlagc1 <= '0';
							end if;
						when "01101" =>
							if(inFlagc1 = '1') then
								outwordconfigc1 <= "10101010";
								--outwordconfigc <= "10001111"; --10000000 , 10101010
								RWc1 <= '0';
								RSc1 <= '0';
								ENc1 <= '1';
								outFlagc1 <= '0';
							end if;
						when "01110" =>
							if(inFlagc1 = '1') then
								outwordconfigc1 <= "10101010";
								--outwordconfigc <= "10001111";
								RWc1 <= '0';
								RSc1 <= '0';
								ENc1 <= '0';
								outFlagc1 <= '0';
							end if;	
						when "01111" =>
							if(inFlagc1 = '1') then
								outwordconfigc1 <= "10101010";
								--outwordconfigc <= "10001111";
								RWc1 <= '0';
								RSc1 <= '0';
								ENc1 <= '1';
								outFlagc1 <= '0';
							end if;
						when "10000" =>
							if(inFlagc1 = '1') then
								outwordconfigc1 <= "10101010";
								--outwordconfigc <= "10001111";
								RWc1 <= '0';
								RSc1 <= '0';
								ENc1 <= '0';
								outFlagc1 <= '1';
							end if;
						when others => null;
					end case;
				when others => null;	
			end case;
		end if;
	end process pconfig;
end lcdconfig;