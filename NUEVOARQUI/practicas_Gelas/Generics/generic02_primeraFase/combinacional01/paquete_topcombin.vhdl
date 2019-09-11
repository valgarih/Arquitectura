library ieee;
use ieee.std_logic_1164.all;

package pack_topcombin is
	component eAnd is
		port(
		entrada1_and: in std_logic;
		entrada2_and: in std_logic;
		salida_and: out std_logic);
	end component;
	
	component eTopSumCompleto
		port(
		acarreoI_tsc: in std_logic;
		entrada1_tsc: in std_logic;
		entrada2_tsc: in std_logic;
		resultado_tsc: out std_logic;
		acarreoO_tsc: out std_logic);
	end component;
end pack_topcombin;