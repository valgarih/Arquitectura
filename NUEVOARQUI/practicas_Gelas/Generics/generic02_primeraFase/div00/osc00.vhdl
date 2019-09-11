library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;

entity osc00 is
   port(
        stdby: in std_logic;
        osc_int: out std_logic);
end osc00;



architecture osc0 of osc00 is
COMPONENT OSCH
   GENERIC (NOM_FREQ: string := "2.08");
       PORT ( STDBY :IN std_logic;
              OSC :OUT std_logic);
END COMPONENT;

attribute NOM_FREQ : string;
attribute NOM_FREQ of OSCinst0 : label is "2.08";

begin

OSCInst0: OSCH
GENERIC MAP ( NOM_FREQ => "2.08" )
     PORT MAP ( STDBY => stdby,
                OSC => osc_int);
end osc0;