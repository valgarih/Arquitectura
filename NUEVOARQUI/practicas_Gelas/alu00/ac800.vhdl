library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;


entity ac800 is

port(clkac: in std_logic;
	 enac: in std_logic;
	 inac: in std_logic_vector(7 downto 0);
	 inFlagac: in std_logic;
	 outac: out std_logic_vector(7 downto 0);
	 outFlagac: out std_logic);
end ac800;

architecture ac80 of ac800 is
begin
	pac: process(clkac)
	variable aux: bit:='0';
	begin
	if(clkac'event and clkac = '1') then
		if((enac = '1') or (inFlagac = '1')) then
			--if(aux = '0') then
				--aux:= '1';
				outac <= inac;
				outFlagac <= '1';
			--else--1
				--outFlagac <= '0';
			--end if;
		else
			outFlagac <= '0';
			--aux:='0';
		end if;
	end if;
	end process pac;
end ac80;