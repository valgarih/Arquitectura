library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

package packageadder00 is
	component topfa00
		port(
		C00: in std_logic ;
		A00: in std_logic ;
		B00: in std_logic ;
		S00: out std_logic ;
		C01: out std_logic );
	end component;
	
	component nxor00
		port(
		Anx: in std_logic ;
		Bnx: in std_logic ;
		Ynx: out std_logic );
	end component; 
end packageadder00; 