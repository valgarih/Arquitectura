library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity lcdconfig00 is
  port(
       clkc: in std_logic;
	   resetc: in std_logic;
	   inFlagc: in std_logic;
	   incontc: in std_logic_vector(4 downto 0);
	   comandoc: out std_logic_vector(7 downto 0);
	   outFlagc: out std_logic;
	   RWc: out std_logic;
	   RSc: out std_logic;
       ENc: out std_logic);
end lcdconfig00;

architecture lcdconfig0 of lcdconfig00 is
begin
  pconfig: process(clkc)
  begin
    if (clkc'event and clkc = '1') then
	  case resetc is
	    when '0' =>
		  comandoc <= (others => '0');
		  outFlagc <= '0';
		when '1' =>
		  case inFlagc is
		    when '0' =>
		       comandoc <= (others => '0');
			when '1' =>
			   case incontc is
			     when "00000" =>
				   comandoc <= "00111100";
				   outFlagc <= '0';
				   RWc <= '0';
				   RSc <= '0';
				   ENc <= '1';
				 when "00001" =>
				   comandoc <= "00111100";
				   outFlagc <= '0';
				   RWc <= '0';
				   RSc <= '0';
				   ENc <= '0';
				 when "00010" =>
				   comandoc <= "00000001";
				   outFlagc <= '0';
				   RWc <= '0';
				   RSc <= '0';
				   ENc <= '1';
				 when "00011" =>
				   comandoc <= "00000001";
				   outFlagc <= '0';
				   RWc <= '0';
				   RSc <= '0';
				   ENc <= '0'; 
				 when "00100" =>
				   comandoc <= "00000010";
				   outFlagc <= '0';
				   RWc <= '0';
				   RSc <= '0';
				   ENc <= '1';
				 when "00101" =>
				   comandoc <= "00000010";
				   outFlagc <= '0';
				   RWc <= '0';
				   RSc <= '0';
				   ENc <= '0';
				 when "00110" =>
				   comandoc <= "00000110";
				   outFlagc <= '0';
				   RWc <= '0';
				   RSc <= '0';
				   ENc <= '1';
				 when "00111" =>
				   comandoc <= "00000110";
				   outFlagc <= '0';
				   RWc <= '0';
				   RSc <= '0';
				   ENc <= '0';
				 when "01000" =>
				   comandoc <= "00001111";
				   outFlagc <= '0';
				   RWc <= '0';
				   RSc <= '0';
				   ENc <= '1';
				 when "01001" =>
				   comandoc <= "00001111";
				   outFlagc <= '0';
				   RWc <= '0';
				   RSc <= '0';
				   ENc <= '0';
				 when "01010" =>
				   comandoc <= "00011100";
				   outFlagc <= '0';
				   RWc <= '0';
				   RSc <= '0';
				   ENc <= '1';
				 when "01011" =>
				   comandoc <= "00011100";
				   outFlagc <= '0';
				   RWc <= '0';
				   RSc <= '0';
				   ENc <= '0';
				   
				 when "01100" =>
				   comandoc <= "00111100";
				   outFlagc <= '0';
				   RWc <= '0';
				   RSc <= '0';
				   ENc <= '1';

				 when "01101" =>
				   comandoc <= "00111100";
				   outFlagc <= '0';
				   RWc <= '0';
				   RSc <= '0';
				   ENc <= '0';

				 when "01110" =>
				   comandoc <= "10000001";
				   outFlagc <= '0';
				   RWc <= '0';
				   RSc <= '0';
				   ENc <= '1';
				   
				 when "01111" =>
				   comandoc <= "10000001";
				   outFlagc <= '0';
				   RWc <= '0';
				   RSc <= '0';
				   ENc <= '0';


				 when "10000" =>
				   comandoc <= "10000001";
				   outFlagc <= '1';
				   RWc <= '0';
				   RSc <= '0';
				   ENc <= '0';

				 when others => null;
			   end case;
			when others => null;
		  end case;
		when others => null;
	  end case;
	end if;
  end process pconfig;
end lcdconfig0;