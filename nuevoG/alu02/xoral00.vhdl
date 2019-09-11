library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity xoral00 is

port(clkxoral: in std_logic;
	 opcodexoral: in std_logic_vector(4 downto 0);
	 portAxoral: in std_logic_vector(7 downto 0);
	 portBxoral: in std_logic_vector(7 downto 0);
	 inFlagxoral: in std_logic;
	 outxoral: out std_logic_vector(7 downto 0);
	 outFlagxoral: out std_logic);
	
end xoral00;

architecture xoral0 of xoral00 is
begin
	pxoral: process(clkxoral)
	variable aux: bit:='0';
	begin
		if(clkxoral'event and clkxoral = '1') then
			if (opcodexoral = "00010") then
				case inFlagxoral is
					when '0' =>
						outFlagxoral <= '0';
					when '1' =>
						if(aux = '0')then
							aux:='1';
							outxoral <= (portAxoral xor portBxoral);
							outFlagxoral <= '1';
						else
							outFlagxoral <= '0';
						end if;
					when others => null;
				end case;	
			else--opcode
				outxoral <= (others => 'Z');
				outFlagxoral <= 'Z';
				aux:= '0';
			end if;
		end if; 
	end process pxoral;
end xoral0;