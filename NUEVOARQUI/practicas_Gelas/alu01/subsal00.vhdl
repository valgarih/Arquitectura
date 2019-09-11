library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity subsal00 is
port(
	  clksubs: in std_logic;
	  opcodesubs: in std_logic_vector(4 downto 0);
	  inFlagsubs: in std_logic;
	  inLEDoverfsubs: in std_logic;
	  insubs: in std_logic_vector(7 downto 0);
	  outsubs: out std_logic_vector(7 downto 0);
	  outFlagsubs: out std_logic;
	  outSLsubs: out std_logic;
	  outLEDoverfsubs: out std_logic);
end subsal00;

architecture subsal0 of subsal00 is
begin
 psubs: process(clksubs)
 variable aux: bit:= '0';
 begin
	if(clksubs'event and clksubs = '1') then
		if(opcodesubs = "01000") then
			case inFlagsubs is
				when '1' =>
					outSLsubs <= '0';
					outFlagsubs <= '0';
				when '0' =>
				if(aux = '0') then 
					--outadd <= inadd;
					aux:= '1';
					outsubs <= insubs;
					outFlagsubs <= '1';
					outLEDoverfsubs <= inLEDoverfsubs;
					else
					outFlagsubs <= '0';
					end if;
				when others => null;
			end case;
		else --DEL OPCODE
			aux:='0';
			outsubs <= "ZZZZZZZZ";
			outFlagsubs <= 'Z';
			outLEDoverfsubs <= 'Z';
		end if;
	end if;
 end process psubs;
end subsal0;