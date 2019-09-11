library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.components.all;

entity concat00 is
  port(
       clkct: in std_logic;
	   codopct: in std_logic_vector(4 downto 0);
	   portAct: in std_logic_vector(7 downto 0);
	   portBct: in std_logic_vector(7 downto 0);
	   inFlagct: in std_logic;
	   outct: out std_logic_vector(7 downto 0);
       outFlagct: out std_logic);
end concat00;

architecture concat0 of concat00 is
begin
   pct: process(clkct, codopct, inFlagct)
   variable aux: bit:='0';
   variable a, b: std_logic_vector(3 downto 0);
     begin
	     if (clkct'event and clkct = '1') then
		     if (codopct = "10000") then
			     if (inFlagct = '1') then
				    if (aux = '0') then
						aux:= '1';
						
						a := portAct(3 downto 0);
						b := portBct(3 downto 0);
						
						outct <= a&b;
						
				       outFlagct <= '1';
					 else
				       outFlagct <= '1';
				    end if;
				 else
				   outFlagct <= '0';
				 end if;
			 else
			   outct <= (others => 'Z');
			   outFlagct <= 'Z';
			   aux:='0';
			 end if;
		 end if;
     end process pct;
end concat0;