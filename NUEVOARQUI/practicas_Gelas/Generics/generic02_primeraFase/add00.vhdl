library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.components.all;

entity add00 is
  port(
       clkadd: in std_logic;
	   codopadd: in std_logic_vector(4 downto 0);
	   portAadd: in std_logic_vector(7 downto 0);
	   portBadd: in std_logic_vector(7 downto 0);
	   inFlagadd: in std_logic;
	   outadd: out std_logic_vector(7 downto 0);
	   outCarryadd: out std_logic;
       outFlagadd: out std_logic);
end add00;

architecture add0 of add00 is
begin
   padd: process(clkadd, codopadd, inFlagadd)
   variable aux: bit:='0';
   variable a, b, res: integer;
     begin
	     if (clkadd'event and clkadd = '1') then
		     if (codopadd = "00111") then
			     if (inFlagadd = '1') then
				    if (aux = '0') then
					   aux:= '1';
				       
						a := to_integer(signed(portAadd)); 
						b := to_integer(signed(portBadd)); 
						res := a + b;
						if(res >= -128 and res <= 127) then 
							outadd <= std_logic_vector(to_signed(res, 8));
							outCarryadd <= '0';
						else
							outadd <= "00000000";
							outCarryadd <= '1';
						end if;
					   
					   
					   
				       outFlagadd <= '1';
					 else
				       outFlagadd <= '1';
				    end if;
				 else
				   outFlagadd <= '0';
				 end if;
			 else
			   outadd <= (others => 'Z');
			   outFlagadd <= 'Z';
			   aux:='0';
			 end if;
		 end if;
     end process padd;
end add0;