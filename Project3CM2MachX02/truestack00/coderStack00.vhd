library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library lattice;
use lattice.all;

entity coderStack00 is 
	port
	(
		clkr: in std_logic;
		enr: in std_logic;
		rwr: in std_logic;
		inkeyr: in std_logic_vector(3 downto 0);
		incontr: in std_logic_vector(3 downto 0);
		outcoderr: out std_logic_vector(6 downto 0);
		outcontr: inout std_logic_vector(4 downto 0); --Para manejar 32 datos
		outFlagr: out std_logic;
		flag: out std_logic
	);
end coderStack00;

architecture coderStack0 of coderStack00 is
signal sconcatena: std_logic_vector(1 downto 0);
begin
	sconcatena <= (enr) & (rwr);
	pcoder: process(clkr)
	variable aux0: bit:='0';
	variable aux1: bit:='0';
	variable aux2: bit:='0';
	variable aux3: bit:='0';
	variable aux4: bit:='0';
	begin
		if (clkr'event and clkr = '1') then
			case sconcatena is
				when "00" =>
					outcoderr <= (others => '1'); --Por ser de �nodo com�n
					-- outcontr <= "00000";
					outcontr <= "11111";
					outFlagr <= '0';
					flag <= '0';
				when "10" => --modo escritura
					flag <= '0';
					case incontr is
						when "1000" => --incontr
							case inkeyr is
								when "0000" =>
									aux0:='0';
									aux1 := '0';
									outcontr <= outcontr;
									outFlagr <= '0'; --deshabilitamos cualquier dato que haya a la entrada de la RAM
								when "1000" =>
									if (aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0') then
										aux0:='1';
										aux1 := '1';
										outcoderr <= "1001111"; --1
										outcontr <= outcontr - 1; --contador de ?
										outFlagr <= '1'; --Para habilitar la escritura de este dato en la posici�n dle contador en la RAM
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when "0100" =>
									if (aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0') then
										aux0:='1';
										aux1 := '1';
										outcoderr <= "0010010"; --2
										outcontr <= outcontr - 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when "0010" =>
									if (aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0') then
										aux0:='1';
										aux1 := '1';
										outcoderr <= "0000110"; --3
										outcontr <= outcontr - 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when "0001" =>
									if (aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0') then
										aux0:='1';
										aux1 := '1';
										outcoderr <= "0001000"; --A
										outcontr <= outcontr - 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when others => null;
							end case;
						when "0100" => --incontr
							case inkeyr is
								when "0000" =>
									aux0:='0';
									aux2 := '0';
									outcontr <= outcontr;
									outFlagr <= '0'; --deshabilitamos cualquier dato que haya a la entrada de la RAM
								when "1000" =>
									if (aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0') then
										aux0:='1';
										aux2 := '1';
										outcoderr <= "1001100"; --4
										outcontr <= outcontr - 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when "0100" =>
									if (aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0') then
										aux0:='1';
										aux2 := '1';
										outcoderr <= "0100100"; --5
										outcontr <= outcontr - 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when "0010" =>	
									if (aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0') then
										aux0:='1';
										aux2 := '1';
										outcoderr <= "0100000"; --6
										outcontr <= outcontr - 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when "0001" =>
									if (aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0') then
										aux0:='1';
										aux2 := '1';
										outcoderr <= "1100000"; --b
										outcontr <= outcontr - 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when others => null;
							end case;	
						when "0010" => --incontr
							case inkeyr is
								when "0000" =>
									aux0:='0';
									aux3 := '0';
									outcontr <= outcontr;
									outFlagr <= '0'; --deshabilitamos cualquier dato que haya a la entrada de la RAM
								when "1000" =>
									if (aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0') then
										aux0:='1';
										aux3 := '1';
										outcoderr <= "0001110"; --7
										outcontr <= outcontr - 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when "0100" =>
									if (aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0') then
										aux0:='1';
										aux3 := '1';
										outcoderr <= "0000000"; --8
										outcontr <= outcontr - 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when "0010" =>
									if (aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0') then
										aux0:='1';
										aux3 := '1';
										outcoderr <= "0001100"; --9
										outcontr <= outcontr - 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when "0001" =>
									if (aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0') then
										aux0:='1';
										aux3 := '1';
										outcoderr <= "0110001"; --C
										outcontr <= outcontr - 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when others => null;
							end case;	
						when "0001" => --incontr
							case inkeyr is
								when "0000" =>
									aux0:='0';
									aux4 := '0';
									outcontr <= outcontr;
									outFlagr <= '0'; --deshabilitamos cualquier dato que haya a la entrada de la RAM
								when "1000" =>
									if (aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0') then
										aux0:='1';
										aux4 := '1';
										outcoderr <= "0000001"; --0
										outcontr <= outcontr - 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when "0100" =>
									if (aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0') then
										aux0:='1';
										aux4 := '1';
										outcoderr <= "0011100"; --*
										outcontr <= outcontr - 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when "0010" =>
									if (aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0') then
										aux0:='1';
										aux4 := '1';
										outcoderr <= "1100010"; -- +
										outcontr <= outcontr - 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when "0001" =>
									if (aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0') then
										aux0:='1';
										aux4 := '1';
										outcoderr <= "1111110"; -- -
										outcontr <= outcontr - 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when others => null;
							end case;	
						when others => null;
					end case;
				when "11" =>
					if(outcontr < "11110") then
						outcontr <= outcontr + '1';
						flag <= '1';
					else
						outcontr <= outcontr;
					end if;
				when others => null;
			end case;
		end if;
	end process pcoder;
end coderStack0;