library ieee;
use ieee.std_logic_1164.all;

entity eOr is
	port(
	entrada1_or: in std_logic;
	entrada2_or: in std_logic;
	salida_or: out std_logic);
end;

architecture aOr of eOr is
begin
	salida_or <= entrada1_or OR entrada2_or;
end aOr;