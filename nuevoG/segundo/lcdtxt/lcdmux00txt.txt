library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity lcdmux00 is
  port(
       inFlagmuxconfig: in std_logic;
	   resetmux: in std_logic;
	   inwordconfig: in std_logic_vector(7 downto 0);
	   inworddata: in std_logic_vector(7 downto 0);
	   inRWc: in std_logic;
	   inRSc: in std_logic;
	   inENc: in std_logic;
	   inRWd: in std_logic;
	   inRSd: in std_logic;
	   inENd: in std_logic;
	   outwordmux: out std_logic_vector(7 downto 0);
       RWm: out std_logic;
	   RSm: out std_logic;
	   ENm: out std_logic);
end lcdmux00;

architecture lcdmux0 of lcdmux00 is
begin
  pmuxlcd: process(inwordconfig, inworddata)
  begin
    case resetmux is
	  when '0' =>
	    outWordmux <= "00000000";
		RWm <= '0';
		RSm <= '0';
		ENm <= '0';
	  when '1' =>
		case inFlagmuxconfig is
		  when '0' =>
			outwordmux <= inwordconfig;
			RWm <= inRWc;
			RSm <= inRSc;
			ENm <= inENc;
		  when '1' =>
			outwordmux <= inworddata;
			RWm <= inRWd;
			RSm <= inRSd;
			ENm <= inENd;
		  when others => null;
		end case;
	  when others => null;
    end case;
  end process pmuxlcd;
end lcdmux0;