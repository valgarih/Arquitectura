library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity div07 is

port( 
        clkdiv: in std_logic ;
        resetdiv: in std_logic;
	outdiv: inout std_logic );

end;

architecture div0 of div07 is
signal QR: std_logic_vector(3 downto 0);
begin
  div: process (clkdiv, resetdiv)
      begin
        case resetdiv is
          when '0' =>
             QR <= (others => '0');
             outdiv <= '0';
          when '1' =>
             if (clkdiv'event and clkdiv = '1') then
                QR<= QR + 1;
                   if QR = "1000" then
                      outdiv <= not(outdiv);
                      QR <= "0000";
                   end if;
             end if;
          when others => null;
        end case;
      end process div;
end div0;