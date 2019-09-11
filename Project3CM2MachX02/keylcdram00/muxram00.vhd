library ieee;
use ieee.std_logic_1164.all;

library lattice;
use lattice.all;

entity muxram00 is
	port
	(
		enm: in std_logic;
		rwm: in std_logic;
		inwordkeym: in std_logic_vector(6 downto 0); --cuando rwm sea 0 saldrá esto
		inwordramm: in std_logic_vector(6 downto 0);
		outwordm: out std_logic_vector(6 downto 0)
	);
end muxram00;

architecture muxram0 of muxram00 is
signal s_enm_rwm: std_logic_vector(2 downto 0);
begin
	s_enm_rwm <= (enm) & (rwm) & (inFlagm);
	with s_enm_rwm select 
		outwordm <= inwordkeym when "100",
					inwordramm when "111",
					"1111111" when others;
end muxram0;