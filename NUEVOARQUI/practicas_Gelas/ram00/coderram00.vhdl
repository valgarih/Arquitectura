library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity coderram00 is
  port(
       clkc: in std_logic;
	   enc: in std_logic;
	   inFlagc: in std_logic;
       inkey: in std_logic_vector(3 downto 0);
	   incont: in std_logic_vector(4 downto 0);
	   outcontc: inout std_logic_vector(4 downto 0);
       outcoder: out std_logic_vector(6 downto 0);
	   outFlagc: out std_logic);
end coderram00;

architecture coderram0 of coderram00 is
signal sinkeyA: std_logic;
signal scontstate: std_logic_vector(3 downto 0);
begin
  pcoder: process(incont, inkey)
  variable aux0: bit:='0';
  variable aux1: bit:='0';
  variable aux2: bit:='0';
  variable aux3: bit:='0';
  variable auxA: bit:='0';
  variable auxB: bit:='0';
  variable auxC: bit:='0';
  variable auxD: bit:='0';
  begin
  if (clkc'event and clkc = '1') then
---------------------------------------------------------
   case enc is  --enc
    when '0' =>
      outcoder <= "1111111";
	  outcontc <= "11111";
	  scontstate <= "0000";
	  sinkeyA <= '0';
-------------------------------------------------------
    when '1' =>
    case incont is
	  when "01000" =>--incont 10000
	    scontstate <= scontstate + '1';
	    case (inkey)&(sinkeyA) is
		  when "00010" => 
		    if ((aux0 = '0') and (inFlagc = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='1';
			  auxB:='0';
			  auxC:='0';
			  auxD:='0';
			  outcoder <= "1001111";--1
			  outcontc <= outcontc + '1';
			  outFlagc <= '1';
			else
			  auxA:='1';
			  auxB:='0';
			  auxC:='0';
			  auxD:='0';
			  outFlagc <= '0';
			end if;
		  when "00100" => 
		    if ((aux0 = '0') and (inFlagc = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='1';
			  auxB:='0';
			  auxC:='0';
			  auxD:='0';
			  outcoder <= "0010010";--2
			  outcontc <= outcontc + '1';
			  outFlagc <= '1';
			else
			  auxA:='1';
			  auxB:='0';
			  auxC:='0';
			  auxD:='0';
			  outFlagc <= '0';
			end if;
		  when "01000" => 
		    if ((aux0 = '0') and (inFlagc = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='1';
			  auxB:='0';
			  auxC:='0';
			  auxD:='0';
			  outcoder <= "0000110";--3
			  outcontc <= outcontc + '1';
			  outFlagc <= '1';
			else
			  auxA:='1';
			  auxB:='0';
			  auxC:='0';
			  auxD:='0';
			  outFlagc <= '0';
			end if;
		  when "10000" =>  
		    if ((aux0 = '0') and (inFlagc = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='1';
			  auxB:='0';
			  auxC:='0';
			  auxD:='0';
			  outcoder <= "0001000";--A
			  outcontc <= outcontc + '1';
			  outFlagc <= '1';
		    else
			  auxA:='1';
			  auxB:='0';
			  auxC:='0';
			  auxD:='0';
			  outFlagc <= '0';
			end if;
		  when others => null;
		end case;
	  when "00100" =>--incont 01000
	  scontstate <= scontstate + '1';
	    case (inkey)&(sinkeyA) is
		  when "00010" => 
		    if ((aux1 = '0') and (inFlagc = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='0';
			  auxB:='1';
			  auxC:='0';
			  auxD:='0';
			  outcoder <= "1001100";--4
			  outcontc <= outcontc + '1';
			  outFlagc <= '1';
		    else
			  auxA:='0';
			  auxB:='1';
			  auxC:='0';
			  auxD:='0';
			  outFlagc <= '0';
			end if;
		  when "00100" => 
		    if ((aux1 = '0') and (inFlagc = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='0';
			  auxB:='1';
			  auxC:='0';
			  auxD:='0';
			  outcoder <= "0100100";--5
			  outcontc <= outcontc + '1';
			  outFlagc <= '1';
	        else
			  auxA:='0';
			  auxB:='1';
			  auxC:='0';
			  auxD:='0';
			  outFlagc <= '0';
			end if;
		  when "01000" => 
		    if ((aux1 = '0') and (inFlagc = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='0';
			  auxB:='1';
			  auxC:='0';
			  auxD:='0';
			  outcoder <= "0100000";--6
			  outcontc <= outcontc + '1';
			  outFlagc <= '1';
			else
			  auxA:='0';
			  auxB:='1';
			  auxC:='0';
			  auxD:='0';
			  outFlagc <= '0';
			end if;
		  when "10000" =>  
		    if ((aux1 = '0') and (inFlagc = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='0';
			  auxB:='1';
			  auxC:='0';
			  auxD:='0';
			  outcoder <= "1100000";--b
			  outcontc <= outcontc + '1';
			  outFlagc <= '1';
            else
			  auxA:='0';
			  auxB:='1';
			  auxC:='0';
			  auxD:='0';
			  outFlagc <= '0';
			end if;
		  when others => null;
		end case;
	  when "00010" =>--incont 00100
	  scontstate <= scontstate + '1';
	    case (inkey)&(sinkeyA) is
		  when "00010" => 
		    if ((aux2 = '0') and (inFlagc = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='0';
			  auxB:='0';
			  auxC:='1';
			  auxD:='0';
			  outcoder <= "0001111";--7
			  outcontc <= outcontc + '1';
			  outFlagc <= '1';
            else
			  auxA:='0';
			  auxB:='0';
			  auxC:='1';
			  auxD:='0';
			  outFlagc <= '0';
			end if;
		  when "00100" => 
		    if ((aux2 = '0') and (inFlagc = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='0';
			  auxB:='0';
			  auxC:='1';
			  auxD:='0';
			  outcoder <= "0000000";--8
			  outcontc <= outcontc + '1';
			  outFlagc <= '1';
	        else
			  auxA:='0';
			  auxB:='0';
			  auxC:='1';
			  auxD:='0';
			  outFlagc <= '0';
			end if;
		  when "01000" =>  
		    if ((aux2 = '0') and (inFlagc = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='0';
			  auxB:='0';
			  auxC:='1';
			  auxD:='0';
			  outcoder <= "0001100";--9
			  outcontc <= outcontc + '1';
			  outFlagc <= '1';
			else
			  auxA:='0';
			  auxB:='0';
			  auxC:='1';
			  auxD:='0';
			  outFlagc <= '0';
			end if;
		  when "10000" =>  
		    if ((aux2 = '0') and (inFlagc = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='0';
			  auxB:='0';
			  auxC:='1';
			  auxD:='0';
			  outcoder <= "0110001";--C
			  outcontc <= outcontc + '1';
			  outFlagc <= '1';
			else
			  auxA:='0';
			  auxB:='0';
			  auxC:='1';
			  auxD:='0';
			  outFlagc <= '0';
			end if;
		  when others => null;
		end case;
	  when "00001" => --incont 00010
	  scontstate <= scontstate + '1';
	    case (inkey)&(sinkeyA) is
		  when "00010" => 
		    if ((aux3 = '0') and (inFlagc = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='0';
			  auxB:='0';
			  auxC:='0';
			  auxD:='1';
			  outcoder <= "0000001";--0
			  outcontc <= outcontc + '1';
			  outFlagc <= '1';
			else
			  auxA:='0';
			  auxB:='0';
			  auxC:='0';
			  auxD:='1';
			  outFlagc <= '0';
			end if;
		  when "00100" =>  
		    if ((aux3 = '0') and (inFlagc = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='0';
			  auxB:='0';
			  auxC:='0';
			  auxD:='1';
			  outcoder <= "0011100";--*
			  outcontc <= outcontc + '1';
			  outFlagc <= '1';
			else
			  auxA:='0';
			  auxB:='0';
			  auxC:='0';
			  auxD:='1';
			  outFlagc <= '0';
			end if;
		  when "01000" => 
		    if ((aux3 = '0') and (inFlagc = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='0';
			  auxB:='0';
			  auxC:='0';
			  auxD:='1';
			  outcoder <= "1100010";--+
			  outcontc <= outcontc + '1';
			  outFlagc <= '1';
		    else
			  auxA:='0';
			  auxB:='0';
			  auxC:='0';
			  auxD:='1';
			  outFlagc <= '0';
			end if;
		  when "10000" =>  
		    if ((aux3 = '0') and (inFlagc = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='0';
			  auxB:='0';
			  auxC:='0';
			  auxD:='1';
			  outcoder <= "1111110";-- -
			  outcontc <= outcontc + '1';
			  outFlagc <= '1';
			else
			  auxA:='0';
			  auxB:='0';
			  auxC:='0';
			  auxD:='1';
			  outFlagc <= '0';
			end if;
		  when others => null;
		end case;
	  when "10000" =>--incont 00001
	    scontstate <= scontstate + '1';
------------------------------------------------sigue A-----------
	    if ((auxA = '1') and (scontstate > "0100")) then
		   auxA:='0';
		   auxB:='0';
		   auxC:='0';
		   auxD:='0';
		   aux0:='1';
		   aux1:='1';
		   aux2:='1';
		   aux3:='1';
           scontstate <= "0000";
		elsif ((auxA = '0') and (scontstate > "0101")) then
		   auxA:='0';
		   auxB:='0';
		   auxC:='0';
		   auxD:='0';
		   aux0:='0';
		   aux1:='0';
		   aux2:='0';
		   aux3:='0';
		   scontstate <= "0000";
-------------------------------------------------------sigue B-----------
		elsif ((auxB = '1') and (scontstate < "0101")) then
		   auxA:='0';
		   auxB:='0';
		   auxC:='0';
		   auxD:='0';
		   aux0:='1';
		   aux1:='1';
		   aux2:='1';
		   aux3:='1';
		   scontstate <= "0000";
		elsif ((auxB = '0') and (scontstate > "1001")) then
		   auxA:='0';
		   auxB:='0';
		   auxC:='0';
		   auxD:='0';
		   aux0:='1';
		   aux1:='0';
		   aux2:='1';
		   aux3:='1';
		   scontstate <= "0000";
------------------------------------------------------sigue C------------
		elsif ((auxC = '1') and (scontstate < "0101")) then
		   auxA:='0';
		   auxB:='0';
		   auxC:='0';
		   auxD:='0';
		   aux0:='1';
		   aux1:='1';
		   aux2:='1';
		   aux3:='1';
		   scontstate <= "0000";
		elsif ((auxC = '0') and (scontstate > "1001")) then
		   auxA:='0';
		   auxB:='0';
		   auxC:='0';
		   auxD:='0';
		   aux0:='1';
		   aux1:='1';
		   aux2:='0';
		   aux3:='1';
		   scontstate <= "0000";
----------------------------------------------------sigue D--------------
		elsif ((auxD = '1') and (scontstate < "0101")) then
		   auxA:='0';
		   auxB:='0';
		   auxC:='0';
		   auxD:='0';
		   aux0:='1';
		   aux1:='1';
		   aux2:='1';
		   aux3:='1';
		   scontstate <= "0000";
		elsif ((auxD = '0') and (scontstate > "1001")) then
		   auxA:='0';
		   auxB:='0';
		   auxC:='0';
		   auxD:='0';
		   aux0:='1';
		   aux1:='1';
		   aux2:='1';
		   aux3:='0';
		   scontstate <= "0000";
------------------------------------------------------------------
		end if;
	  when others => null;--incont
	end case;--incont
	when others => null;
   end case;--enc
  end if;
  end process pcoder;
end coderram0;