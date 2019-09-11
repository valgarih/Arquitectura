library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity noral00 is

port(clknoral: in std_logic;
	 opcodenoral: in std_logic_vector(4 downto 0);
	 portAnoral: in std_logic_vector(7 downto 0);
	 portBnoral: in std_logic_vector(7 downto 0);
	 inFlagnoral: in std_logic;
	 outnoral: out std_logic_vector(7 downto 0);
	 outFlagnoral: out std_logic);
end noral00;

architecture noral0 of noral00 is
begin
	pnoral: process(clknoral)
	variable aux: bit:='0';
	begin
		if(clknoral'event and clknoral = '1') then
			if (opcodenoral = "00101") then
				case inFlagnoral is
					when '0' =>
						outFlagnoral <= '0';
					when '1' =>
						if(aux = '0')then
							aux:='1';
							outnoral <= (portAnoral nor portBnoral);
							outFlagnoral <= '1';
						else
							outFlagnoral <= '0';
						end if;
					when others => null;
				end case;	
			else--opcode
				outnoral <= (others => 'Z');
				outFlagnoral <= 'Z';
				aux:= '0';
			end if;
		end if; 
	end process pnoral;
end noral0;