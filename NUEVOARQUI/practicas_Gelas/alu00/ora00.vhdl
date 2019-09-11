library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity ora00 is

port(clkoral: in std_logic;
	 opcodeoral: in std_logic_vector(4 downto 0);
	 portAoral: in std_logic_vector(7 downto 0);
	 portBoral: in std_logic_vector(7 downto 0);
	 inFlagoral: in std_logic;
	 outoral: out std_logic_vector(7 downto 0);
	 outFlagoral: out std_logic);
	
end ora00;

architecture ora0 of ora00 is
begin
	pora: process(clkoral)
	variable aux: bit:='0';
	begin
		if(clkoral'event and clkoral = '1') then
			if (opcodeoral = "00001") then
				case inFlagoral is
					when '0' =>
						outFlagoral <= '0';
					when '1' =>
						if(aux = '0')then
							aux:='1';
							outoral <= (portAoral or portBoral);
							outFlagoral <= '1';
						else
							outFlagoral <= '0';
						end if;
					when others => null;
				end case;	
			else--opcode
				outoral <= (others => 'Z');
				outFlagoral <= 'Z';
				aux:= '0';
			end if;
		end if; 
	end process pora;
end ora0;