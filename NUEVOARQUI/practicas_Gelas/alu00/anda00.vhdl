library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity anda00 is

port(clkal: in std_logic;
	 opcodeal: in std_logic_vector(4 downto 0);
	 portAal: in std_logic_vector(7 downto 0);
	 portBal: in std_logic_vector(7 downto 0);
	 inFlagal: in std_logic;
	 outal: out std_logic_vector(7 downto 0);
	 outFlagal: out std_logic);
	
end anda00;

architecture anda0 of anda00 is
begin
	panda: process(clkal)
	variable aux: bit:='0';
	begin
		if(clkal'event and clkal = '1') then
			if (opcodeal = "00000") then
				case inFlagal is
					when '0' =>
						outFlagal <= '0';
					when '1' =>
						if(aux = '0')then
							aux:='1';
							outal <= portAal and portBal;
							outFlagal <= '1';
						else
							outFlagal <= '0';
						end if;
					when others => null;
				end case;	
			else--opcode
				outal <= (others => 'Z');
				outFlagal <= 'Z';
				aux:= '0';
			end if;
		end if; 
	end process panda;
end anda0;