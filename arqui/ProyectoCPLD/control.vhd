library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity control is
port
	(
		clkc: in std_logic;
		enc: in std_logic;
		outc: out std_logic;
		outc1: out std_logic;
		aux1: out std_logic_vector(4 downto 0)
	);

end;

architecture control00 of control is
signal aux: std_logic_vector(4 downto 0):="00000";
begin
	pcontrol: process(clkc)
	  begin
       
	     if(clkc'event and clkc = '1') then		

		case enc is
		      when '1' => 
                                if aux < "01111" then
				    outc <= '0';
				    outc1 <= '1';				    										  

				elsif aux > "01111" then 
				    outc <= '1';
				    outc1 <= '0';
				  --  aux <= aux +1;
				end if;
                               aux <= aux +1;
			       aux1 <= aux;	
		       when '0' =>
		          outc <= '0';
			  outc1 <= '0';
		       when others => null;
			end case;			
	    end if;
	end process;
end control00;

