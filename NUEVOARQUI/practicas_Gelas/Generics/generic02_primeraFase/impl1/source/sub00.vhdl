library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.components.all;

entity sub00 is
  port(
       clksub: in std_logic;
	   codopsub: in std_logic_vector(4 downto 0);
	   portAsub: in std_logic_vector(7 downto 0);
	   portBsub: in std_logic_vector(7 downto 0);
	   inFlagsub: in std_logic;
	   outsub: out std_logic_vector(7 downto 0);
	   outCarrysub: out std_logic;
       outFlagsub: out std_logic);
end sub00;

architecture sub0 of sub00 is
begin
   psub: process(clksub, codopsub, inFlagsub)
   variable aux: bit:='0';
   variable a, b, res: integer;
     begin
	     if (clksub'event and clksub = '1') then
		     if (codopsub = "01100") then
			     if (inFlagsub = '1') then
				    if (aux = '0') then
					   aux:= '1';
				       
						a := to_integer(signed(portAsub)); 
						b := to_integer(signed(portBsub)); 
						res := a - b;
						if(res >= -128 and res <= 127) then 
							outsub <= std_logic_vector(to_signed(res, 8));
							outCarrysub <= '0';
						else
							outsub <= "00000000";
							outCarrysub <= '1';
						end if;
					   
					   
					   
				       outFlagsub <= '1';
					 else
				       outFlagsub <= '1';
				    end if;
				 else
				   outFlagsub <= '0';
				 end if;
			 else
			   outsub <= (others => 'Z');
			   outFlagsub <= 'Z';
			   aux:='0';
			 end if;
		 end if;
     end process psub;
end sub0;