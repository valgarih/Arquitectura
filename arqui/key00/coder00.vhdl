library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity coder00 is
	port(
		clkc: in std_logic;
		inkeyc: in std_logic_vector(3 downto 0);
		incontc: in std_logic_vector(3 downto 0);
		outcoderc: out std_logic_vector(6 downto 0));
end coder00;

architecture coder0 of coder00 is
--constant dig1: STD_LOGIC_VECTOR(6 DOWNTO 0):="1001111";
--constant dig2: STD_LOGIC_VECTOR(6 DOWNTO 0):="0010010";
--constant dig3: STD_LOGIC_VECTOR(6 DOWNTO 0):="0000110";
--constant dig4: STD_LOGIC_VECTOR(6 DOWNTO 0):="1001100";
--constant dig5: STD_LOGIC_VECTOR(6 DOWNTO 0):="0100100";
--constant dig6: STD_LOGIC_VECTOR(6 DOWNTO 0):="0100000";
--constant dig7: STD_LOGIC_VECTOR(6 DOWNTO 0):="0001111";
--constant dig8: STD_LOGIC_VECTOR(6 DOWNTO 0):="0000000";
--constant dig9: STD_LOGIC_VECTOR(6 DOWNTO 0):="0001100";
--constant dig0: STD_LOGIC_VECTOR(6 DOWNTO 0):="0000001";
--constant letA: STD_LOGIC_VECTOR(6 DOWNTO 0):="0001000";
--constant letb: STD_LOGIC_VECTOR(6 DOWNTO 0):="1100000";
--constant letC: STD_LOGIC_VECTOR(6 DOWNTO 0):="0110001";
--constant ast: STD_LOGIC_VECTOR(6 DOWNTO 0):="0011100";
--constant mas: STD_LOGIC_VECTOR(6 DOWNTO 0):="1100010";
--constant menos: STD_LOGIC_VECTOR(6 DOWNTO 0):="1111110";
begin
	pcoder: process(clkc)
	variable aux0: bit:='0';
	variable aux1: bit:='0';
	variable aux2: bit:='0';
	variable aux3: bit:='0';
	variable aux4: bit:='0';
	begin
		if (clkc'event and clkc = '1') then
			case incontc is 
				when "1000" =>
					case inkeyc is
						when "0000" =>
							aux0:='0';
							aux1:='0';
						when "0001" =>
							if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0') then
								aux0:='1';
							    aux1:='1';
								outcoderc <= "1001111";--1
							end if;
						
						when "0010" =>
							if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0') then
								aux0 := '1';
								aux1 := '1';
								outcoderc <= "0010010";--2
							end if;
						when "0100" =>
							if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0') then
								aux0 := '1';
								aux1 := '1';
								outcoderc <= "0000110";--3
							end if;
						when "1000" =>
							if(aux0 = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0') then
								aux0 := '1';
								aux1 := '1';
								outcoderc <= "0001000";--A
							end if;
						when others => null;
					end case;
				
				
				when "0100" =>
				
					case inkeyc is
						when "0000" =>
							aux0 := '0';
						    aux2 := '0';
						when "0001" =>
							if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0') then
								aux0 := '1';
						        aux2 := '1';  
								outcoderc <= "1001100";--4
							end if;
						
						when "0010" =>
							if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0') then
								aux0 := '1';
						        aux2 := '1';
								outcoderc <= "0100100";--5
							end if;
						when "0100" =>
							if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0') then
								aux0 := '1';
						        aux2 := '1';
								outcoderc <= "0100000";--6
							end if;
						when "1000" =>
							if(aux0 = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0') then
								aux0 := '1';
						        aux2 := '1';
								outcoderc <= "1100000";--b
							end if;
						when others => null;
					end case;
				
				
				
				when "0010" =>
				
					case inkeyc is
						when "0000" =>
							aux0:='0';
						    aux3 := '0';
						when "0001" =>
							if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0') then
								aux0:='1';
								aux3:= '1';
								outcoderc <= "0001111";--7
							end if;
						
						when "0010" =>
							if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0') then
								aux0:='1';
								aux3:= '1';
								outcoderc <= "0000000";--8
							end if;
						when "0100" =>
							if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0') then
								aux0:='1';
								aux3:= '1';
								outcoderc <= "0001100";--9
							end if;
						when "1000" =>
							if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0') then
								aux0:='1';
								aux3:= '1';
								outcoderc <= "0110001";--C
							end if;
						when others => null;
					end case;
					
					
					
				when "0001" =>
				
					case inkeyc is
						when "0000" =>
							aux0:='0';
							aux4:='0';
						when "0001" =>
							if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0') then
								aux0:='1';
							    aux4:='1';
								outcoderc <= "0000001";--0
							end if;
						
						when "0010" =>
							if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0') then
								aux0:='1';
							    aux4:='1';
								outcoderc <= "0011100";--*
							end if;
						when "0100" =>
							if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0') then
								aux0:='1';
							    aux4:='1';
								outcoderc <= "1100010";--+
							end if;
						when "1000" =>
							if(aux0 = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0') then
								aux0:='1';
							    aux4:='1';
								outcoderc <= "1111110"; -- -
							end if;
						when others => null;
					end case;
					
				when others => null;
			end case;
		end if;
	end process pcoder;
end coder0;