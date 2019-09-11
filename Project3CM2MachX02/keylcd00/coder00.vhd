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
		outcoderk: out std_logic_vector(7 downto 0)
	);
end coder00;

architecture coder0 of coder00 is
begin
	pcoder: process(clkk)
	variable aux0: bit:='0';
	begin
	 if (clkk'event and clkk='1') then
		case enk is
			when '0' =>
				outcoderk <= (others => '0');
			when '1' => 
				case incontk is
					when "1000" => 
						case inkeyk is
							when "0000" => 
								aux0:='0';
								outcoderk <= "00000000";
							when "1000" => --1
								if(aux0 = '0') then
									aux0:='1';
									outcoderk <= "00110001"; --1 
								end if;
							when "0100" => --2
								if(aux0 = '0') then
									aux0:='1';
									outcoderk <= "00110010"; --2
								end if;
							when "0010" => --3
								if(aux0 = '0') then
									aux0:='1';
									outcoderk <= "00110011"; --3 
								end if;
							when "0001" => --A
								if(aux0 = '0') then
									aux0:='1';
									outcoderk <= "01000001"; --A
								end if;
							when others => null;
						end case;
					when "0100" =>
						case inkeyk is
							when "0000" => 
								aux0:='0';
								outcoderk <= "00000000";
							when "1000" =>
								if(aux0 = '0') then
									aux0:='1';
									outcoderk <= "00110100"; --4 
								end if;
							when "0100" =>
								if(aux0 = '0') then
									aux0:='1';
									outcoderk <= "00110101"; --5
								end if;
							when "0010" =>
								if(aux0 = '0') then
									aux0:='1';
									outcoderk <= "00110110"; --6
								end if;
							when "0001" =>
								if(aux0 = '0') then
									aux0:='1';
									outcoderk <= "01000010"; --B
								end if;
							when others => null;
						end case;
					when "0010" =>
						case inkeyk is
							when "0000" => 
								aux0:='0';
								outcoderk <= "00000000";
							when "1000" =>
								if(aux0 = '0') then
									aux0:='1';
									outcoderk <= "00110111"; --7
								end if;
							when "0100" =>
								if(aux0 = '0') then
									aux0:='1';
									outcoderk <= "00111000"; --8
								end if;
							when "0010" =>
								if(aux0 = '0') then
									aux0:='1';
									outcoderk <= "00111001"; --9
								end if;
							when "0001" =>
								if(aux0 = '0') then
									aux0:='1';
									outcoderk <= "01000011"; --C
								end if;
							when others => null;
						end case;
					when "0001" =>
						case inkeyk is
							when "0000" => 
								aux0:='0';
								outcoderk <= "00000000";
							when "1000" =>
								if(aux0 = '0') then
									aux0:='1';
									outcoderk <= "00110000"; --0
								end if;
							when "0100" =>
								if(aux0 = '0') then
									aux0:='1';
									outcoderk <= "00101010"; --*
								end if;
							when "0010" =>
								if(aux0 = '0') then
									aux0:='1';
									outcoderk <= "00101011"; --+
								end if;
							when "0001" =>
								if(aux0 = '0') then
									aux0:='1';
									outcoderk <= "00101101"; -- -
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