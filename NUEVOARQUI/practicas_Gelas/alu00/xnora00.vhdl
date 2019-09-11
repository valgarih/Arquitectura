library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity xnora00 is

port(clkxnoral: in std_logic;
	 opcodexnoral: in std_logic_vector(3 downto 0);
	 portAxnoral: in std_logic_vector(7 downto 0);
	 portBxnoral: in std_logic_vector(7 downto 0);
	 inFlagxnoral: in std_logic;
	 outxnoral: out std_logic_vector(7 downto 0);
	 outFlagxnoral: out std_logic);
	
end xnora00;

architecture xnora0 of xnora00 is
begin
	xpnora: process(clkxnoral)
	variable aux: bit:='0';
	begin
		if(clkxnoral'event and clkxnoral = '1') then
			if (opcodexnoral = "0101") then
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
	end process xpnora;
end xnora0;