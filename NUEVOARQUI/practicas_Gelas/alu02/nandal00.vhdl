library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity nandal00 is

port(clknandal: in std_logic;
	 opcodenandal: in std_logic_vector(4 downto 0);
	 portAnandal: in std_logic_vector(7 downto 0);
	 portBnandal: in std_logic_vector(7 downto 0);
	 inFlagnandal: in std_logic;
	 outnandal: out std_logic_vector(7 downto 0);
	 outFlagnandal: out std_logic);
end nandal00;

architecture nandal0 of nandal00 is
begin
	pnandal: process(clknandal)
	variable aux: bit:='0';
	begin
		if(clknandal'event and clknandal = '1') then
			if (opcodenandal = "00100") then
				case inFlagnandal is
					when '0' =>
						outFlagnandal <= '0';
					when '1' =>
						if(aux = '0')then
							aux:='1';
							outnandal <= (portAnandal nand portBnandal);
							outFlagnandal <= '1';
						else
							outFlagnandal <= '0';
						end if;
					when others => null;
				end case;	
			else--opcode
				outnandal <= (others => 'Z');
				outFlagnandal <= 'Z';
				aux:= '0';
			end if;
		end if; 
	end process pnandal;
end nandal0;