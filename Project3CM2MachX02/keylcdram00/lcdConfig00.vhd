library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity lcdConfig00 is
	port
	(
		clkcf: in std_logic;
		enablecf: in std_logic;
		incontcf: in std_logic_vector(4 downto 0);
		commandcf: out std_logic_vector(10 downto 0);
		outFlagcf: out std_logic
	);
end lcdConfig00;

architecture lcdConfig0 of lcdConfig00 is
begin
  pconfig: process(clkcf)
  begin
    if (clkcf'event and clkcf = '1') then
	  case enablecf is
	    when '0' =>
		  commandcf <= "00000000000"; -- EN, RW, RS
		  outFlagcf <= '0';
		when '1' =>          
		  case incontcf is
			when "00000" =>
			  commandcf <= "00000001100";--CLEAR SCREEN
			  outFlagcf <= '0';
			when "00001" =>
			  commandcf <= "00000001000";--CLEAR SCREEN
			  outFlagcf <= '0';
			when "00010" =>
			  commandcf <= "00000011100";--CURSOR RETURN
			  outFlagcf <= '0';
			when "00011" =>
			  commandcf <= "00000011000";-- CURSOR RETURN
			  outFlagcf <= '0';
			when "00100" =>
			  commandcf <= "00000110100";--INPUT SET
			  outFlagcf <= '0';
			when "00101" =>
			  commandcf <= "00000110000";--INPUT SET
			  outFlagcf <= '0';
			when "00110" =>
			  commandcf <= "00001111100";--DISPLAY SWITCH
			  outFlagcf <= '0';
			when "00111" =>
			  commandcf <= "00001111000";--DISPLAY SWITCH
			  outFlagcf <= '0';
			when "01000" =>
			  commandcf <= "00111100100";--FUNCTION SET
			  outFlagcf <= '0';
			when "01001" =>
			  commandcf <= "00111100000";--FUNCTION SET
			  outFlagcf <= '0';
			  
			when "01010" =>
			  commandcf <= "10000000100";--DDRAM AD SET
			  outFlagcf <= '0';
			when "01011" =>
			  commandcf <= "10000000000";--DDRAM AD SET
			  outFlagcf <= '1';
			when others => null;
		  end case; 
		when others => null;
	  end case;
	end if;
  end process;
end lcdConfig0;