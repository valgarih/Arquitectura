library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity muxra00 is
  port(
       clklm: in std_logic;
	   resetlm: in std_logic;
	   inFlagclm: in std_logic;--Lógica fuerte
	   inFlagdlm: in std_logic;--viene de la rom
	   inwordclm: in std_logic_vector(7 downto 0);
	   inworddlm: in std_logic_vector(7 downto 0);
	   RWc: in std_logic;
	   RSc: in std_logic;
	   ENc: in std_logic;
	   RWd: in std_logic;
	   RSd: in std_logic;
	   ENdd: in std_logic;
	   outwordlm: out std_logic_vector(7 downto 0);
	   RWlm: out std_logic;
	   RSlm: out std_logic;
       ENlm: out std_logic);
end muxra00;

architecture muxra0 of muxra00 is
begin
  plcdmux: process(clklm, inwordclm, inworddlm)
  begin
    if (clklm'event and clklm = '1') then
	  case resetlm is
	    when '0' =>
		  outwordlm <= "00100010";
		  RWlm <= '0';
		  RSlm <= '0';
		  ENlm <= '0';
		when '1' =>
		  case inFlagclm is
		    when '0' =>
			  outwordlm <= inwordclm;
			  RWlm <= RWc;
			  RSlm <= RSc;
			  ENlm <= ENc;
			when '1' =>
			  outwordlm <= inworddlm;
			  RWlm <= RWd;
			  RSlm <= RSd;
			  ENlm <= ENdd;
			when others => null;
		  end case;
		when others => null;
	  end case;
	end if;
  end process plcdmux;
end muxra0;