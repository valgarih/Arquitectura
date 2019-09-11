library ieee;
use ieee.std_logic_1164.all;

entity eAnd is
	port(
	entrada1_and: in std_logic;
	entrada2_and: in std_logic;
	salida_and: out std_logic);
end;

architecture aAnd of eAnd is
begin
	salida_and <= entrada1_and AND entrada2_and;
end aAnd;