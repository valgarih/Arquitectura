library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity notal00 is

port(clknotal: in std_logic;
	 opcodenotal: in std_logic_vector(4 downto 0);
	 portAnotal: in std_logic_vector(7 downto 0);
	 --portBnotal: in std_logic_vector(7 downto 0);
	 inFlagnotal: in std_logic;
	 outnotal: out std_logic_vector(7 downto 0);
	 outFlagnotal: out std_logic);
end notal00;

architecture notal0 of notal00 is
begin
	pnotal: process(clknotal)
	variable aux: bit:='0';
	begin
		if(clknotal'event and clknotal = '1') then
			if (opcodenotal = "00011") then
				case inFlagnotal is
					when '0' =>
						outFlagnotal <= '0';
					when '1' =>
						if(aux = '0')then
							aux:='1';
							outnotal <= (not portAnotal);
							outFlagnotal <= '1';
						else
							outFlagnotal <= '0';
						end if;
					when others => null;
				end case;	
			else--opcode
				outnotal <= (others => 'Z');
				outFlagnotal <= 'Z';
				aux:= '0';
			end if;
		end if; 
	end process pnotal;
end notal0;