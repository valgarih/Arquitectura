library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.components.all;
library machxo2;
use machxo2.all;

entity div00 is
  port(
       clkdiv: in std_logic;
	   indiv: in std_logic_vector(3 downto 0);
       outdiv: inout std_logic);
end div00;

architecture div0 of div00 is
signal sdiv: std_logic_vector(20 downto 0);
begin
  pdiv: process(clkdiv)
    begin
	if (clkdiv'event and clkdiv = '1')then
	  case indiv is
	     when "0000" =>
		   if (sdiv > "100000000000000000000") then
		      outdiv <= not(outdiv);
			  sdiv <= "000000000000000000000";
		   else
		      sdiv <= sdiv + 1;
		   end if;
	     when "0001" =>
		   if (sdiv > "010000000000000000000") then
		      outdiv <= not(outdiv);
			  sdiv <= "000000000000000000000";
		   else
		      sdiv <= sdiv + 1;
		   end if;
	     when "0011" =>
		   if (sdiv > "001000000000000000000") then
		      outdiv <= not(outdiv);
			  sdiv <= "000000000000000000000";
		   else
		      sdiv <= sdiv + 1;
		   end if;
	     when "0111" =>
		   if (sdiv > "000100000000000000000") then
		      outdiv <= not(outdiv);
			  sdiv <= "000000000000000000000";
		   else
		      sdiv <= sdiv + 1;
		   end if;
	     when "1111" =>
		   if (sdiv > "000010000000000000000") then
		      outdiv <= not(outdiv);
			  sdiv <= "000000000000000000000";
		   else
		      sdiv <= sdiv + 1;
		   end if;
	     when "1110" =>
		   if (sdiv > "000001000000000000000") then
		      outdiv <= not(outdiv);
			  sdiv <= "000000000000000000000";
		   else
		      sdiv <= sdiv + 1;
		   end if;
	     when "1100" =>
		   if (sdiv > "000000100000000000000") then
		      outdiv <= not(outdiv);
			  sdiv <= "000000000000000000000";
		   else
		      sdiv <= sdiv + 1;
		   end if;
		 when others => null;
	  end case;
	end if;
	end process pdiv;
end div0;