library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity osc00 is
	port(
			osc_int: out std_logic);
end osc00;

architecture osc0 of osc00 is 
COMPONENT OSCH
	GENERIC (NOM_FREQ: string :="2.08");
	PORT( STDBY: IN std_logic;
		  OSC: OUT std_logic);
end COMPONENT;
attribute NOM_FREQ: string;
attribute NOM_FREQ of OSCinst0 : label is  "2.08";
	begin
	
	OSCInst0: OSCH
	GENERIC MAP(NOM_FREQ =>"2.08")
	PORT MAP(STDBY=> '0', --habilita el oscilador 
			 OSC=> osc_int);
end osc0;