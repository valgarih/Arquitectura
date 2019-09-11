library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity mult8bita00 is

port(clkmultal: in std_logic;
	 opcodemultal: in std_logic_vector(3 downto 0);
	 portAmultal: in std_logic_vector(7 downto 0);
	 portBmultal: in std_logic_vector(7 downto 0);
	 inFlagmultal: in std_logic;
	 outmultal: out std_logic_vector(15 downto 0);
	 outFlagmultal: out std_logic);
	
end mult8bita00;

architecture mult8bita0 of mult8bita00 is
begin
	pmult: process(clkmultal)
	variable aux: bit:='0';
	begin
		if(clkmultal'event and clkmultal = '1') then
			if (opcodemultal = "0111") then
				case inFlagmultal is
					when '0' =>
						outFlagmultal <= '0';
					when '1' =>
						if(aux = '0')then
							aux:='1';
							outmultal <= portAmultal * portBmultal;
							outFlagmultal <= '1';
						else
							outFlagmultal <= '0';
						end if;
					when others => null;
				end case;	
			else--opcode
				outmultal <= (others => 'Z');
				outFlagmultal <= 'Z';
				aux:= '0';
			end if;
		end if; 
	end process pmult;
end mult8bita0;