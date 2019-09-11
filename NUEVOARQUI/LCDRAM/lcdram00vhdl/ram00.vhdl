library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity ram00 is
  port(
       clkra: in std_logic;
	   enablera: in std_logic;
	   rwra: in std_logic;
	   inFlagra: in std_logic;
	   inFlagdd: in std_logic;
	   indirWra: in std_logic_vector(4 downto 0);
	   indirRra: in std_logic_vector(4 downto 0);
	   inwordra: in std_logic_vector(7 downto 0);
       outwordra: out std_logic_vector(7 downto 0));
end ram00;

architecture ram0 of ram00 is
type arrayram is array(0 to 31) of std_logic_vector(7 downto 0);
signal wordram: arrayram:=(others => (others => '1'));
begin
  pram: process(clkra)
  begin
     if (clkra'event and clkra = '1') then
       case enablera is
	     when '0' =>
		   outwordra <= (others => '1');
		 when '1' =>
		   case rwra is
		     when '0' =>
			   if (inFlagra = '1') then
			     wordram(conv_integer(indirWra)) <= inwordra;
			   end if;
			 when '1' =>
			   if(inFlagdd = '1') then
			     outwordra <= wordram(conv_integer(indirRra));
			   end if;
			 when others => null;
		   end case;
		 when others => null;
	   end case;
	 end if;
  end process pram;
end ram0;