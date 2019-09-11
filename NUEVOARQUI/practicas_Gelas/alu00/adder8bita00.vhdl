library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity adder8bita00 is

port(clkadderal: in std_logic;
	 opcodeadderal: in std_logic_vector(3 downto 0);
	 portAadderal: in std_logic_vector(7 downto 0);
	 portBadderal: in std_logic_vector(7 downto 0);
	 inFlagadderal: in std_logic;
	 outadderal: out std_logic_vector(7 downto 0);
	 outFlagadderal: out std_logic);
	
end adder8bita00;

architecture adder8bita0 of adder8bita00 is
begin
	padder: process(clkadderal)
	variable aux: bit:='0';
	begin
		if(clkadderal'event and clkadderal = '1') then
			if (opcodeadderal = "0111") then
				case inFlagadderal is
					when '0' =>
						outFlagadderal <= '0';
					when '1' =>
						if(aux = '0')then
							aux:='1';
							outadderal <= portAadderal + portBadderal;
							outFlagadderal <= '1';
						else
							outFlagadderal <= '0';
						end if;
					when others => null;
				end case;	
			else--opcode
				outadderal <= (others => 'Z');
				outFlagadderal <= 'Z';
				aux:= '0';
			end if;
		end if; 
	end process padder;
end adder8bita0;