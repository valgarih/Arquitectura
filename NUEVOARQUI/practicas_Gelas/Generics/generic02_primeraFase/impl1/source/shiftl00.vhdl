library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.components.all;

entity shiftl00 is
  port(
       clksl: in std_logic;
	   codopsl: in std_logic_vector(4 downto 0);
	   portAsl: in std_logic_vector(7 downto 0);
	   inFlagsl: in std_logic;
	    
	   outsl: out std_logic_vector(7 downto 0);
       outFlagsl: out std_logic);
end shiftl00;

architecture shiftl0 of shiftl00 is
begin
   psl: process(clksl, codopsl, inFlagsl)
   variable aux: bit:='0';
     begin
	     if (clksl'event and clksl = '1') then
		     if (codopsl = "01000") then
				--outsl <= portAsl(7 downto 0);
			     if (inFlagsl = '1') then
				    if (aux = '0') then
						aux:= '1';
						outsl <= portAsl;
				       outFlagsl <= '1';
					 else
				       outFlagsl <= '1';
				    end if;
				 else
					outsl(0) <= '0';
						outsl(7 downto 1) <= portAsl(6 downto 0);
				   outFlagsl <= '0';
				 end if;
			 else
			   outsl <= (others => 'Z');
			   outFlagsl <= 'Z';
			   aux:='0';
			 end if;
		 end if;
     end process psl;
end shiftl0;