library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity substract8bita00 is

port(clksubsal: in std_logic;
	 opcodesubsal: in std_logic_vector(3 downto 0);
	 portAsubsal: in std_logic_vector(7 downto 0);
	 portBsubsal: in std_logic_vector(7 downto 0);
	 inFlagsubsal: in std_logic;
	 outsubsal: out std_logic_vector(7 downto 0);
	 outFlagsubsal: out std_logic);
	
end substract8bita00;

architecture substract8bita0 of substract8bita00 is
begin
	psubs: process(clksubsal)
	variable aux: bit:='0';
	begin
		if(clksubsal'event and clksubsal = '1') then
			if (opcodesubsal = "1000") then
				case inFlagsubsal is
					when '0' =>
						outFlagsubsal <= '0';
					when '1' =>
						if(aux = '0')then
							aux:='1';
							outsubsal <= portAsubsal - portBsubsal;
							outFlagsubsal <= '1';
						else
							outFlagsubsal <= '0';
						end if;
					when others => null;
				end case;	
			else--opcode
				outsubsal <= (others => 'Z');
				outFlagsubsal <= 'Z';
				aux:= '0';
			end if;
		end if; 
	end process psubs;
end substract8bita0;