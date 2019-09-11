library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library lattice;
use lattice.all; 

entity coder00 is
	port
	(
		clkk: in std_logic;
		enk: in std_logic;
		rwc: in std_logic;
		inkeyk: in std_logic_vector(12 downto 0);
		incontk: in std_logic_vector(5 downto 0);
		outcoderk: out std_logic_vector(7 downto 0);
		outcontr: inout std_logic_vector(4 downto 0)
	);
end coder00;

architecture coder0 of coder00 is
signal sconcatena: std_logic_vector(1 downto 0);
begin
    sconcatena <= (enk) & (rwc);
	pcoder: process(clkk)
	variable aux0: bit:='0';
	variable aux1: bit:='0';
	variable aux2: bit:='0';
	variable aux3: bit:='0';
	variable aux4: bit:='0';
	variable aux5: bit:='0';
	variable aux6: bit:='0';
	begin
	 if (clkk'event and clkk='1') then
		case sconcatena is
			when "00" =>
				outcoderk <= (others => '1');
				outcontr <= "11111"; --Al incrementarse uno más entonces se vuelve 0, como si se reiniciara
			when "10" => 
				case incontk is
					when "100000" => 
						case inkeyk is
							when "0000000000000" => 
								aux0:='0';
								aux1 := '0';
								outcoderk <= "00000000";
								outcontr <= outcontr;
							when "1000000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "01011111"; -- ESC -> _
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0100000000000" =>
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "00101011"; -- +
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0010000000000" => 
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "00101010"; -- *
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0001000000000" =>
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "00100011"; -- #
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000100000000" => 
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "00100100"; -- $
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000010000000" => 
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "00100101"; -- %
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000001000000" => 
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "00100110"; -- &
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000100000" => 
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "00101111"; -- /
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000010000" => 
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "00101000"; -- (
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000001000" => 
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "00101001"; -- )
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000000100" => 
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "00111101"; -- =
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000000010" => 
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "01111100"; -- |
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000000001" => 
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "01011100"; -- \'
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when others => null;
						end case;
					when "010000" =>
						case inkeyk is
							when "0000000000000" => 
								aux0:='0';
								aux2 := '0';
								outcoderk <= "00000000";
								outcontr <= outcontr;
							when "1000000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "01011111"; -- ¬ -> _
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0100000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "00110001"; -- 1
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0010000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "00110010"; -- 2
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0001000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "00110011"; -- 3
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000100000000" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "00110100"; -- 4
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000010000000" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "00110101"; -- 5
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000001000000" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "00110110"; -- 6
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000100000" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "00110111"; -- 7
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000010000" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "00111000"; -- 8
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000001000" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "00111001"; -- 9
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000000100" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "00110000"; -- 0
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000000010" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "01111101"; -- }
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000000001" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "00000001"; -- RESET -> Será el Clear
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when others => null;
						end case;
					when "001000" =>
						case inkeyk is
							when "0000000000000" => 
								aux0:='0';
								aux3 := '0';
								outcoderk <= "00000000";
								outcontr <= outcontr;
							when "1000000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "01000000"; -- @
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0100000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "01010001"; -- Q
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0010000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "01010111"; -- W
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0001000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "01000101"; -- E
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000100000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "01010010"; -- R
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000010000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "01010100"; -- T
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000001000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "01011001"; -- Y
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000100000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "01010101"; -- U
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000010000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "01001001"; -- I
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000001000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "01001111"; -- O
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000000100" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "01010000"; -- P
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000000010" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "01111011"; -- {
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000000001" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "10101001"; -- ENTER -> _
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when others => null;
						end case;
					when "000100" =>
						case inkeyk is
							when "0000000000000" => 
								aux0:='0';
								aux4 := '0';
								outcoderk <= "00000000";
								outcontr <= outcontr;
							when "1000000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01011111"; -- BLOQ MAYUS -> _
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0100000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01000001"; -- A
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0010000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01010011"; -- S
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0001000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01000100"; -- D
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000100000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01000110"; -- F
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000010000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01000111"; -- G
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000001000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01001000"; -- H
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000100000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01001010"; -- J
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000010000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01001011"; -- K
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000001000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01001100"; -- L
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000000100" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01111110"; -- ~'
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000000010" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01011011"; -- [
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000000001" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01011101"; -- ]
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when others => null;
						end case;
					when "000010" =>
						case inkeyk is
							when "0000000000000" => 
								aux0:='0';
								aux5 := '0';
								outcoderk <= "00000000";
								outcontr <= outcontr;
							when "1000000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "01011110"; -- ^
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0100000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "01011010"; -- Z
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0010000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "01011000"; -- X
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0001000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "01000011"; -- C
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000100000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "01010110"; -- V
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000010000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "01000010"; -- B
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000001000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "01001110"; -- N
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000100000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "01001101"; -- M
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000010000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "00101100"; -- ,
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000001000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "00111011"; -- ;
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000000100" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "00111010"; -- :
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000000010" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "01011111"; -- Flecha Arriba -> _
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000000001" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "01011111"; -- _
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when others => null;
						end case;
					when "000001" =>
						case inkeyk is
							when "0000000000000" => 
								aux0:='0';
								aux6 := '0';
								outcoderk <= "00000000";
								outcontr <= outcontr;
							when "1000000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "01011111"; -- _
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0100000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "00101101"; -- -
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0010000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "01011111"; -- ¿ -> _
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0001000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "00111111"; -- ?
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000100000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "01011111"; -- ¡ -> _
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000010000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "00100001"; -- !
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000001000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "00100000"; -- Space
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000100000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "00101110"; -- .
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000010000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "00111100"; -- <
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000001000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "00111110"; -- >
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000000100" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "01111111"; -- Flecha izquierda
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000000010" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "01011111"; -- Flecha abajo -> _
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when "0000000000001" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "01111110"; -- Flecha derecha
									outcontr <= outcontr + 1; --contador de escritura
								else
									outcontr <= outcontr;
								end if;
							when others => null;
						end case;
					when others => null;
				end case;
			when others => null;
		end case;
		end if; --clkk
	end process pcoder;
end coder0;