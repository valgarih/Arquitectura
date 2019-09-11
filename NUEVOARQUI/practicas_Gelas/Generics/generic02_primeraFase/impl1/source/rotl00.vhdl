library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.components.all;

entity rotl00 is
  port(
       clkrl: in std_logic;
	   codoprl: in std_logic_vector(4 downto 0);
	   portArl: in std_logic_vector(7 downto 0);
	   inFlagrl: in std_logic;
	    
	   outrl: inout std_logic_vector(7 downto 0);
       outFlagrl: out std_logic);
end rotl00;

architecture rotl0 of rotl00 is
begin
   prl: process(clkrl, codoprl, inFlagrl)
   variable aux: bit:='0';
     begin
	     if (clkrl'event and clkrl = '1') then
		     if (codoprl = "01010") then
				--outrl <= portArl(7 downto 0);
			     if (inFlagrl = '1') then
				    if (aux = '0') then
						aux:= '1';
						outrl <= portArl;
				       outFlagrl <= '1';
					 else
				       outFlagrl <= '1';
				    end if;
				 else
					--outrl(7) <= portArl(7);
						outrl(0) <= portArl(7);
						outrl(7 downto 1) <= portArl(6 downto 0);
				   outFlagrl <= '0';
				 end if;
			 else
			   outrl <= (others => 'Z');
			   outFlagrl <= 'Z';
			   aux:='0';
			 end if;
		 end if;
     end process prl;
end rotl0;