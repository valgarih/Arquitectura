library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity addal00 is
port(
	  clkadd: in std_logic;
	  opcodeadd: in std_logic_vector(4 downto 0);
	  inFlagadd: in std_logic;
	  inLEDoverfadd: in std_logic;
	  inadd: in std_logic_vector(7 downto 0);
	  outadd: out std_logic_vector(7 downto 0);
	  outFlagadd: out std_logic;
	  outSLadd: out std_logic;
	  outLEDoverfadd: out std_logic);
end addal00;

architecture addal0 of addal00 is
begin
 padd: process(clkadd)
 variable aux: bit:= '0';
 begin
	if(clkadd'event and clkadd = '1') then
		if(opcodeadd = "00111") then
			case inFlagadd is
				when '1' =>
					outSLadd <= '0';
					outFlagadd <= '0';
				when '0' =>
				if(aux = '0') then 
					--outadd <= inadd;
					aux:= '1';
					outadd <= inadd;
					outFlagadd <= '1';
					outLEDoverfadd <= inLEDoverfadd;
					else
					outFlagadd <= '0';
					end if;
				when others => null;
			end case;
		else --DEL OPCODE
			aux:='0';
			outadd <= "ZZZZZZZZ";
			outFlagadd <= 'Z';
			outLEDoverfadd <= 'Z';
		end if;
	end if;
 end process padd;
 
end addal0;