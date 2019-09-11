library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity uc00 is
  port(
       RSTuc: in std_logic;
	   ENuc: in std_logic;
	   inFlagIteruc: in std_logic;
	   inFlagAC12uc: in std_logic;
	   inFlagAC8uc: in std_logic;
	   inFlagCodeuc: in std_logic;
	   F1F2F3uc: out std_logic_vector(2 downto 0));

end uc00;

architecture uc0 of uc00 is
signal scontroluc: std_logic_vector(5 downto 0);
begin
scontroluc <= (RSTuc)&(ENuc)&(inFlagIteruc)&(inFlagAC12uc)&(inFlagAC8uc)&(inFlagCodeuc);

  with scontroluc select
     F1F2F3uc <= "000" when "000000",
	             "000" when "010000",
				 "010" when "110000",
				 "100" when "110110",
				 "100" when "110010",
				 "100" when "110100",
				 "110" when "110101",
				 "101" when "100010",
				 "101" when "100100",
				 "101" when "100011",
				 "101" when "100101",
				 "001" when "111100",
				 "000" when others;				 
end uc0;