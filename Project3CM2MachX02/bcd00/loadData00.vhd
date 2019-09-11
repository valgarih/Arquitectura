library ieee;
use ieee.std_logic_1164.all;

library lattice;
use lattice.all;

entity loadData00 is 
	port
	(
		clkLD: in std_logic;
		opcodeLD: in std_logic_vector(3 downto 0);
		inFlagLD: in std_logic;
		inDataLD: in std_logic_vector(7 downto 0);
		outDataLD: out std_logic_vector(7 downto 0);
		outFlagLD: out std_logic
	);
end loadData00;

architecture loadData0 of loadData00 is
begin
	pLD: process(clkLD)
	variable aux: bit:='0';
	begin
		if(clkLD'event and clkLD = '1') then
			if(opcodeLD = "0001") then
				case inFlagLD is
					when '1' =>
						if(aux = '0') then
							aux:='1';
							outDataLD <= inDataLD;
							outFlagLD <= '1';	
						else
							outFlagLD <= '0';
						end if;
					when '0' =>
						outFlagLD <= '0';
					when others => null;
				end case;
			else
				aux:='0';
				outFlagLD <= 'Z';
				outDataLD <= (others => 'Z');
			end if;
		end if;
	end process pLD;
end loadData0;
