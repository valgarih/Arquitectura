library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity nota00 is

port(clknotaal: in std_logic;
	 opcodenotaal: in std_logic_vector(3 downto 0);
	 portAnotaal: in std_logic_vector(7 downto 0);
	 --portBal: in std_logic_vector(7 downto 0);
	 inFlagnotaal: in std_logic;
	 outnotaal: out std_logic_vector(7 downto 0);
	 outFlagnotaal: out std_logic);
	
end nota00;

architecture nota0 of nota00 is
begin
	pnotaa: process(clknotaal)
	variable aux: bit:='0';
	begin
		if(clknotaal'event and clknotaal = '1') then
			if (opcodenotaal = "0110") then
				case inFlagnotaal is
					when '0' =>
						outFlagnotaal <= '0';
					when '1' =>
						if(aux = '0')then
							aux:='1';
							outnotaal <= not (portAnotaal);
							outFlagnotaal <= '1';
						else
							outFlagnotaal <= '0';
						end if;
					when others => null;
				end case;	
			else--opcode
				outnotaal <= (others => 'Z');
				outFlagnotaal <= 'Z';
				aux:= '0';
			end if;
		end if; 
	end process pnotaa;
end nota0;