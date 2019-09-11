library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity nanda00 is

port(clkaal: in std_logic;
	 opcodeaal: in std_logic_vector(3 downto 0);
	 portAaal: in std_logic_vector(7 downto 0);
	 portBaal: in std_logic_vector(7 downto 0);
	 inFlagaal: in std_logic;
	 outaal: out std_logic_vector(7 downto 0);
	 outFlagaal: out std_logic);
	
end nanda00;

architecture nanda0 of nanda00 is
begin
	pana: process(clkaal)
	variable aux: bit:='0';
	begin
		if(clkaal'event and clkaal = '1') then
			if (opcodeaal = "0011") then
				case inFlagaal is
					when '0' =>
						outFlagaal <= '0';
					when '1' =>
						if(aux = '0')then
							aux:='1';
							outaal <= (portAaal nand portBaal);
							outFlagaal <= '1';
						else
							outFlagaal <= '0';
						end if;
					when others => null;
				end case;	
			else--opcode
				outaal <= (others => 'Z');
				outFlagaal <= 'Z';
				aux:= '0';
			end if;
		end if; 
	end process pana;
end nanda0;