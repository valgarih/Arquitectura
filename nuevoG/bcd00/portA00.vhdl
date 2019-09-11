library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity portA00 is
	port(clkrp: in std_logic;
	     opcoderp: in std_logic_vector(3 downto 0);
		 inportArp: in std_logic_vector(7 downto 0);
		 inFlagrp: std_logic;
		 outportrp: out std_logic_vector(7 downto 0);
	     outFlagrp: out std_logic);
end portA00;

architecture portA0 of portA00 is
begin
	pport: process(clkrp)
	variable aux: bit:='0';
	begin
		if(clkrp'event and clkrp = '1') then
			if(opcoderp = "0001") then
				case inFlagrp is
					when '0' => outFlagrp <= '0';
					when '1' => if(aux = '0') then
									aux := '1';
									outFlagrp <= '1';
									outportrp <= inportArp;
					            else
									outFlagrp <= '0';
					            end if;
					when others => null;
				end case;
			else
				aux := '0';
				outFlagrp <= 'Z';
				outportrp <= (others => 'Z');
			end if;
		end if;
	end process pport;
end portA0;