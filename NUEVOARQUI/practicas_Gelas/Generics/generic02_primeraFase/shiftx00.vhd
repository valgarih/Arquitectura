library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.components.all;

entity shiftrx00 is
  port(
       clksrx: in std_logic;
	   codopsrx: in std_logic_vector(4 downto 0);
	   portAsrx: in std_logic_vector(7 downto 0);
	   portBsrx: in std_logic_vector(7 downto 0);
	   inFlagsrx: in std_logic;
	   outsrx: out std_logic_vector(7 downto 0);
       outFlagsrx: out std_logic);
end shiftrx00;

architecture shiftrx0 of shiftrx00 is
begin
   psrx: process(clksrx, codopsrx, inFlagsrx)
   variable aux: bit:='0';
   variable a: std_logic_vector(3 downto 0);
--   variable lel: std_logic_vector(7 downto 0);
     begin
--	 I := conv_integer(a);
		 if (clksrx'event and clksrx = '1') then
		     if (codopsrx = "10001") then
				if (inFlagsrx = '1') then
					if (aux = '0') then
						aux:= '1';
						outsrx <= portAsrx;
		 			   outFlagsrx <= '1';
					 else 
					   outFlagsrx <= '1';
					end if;
					 else 
					 --lel := std_logic_vector(portAsrx);
					 --outsrx <= std_logic_vector(shift_right(unsigned(portAsrx),conv_integer(a)));
						--outsrx <= portAsrx srl conv_integer(a);
						a := portBsrx(3 downto 0);
						if(a < "1000") then
						outsrx <= "00000000";
						outsrx((7 - conv_integer(a)) downto 0) <= portAsrx(7 downto conv_integer(a));
						outFlagsrx <= '0';
						else 
						outsrx <= "00000000";
						outFlagsrx <= '0';
						end if;
						--outsrx <= "00000000";
						--outsrx((7 - 2) downto 0) <= portAsrx(7 downto 2);
						--outsr(7 downto conv_integer(a)) <= std_logic_vector(to_unsigned(conv_integer(a), conv_integer(a)'length))
						--outsrx(7 downto (7 - conv_integer(a))) <= conv_std_logic_vector(0000, 4)
						
						--outsrx(7) <= '0';
						--outsrx(6 downto 0) <= portAsrx(7 downto 1);
					   
			   end if;
			 else 
			   outsrx <= (others => 'Z');
			   outFlagsrx <= 'Z';
			   aux:='0'; 
			 end if;
		 end if;
     end process psrx;
end shiftrx0;