library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity xnoral00 is

port(clkxnoral: in std_logic;
	 opcodexnoral: in std_logic_vector(4 downto 0);
	 portAxnoral: in std_logic_vector(7 downto 0);
	 portBxnoral: in std_logic_vector(7 downto 0);
	 inFlagxnoral: in std_logic;
	 outxnoral: out std_logic_vector(7 downto 0);
	 outFlagxnoral: out std_logic);
end xnoral00;

architecture xnoral0 of xnoral00 is
begin
	pxnoral: process(clkxnoral)
	variable aux: bit:='0';
	begin
		if(clkxnoral'event and clkxnoral = '1') then
			if (opcodexnoral = "00110") then
				case inFlagxnoral is
					when '0' =>
						outFlagxnoral <= '0';
					when '1' =>
						if(aux = '0')then
							aux:='1';
							outxnoral <= (portAxnoral xnor portBxnoral);
							outFlagxnoral <= '1';
						else
							outFlagxnoral <= '0';
						end if;
					when others => null;
				end case;	
			else--opcode
				outxnoral <= (others => 'Z');
				outFlagxnoral <= 'Z';
				aux:= '0';
			end if;
		end if; 
	end process pxnoral;
end xnoral0;