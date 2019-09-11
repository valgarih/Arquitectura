library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity coder00 is
  port(
       clkcd: in std_logic;
	   enablecd: in std_logic;
	   rwcd: in std_logic;
	   inkeycd: in std_logic_vector(3 downto 0);
	   incontcd: in std_logic_vector(3 downto 0);
       outcodercd: out std_logic_vector(7 downto 0);
	   outcontwcd: inout std_logic_vector(4 downto 0);
	   outFlagcd: out std_logic);
	   
end coder00;

architecture coder0 of coder00 is
begin
  pcoder: process(clkcd, incontcd)
  variable aux0: bit:='0';
  variable aux1: bit:='0';
  variable aux2: bit:='0';
  variable aux3: bit:='0';
  begin
  if (clkcd'event and clkcd = '1') then
  if (enablecd = '0') then
    outcodercd <= (others => '1');
	outcontwcd <= (others => '1');
	outFlagcd <='0';
  elsif ((enablecd = '1') and (rwcd = '1')) then
    outcontwcd <= outcontwcd;
  elsif ((enablecd = '1') and (rwcd = '0')) then
    case incontcd is
	  when "1000" =>--incont
	     case inkeycd is
		   when "0000" =>
		     aux0:='0';
			 outcontwcd <= outcontwcd;
			 outFlagcd <= '0';
		   when "0001" =>
		     if (aux0 = '0') then
			   aux0:='1';
		       outcodercd <= "00110001";--1
			   outcontwcd <= outcontwcd + '1';
			   outFlagcd <= '1';
			 end if;
		   when "0010" =>
		     if (aux0 = '0') then
			   aux0:='1';
		       outcodercd <= "00110010";--2
			   outcontwcd <= outcontwcd + '1';
			   outFlagcd <= '1';
			 end if;
		   when "0100" =>
		     if (aux0 = '0') then
			   aux0:='1';
		       outcodercd <= "00110011";--3
			   outcontwcd <= outcontwcd + '1';
			   outFlagcd <= '1';
			 end if;
		   when "1000" =>
		     if (aux0 = '0') then
			   aux0:='1';
		       outcodercd <= "01000001";--A
			   outcontwcd <= outcontwcd + '1';
			   outFlagcd <= '1';
			 end if;
		   when others => null;
		 end case;
	  when "0100" =>--incont
	     case inkeycd is
		   when "0000" =>
		     aux1:='0';
			 outcontwcd <= outcontwcd;
			 outFlagcd <= '0';
		   when "0001" =>
		     if (aux1 = '0') then
			   aux1:='1';
		       outcodercd <= "00110100";--4
			   outcontwcd <= outcontwcd + '1';
			   outFlagcd <= '1';
			 end if;
		   when "0010" =>
		     if (aux1 = '0') then
			   aux1:='1';
		       outcodercd <= "00110101";--5
			   outcontwcd <= outcontwcd + '1';
			   outFlagcd <= '1';
			 end if;
		   when "0100" =>
		     if (aux1 = '0') then
			   aux1:='1';
		       outcodercd <= "00110110";--6
			   outcontwcd <= outcontwcd + '1';
			   outFlagcd <= '1';
			 end if;
		   when "1000" =>
		     if (aux1 = '0') then
			   aux1:='1';
		       outcodercd <= "01000010";--B
			   outcontwcd <= outcontwcd + '1';
			   outFlagcd <= '1';
			 end if;
		   when others => null;
		 end case;
	  when "0010" =>--incont
	     case inkeycd is
		   when "0000" =>
		     aux2:='0';
			 outcontwcd <= outcontwcd;
			 outFlagcd <= '0';
		   when "0001" =>
		     if (aux2 = '0') then
			   aux2:='1';
		       outcodercd <= "00110111";--7
			   outcontwcd <= outcontwcd + '1';
			   outFlagcd <= '1';
			 end if;
		   when "0010" =>
		     if (aux2 = '0') then
			   aux2:='1';
		       outcodercd <= "00111000";--8
			   outcontwcd <= outcontwcd + '1';
			   outFlagcd <= '1';
			 end if;
		   when "0100" =>
		     if (aux2 = '0') then
			   aux2:='1';
		       outcodercd <= "00111001";--9
			   outcontwcd <= outcontwcd + '1';
			   outFlagcd <= '1';
			 end if;
		   when "1000" =>
		     if (aux2 = '0') then
			   aux2:='1';
		       outcodercd <= "01000011";--C
			   outcontwcd <= outcontwcd + '1';
			   outFlagcd <= '1';
			 end if;
		   when others => null;
		 end case;
	  when "0001" =>--incontº
	     case inkeycd is
		   when "0000" =>
		     aux3:='0';
			 outcontwcd <= outcontwcd;
			 outFlagcd <= '0';
		   when "0001" =>
		     if (aux3 = '0') then
			   aux3:='1';
		       outcodercd <= "00101010";--*
			   outcontwcd <= outcontwcd + '1';
			   outFlagcd <= '1';
			 end if;
		   when "0010" =>
		     if (aux3 = '0') then
			   aux3:='1';
		       outcodercd <= "00110000";--0
			   outcontwcd <= outcontwcd + '1';
			   outFlagcd <= '1';
			 end if;
		   when "0100" =>
		     if (aux3 = '0') then
			   aux3:='1';
		       outcodercd <= "00100011";--#
			   outcontwcd <= outcontwcd + '1';
			   outFlagcd <= '1';
			 end if;
		   when "1000" =>
		     if (aux3 = '0') then
			   aux3:='1';
		       outcodercd <= "01000100";--D
			   outcontwcd <= outcontwcd + '1';
			   outFlagcd <= '1';
			 end if;
		   when others => null;
		 end case;
	  when others => null;
	end case;--incont
	end if;--enable y rwcd
	end if;--clk
  end process pcoder;
end coder0;