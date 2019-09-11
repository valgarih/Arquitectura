library ieee;
use ieee.std_logic_1164.all;

entity eXnor is
	port(
	entrada1_xnor: in std_logic;
	entrada2_xnor: in std_logic;
	salida_xnor: out std_logic);
end;

architecture aXnor of eXnor is
begin
	salida_xnor <= entrada1_xnor XNOR entrada2_xnor;
end aXnor;