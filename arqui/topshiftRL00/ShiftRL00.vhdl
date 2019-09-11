library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity shiftRL00 is
	port (
		  clks: in std_logic;
          ens: in std_logic;
          ins: in std_logic_vector(7 downto 0);
          outs: out std_logic_vector(7 downto 0);
          sel: in std_logic_vector(1 downto 0));

end shiftRL00;

architecture shiftRL0 of shiftRL00 is 

signal sins: std_logic_vector (7 downto 0);

begin 

	psRL: process(clks)
	begin 
	if(clks'event and clks ='1') then 
	 case ens is 
		when '0' =>
			sins <= ins;
			outs <= (others => '0');
	
		when '1' =>
			case sel is 
				when "00" =>
					sins(7) <= '0';
					sins(6 downto 0) <= sins(7 downto 1);
					outs <= sins;
			
				when "01" =>
					sins(0) <= '0';
					sins(7 downto 1) <= sins(6 downto 0);
					outs <= sins; 

				when "10" =>
					sins(7) <= sins(0);
					sins(6 downto 0) <= sins(7 downto 1);
					outs <= sins;
				
				when others =>
					sins(0) <= sins(7);
					sins(7 downto 1) <= sins(6 downto 0);
					outs <= sins;
			end case;
		when others => null;
		end case; 
	end if; 
end process psRL;
end shitfRL0;