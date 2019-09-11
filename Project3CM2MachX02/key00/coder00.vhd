library ieee;
use ieee.std_logic_1164.all;

library lattice;
use lattice.all;

entity coder00 is
	port
	(
		clkk: in std_logic;
		enk: in std_logic;
		inkeyk: in std_logic_vector(3 downto 0);
		incontk: in std_logic_vector(3 downto 0);
		outcoderk: out std_logic_vector(6 downto 0)
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
	begin
	 if (clkk'event and clkk='1') then
		case enk is
			when '0' =>
				outcoderk <= (others => '1');
			when '1' => 
				case incontk is
					when "1000" => 
						case inkeyk is
							when "0000" => 
								aux0:='0';
								aux1 := '0';
							when "1000" => --1
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "1001111"; --1 
								end if;
							when "0100" => --2
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "0010010"; --2
								end if;
							when "0010" => --3
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "0000110"; --3 
								end if;
							when "0001" => --4
								if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0') then
									aux0:='1';
									aux1 := '1';
									outcoderk <= "0001000"; --A
								end if;
							when others => null;
						end case;
					when "0100" =>
						case inkeyk is
							when "0000" => 
								aux0:='0';
								aux2 := '0';
							when "1000" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "1001100"; --4 
								end if;
							when "0100" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "0100100"; --5
								end if;
							when "0010" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "0100000"; --6
								end if;
							when "0001" =>
								if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0') then
									aux0:='1';
									aux2 := '1';
									outcoderk <= "1100000"; --b
								end if;
							when others => null;
						end case;
					when "0010" =>
						case inkeyk is
							when "0000" => 
								aux0:='0';
								aux3 := '0';
							when "1000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "0001110"; --7
								end if;
							when "0100" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "0000000"; --8
								end if;
							when "0010" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "0001100"; --9
								end if;
							when "0001" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0') then
									aux0:='1';
									aux3 := '1';
									outcoderk <= "0110001"; --C
								end if;
							when others => null;
						end case;
					when "0001" =>
						case inkeyk is
							when "0000" => 
								aux0:='0';
								aux4 := '0';
							when "1000" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "0000001"; --0
								end if;
							when "0100" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "0011100"; --*
								end if;
							when "0010" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "1100010"; --+
								end if;
							when "0001" =>
								if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0') then
									aux0:='1';
									aux4 := '1';
									outcoderk <= "1111110"; -- -
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