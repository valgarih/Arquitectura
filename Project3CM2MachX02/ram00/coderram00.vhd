library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library lattice;
use lattice.all;

entity coderram00 is 
	port
	(
		clkr: in std_logic;
		enr: in std_logic;
		rwr: in std_logic;
		inkeyr: in std_logic_vector(3 downto 0);
		incontr: in std_logic_vector(3 downto 0);
		outcoderr: out std_logic_vector(6 downto 0);
		outcontr: inout std_logic_vector(4 downto 0); --Para manejar 32 datos
		outFlagr: out std_logic
	);
end coderram00;

architecture coderram0 of coderram00 is
signal sconcatena: std_logic_vector(1 downto 0);
begin
	sconcatena <= (enr) & (rwr);
	pcoder: process(clkr)
	variable aux0: bit:='0';
	variable aux1: bit:='0';
	variable aux2: bit:='0';
	variable aux3: bit:='0';
	begin
		if (clkr'event and clkr = '1') then
			case sconcatena is
				when "00" => -- RAM deshabilitada
					outcoderr <= "1111111"; --Por ser de ánodo común
					-- outcontr <= "00000";
					outcontr <= "11111"; --Al incrementarse uno más entonces se vuelve 0, como si se reiniciara
					outFlagr <= '0';
				when "10" => --modo escritura
					case incontr is
						when "1000" => --incontr
							case inkeyr is
								when "0000" =>
									aux0:='0';
									outcontr <= outcontr;
									outFlagr <= '0'; --deshabilitamos cualquier dato que haya a la entrada de la RAM
								when "0001" =>
									if (aux0 = '0') then
										aux0:='1';
										outcoderr <= "1001111"; --1
										outcontr <= outcontr + 1; --contador de escritura
										outFlagr <= '1'; --Para habilitar la escritura de este dato en la posición dle contador en la RAM
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when "0010" =>
									if (aux0 = '0') then
										aux0:='1';
										outcoderr <= "0010010"; --2
										outcontr <= outcontr + 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when "0100" =>
									if (aux0 = '0') then
										aux0:='1';
										outcoderr <= "0000110"; --3
										outcontr <= outcontr + 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when "1000" =>
									if (aux0 = '0') then
										aux0:='1';
										outcoderr <= "0001000"; --A
										outcontr <= outcontr + 1;
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
									aux1:='0';
									outcontr <= outcontr;
									outFlagr <= '0'; --deshabilitamos cualquier dato que haya a la entrada de la RAM
								when "0001" =>
									if (aux1 = '0') then
										aux1:='1';
										outcoderr <= "1001100"; --4
										outcontr <= outcontr + 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when "0010" =>
									if (aux1 = '0') then
										aux1:='1';
										outcoderr <= "0100100"; --5
										outcontr <= outcontr + 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when "0100" =>	
									if (aux1 = '0') then
										aux1:='1';
										outcoderr <= "0100000"; --6
										outcontr <= outcontr + 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when "1000" =>
									if (aux1 = '0') then
										aux1:='1';
										outcoderr <= "1100000"; --b
										outcontr <= outcontr + 1;
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
									aux2:='0';
									outcontr <= outcontr;
									outFlagr <= '0'; --deshabilitamos cualquier dato que haya a la entrada de la RAM
								when "0001" =>
									if (aux2 = '0') then
										aux2:='1';
										outcoderr <= "0001110"; --7
										outcontr <= outcontr + 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when "0010" =>
									if (aux2 = '0') then
										aux2:='1';
										outcoderr <= "0000000"; --8
										outcontr <= outcontr + 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when "0100" =>
									if (aux2 = '0') then
										aux2:='1';
										outcoderr <= "0001100"; --9
										outcontr <= outcontr + 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when "1000" =>
									if (aux2 = '0') then
										aux2:='1';
										outcoderr <= "0110001"; --C
										outcontr <= outcontr + 1;
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
									aux3:='0';
									outcontr <= outcontr;
									outFlagr <= '0'; --deshabilitamos cualquier dato que haya a la entrada de la RAM
								when "0001" =>
									if (aux3 = '0') then
										aux3:='1';
										outcoderr <= "0000001"; --0
										outcontr <= outcontr + 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when "0010" =>
									if (aux3 = '0') then
										aux3:='1';
										outcoderr <= "0011100"; --*
										outcontr <= outcontr + 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when "0100" =>
									if (aux3 = '0') then
										aux3:='1';
										outcoderr <= "1100010"; -- +
										outcontr <= outcontr + 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when "1000" =>
									if (aux3 = '0') then
										aux3:='1';
										outcoderr <= "1111110"; -- -
										outcontr <= outcontr + 1;
										outFlagr <= '1'; 
									else
										outcontr <= outcontr;
										outFlagr <= '0';
									end if;
								when others => null;
							end case;	
						when others => null;
					end case;
				when others => null;
			end case;
		end if;
	end process pcoder;
end coderram0;