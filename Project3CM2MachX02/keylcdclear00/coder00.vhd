library ieee;
use ieee.std_logic_1164.all;

library lattice;
use lattice.all;

entity coder00 is
	port
	(
		clkk: in std_logic;
		enk: in std_logic;
		inkeyk: in std_logic_vector(12 downto 0);
		incontk: in std_logic_vector(5 downto 0);
		outcoderk: out std_logic_vector(7 downto 0)
	);
end coder00;

architecture coder0 of coder00 is
begin
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
		case enk is
			when '0' =>
				outcoderk <= (others => '0');
			when '1' => 
				case incontk is
					when "100000" => 
						case inkeyk is
							when "0000000000000" => 
								aux0:='0';
								aux1 := '0';
								outcoderk <= "00000000";
							when "1000000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "01011111"; -- ESC -> _
								end if;
							when "0100000000000" =>
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "00101011"; -- +
								end if;
							when "0010000000000" => 
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "00101010"; -- *
								end if;
							when "0001000000000" =>
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "00100011"; -- #
								end if;
							when "0000100000000" => 
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "00100100"; -- $
								end if;
							when "0000010000000" => 
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "00100101"; -- %
								end if;
							when "0000001000000" => 
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "00100110"; -- &
								end if;
							when "0000000100000" => 
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "00101111"; -- /
								end if;
							when "0000000010000" => 
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "00101000"; -- (
								end if;
							when "0000000001000" => 
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "00101001"; -- )
								end if;
							when "0000000000100" => 
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "00111101"; -- =
								end if;
							when "0000000000010" => 
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "01111100"; -- |
								end if;
							when "0000000000001" => 
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "01011100"; -- \'
								end if;
							when others => null;
						end case;
					when "010000" =>
						case inkeyk is
							when "0000000000000" => 
								aux0:='0';
								aux2 := '0';
								outcoderk <= "00000000";
							when "1000000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "01011111"; -- ¬ -> _
								end if;
							when "0100000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "00110001"; -- 1
								end if;
							when "0010000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "00110010"; -- 2
								end if;
							when "0001000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "00110011"; -- 3
								end if;
							when "0000100000000" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "00110100"; -- 4
								end if;
							when "0000010000000" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "00110101"; -- 5
								end if;
							when "0000001000000" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "00110110"; -- 6
								end if;
							when "0000000100000" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "00110111"; -- 7
								end if;
							when "0000000010000" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "00111000"; -- 8
								end if;
							when "0000000001000" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "00111001"; -- 9
								end if;
							when "0000000000100" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "00110000"; -- 0
								end if;
							when "0000000000010" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "01111101"; -- }
								end if;
							when "0000000000001" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "00000001"; -- RESET -> Será el Clear
								end if;
							when others => null;
						end case;
					when "001000" =>
						case inkeyk is
							when "0000000000000" => 
								aux0:='0';
								aux3 := '0';
								outcoderk <= "00000000";
							when "1000000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "01000000"; -- @
								end if;
							when "0100000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "01010001"; -- Q
								end if;
							when "0010000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "01010111"; -- W
								end if;
							when "0001000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "01000101"; -- E
								end if;
							when "0000100000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "01010010"; -- R
								end if;
							when "0000010000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "01010100"; -- T
								end if;
							when "0000001000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "01011001"; -- Y
								end if;
							when "0000000100000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "01010101"; -- U
								end if;
							when "0000000010000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "01001001"; -- I
								end if;
							when "0000000001000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "01001111"; -- O
								end if;
							when "0000000000100" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "01010000"; -- P
								end if;
							when "0000000000010" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "01111011"; -- {
								end if;
							when "0000000000001" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "10101001"; -- ENTER -> _
								end if;
							when others => null;
						end case;
					when "000100" =>
						case inkeyk is
							when "0000000000000" => 
								aux0:='0';
								aux4 := '0';
								outcoderk <= "00000000";
							when "1000000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01011111"; -- BLOQ MAYUS -> _
								end if;
							when "0100000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01000001"; -- A
								end if;
							when "0010000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01010011"; -- S
								end if;
							when "0001000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01000100"; -- D
								end if;
							when "0000100000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01000110"; -- F
								end if;
							when "0000010000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01000111"; -- G
								end if;
							when "0000001000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01001000"; -- H
								end if;
							when "0000000100000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01001010"; -- J
								end if;
							when "0000000010000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01001011"; -- K
								end if;
							when "0000000001000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01001100"; -- L
								end if;
							when "0000000000100" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01111110"; -- ~'
								end if;
							when "0000000000010" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01011011"; -- [
								end if;
							when "0000000000001" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux5 = '0' and aux6 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "01011101"; -- ]
								end if;
							when others => null;
						end case;
					when "000010" =>
						case inkeyk is
							when "0000000000000" => 
								aux0:='0';
								aux5 := '0';
								outcoderk <= "00000000";
							when "1000000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "01011110"; -- ^
								end if;
							when "0100000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "01011010"; -- Z
								end if;
							when "0010000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "01011000"; -- X
								end if;
							when "0001000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "01000011"; -- C
								end if;
							when "0000100000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "01010110"; -- V
								end if;
							when "0000010000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "01000010"; -- B
								end if;
							when "0000001000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "01001110"; -- N
								end if;
							when "0000000100000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "01001101"; -- M
								end if;
							when "0000000010000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "00101100"; -- ,
								end if;
							when "0000000001000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "00111011"; -- ;
								end if;
							when "0000000000100" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "00111010"; -- :
								end if;
							when "0000000000010" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "01011111"; -- Flecha Arriba -> _
								end if;
							when "0000000000001" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux6 = '0') then
									aux0:='1';
									aux5 := '1';
									outcoderk <= "01011111"; -- _
								end if;
							when others => null;
						end case;
					when "000001" =>
						case inkeyk is
							when "0000000000000" => 
								aux0:='0';
								aux6 := '0';
								outcoderk <= "00000000";
							when "1000000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "01011111"; -- _
								end if;
							when "0100000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "00101101"; -- -
								end if;
							when "0010000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "01011111"; -- ¿ -> _
								end if;
							when "0001000000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "00111111"; -- ?
								end if;
							when "0000100000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "01011111"; -- ¡ -> _
								end if;
							when "0000010000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "00100001"; -- !
								end if;
							when "0000001000000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "00100000"; -- Space
								end if;
							when "0000000100000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "00101110"; -- .
								end if;
							when "0000000010000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "00111100"; -- <
								end if;
							when "0000000001000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "00111110"; -- >
								end if;
							when "0000000000100" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "01111111"; -- Flecha izquierda
								end if;
							when "0000000000010" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "01011111"; -- Flecha abajo -> _
								end if;
							when "0000000000001" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0' and aux5 = '0') then
									aux0:='1';
									aux6 := '1';
									outcoderk <= "01111110"; -- Flecha derecha
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