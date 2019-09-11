library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity lcdData00 is
  port(
       clkw: in std_logic;
	   enablew: in std_logic;
	   inFlagw: in std_logic;
	   incontw: in std_logic_vector(4 downto 0);
	   outWordw: out std_logic_vector(7 downto 0);
       outFlagw: out std_logic);
end lcdData00;

architecture lcdData0 of lcdData00 is
type arrayData is array(0 to 63) of std_logic_vector(7 downto 0);
constant wordData: arrayData:=("00100001",--�
                               "00100000",--ESPACIO
                               "01001000",--H
							   "01001111",--O
							   "01001100",--L
							   "01000001",--A
							   "00100000",--ESPACIO
							   "01001101",--M
							   "01010101",--U
							   "01001110",--N
							   "01000100",--D
							   "01001111",--O
							   "00100000",--ESPACIO
							   "00100001",--�
                               others => "00100000");
begin
  pdata: process(clkw)
  begin
    if (clkw'event and clkw = '1') then
	  case enablew is
	    when '0' =>
		  outWordw <= (others => '0');
		  outFlagw <= '0';
		when '1' =>
		  case inFlagw is
		    when '0' =>
			  outWordw <= (others => '0');
			  outFlagw <= '0';
			when '1' =>
              outWordw <= wordData(conv_integer(incontw));
			  outFlagw <= '1';
			when others => null;
		  end case;
		when others => null;
	  end case;
	end if;
  end process pdata;
end lcdData0;