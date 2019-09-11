library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity osc00 is
	port(osc_int: out std_logic);
end osc00

architecture osc0 of osc00 is

COMPONENT OSCH
-- synthesis translate_off
	GENERIC (NOM_FREQ: string := "2.56");
	-- synthesis translate_on
		PORT (STDBY:INstd_logic;
			OSC:OUTstd_logic;
				SEDSTDBY:OUTstd_logic);
END COMPONENT; 

attribute NOM_FREQ : string;
 attribute NOM_FREQ of OSCinst0 : label is "2.08";
 
 begin
OSCInst0: OSCH
-- synthesis translate_off
 GENERIC MAP( NOM_FREQ => "2.08" )
-- synthesis translate_on
 PORT MAP (STDBY=> stdby,
OSC => osc_int,
SEDSTDBY => stdby_sed
 );


end osc0;

