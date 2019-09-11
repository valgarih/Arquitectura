library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity coder00 is
	port(
		clkc: in std_logic;
		enc: in std_logic;
		rwc: in std_logic;
		inkeyc: in std_logic_vector(3 downto 0);
		incontc: in std_logic_vector(3 downto 0);
		outcontc: inout std_logic_vector(4 downto 0);
		outFlagc: out std_logic;
		outcoderc: out std_logic_vector(6 downto 0));
end coder00;

architecture coder0 of coder00 is
constant dig1: STD_LOGIC_VECTOR(6 DOWNTO 0):="1001111";
constant dig2: STD_LOGIC_VECTOR(6 DOWNTO 0):="0010010";
constant dig3: STD_LOGIC_VECTOR(6 DOWNTO 0):="0000110";
constant dig4: STD_LOGIC_VECTOR(6 DOWNTO 0):="1001100";
constant dig5: STD_LOGIC_VECTOR(6 DOWNTO 0):="0100100";
constant dig6: STD_LOGIC_VECTOR(6 DOWNTO 0):="0100000";
constant dig7: STD_LOGIC_VECTOR(6 DOWNTO 0):="0001111";
constant dig8: STD_LOGIC_VECTOR(6 DOWNTO 0):="0000000";
constant dig9: STD_LOGIC_VECTOR(6 DOWNTO 0):="0001100";
constant dig0: STD_LOGIC_VECTOR(6 DOWNTO 0):="0000001";
constant letA: STD_LOGIC_VECTOR(6 DOWNTO 0):="0001000";
constant letb: STD_LOGIC_VECTOR(6 DOWNTO 0):="1100000";
constant letC: STD_LOGIC_VECTOR(6 DOWNTO 0):="0110001";
constant ast: STD_LOGIC_VECTOR(6 DOWNTO 0):="0011100";
constant mas: STD_LOGIC_VECTOR(6 DOWNTO 0):="1100010";
constant menos: STD_LOGIC_VECTOR(6 DOWNTO 0):="1111110";
signal scontrol: std_logic_vector(1 downto 0);
begin
	pcoder: process(clkc)
	variable aux: bit:='0';
	begin
		if rising_edge(clkc) then
		case scontrol is
		
			when "00" =>
				outcoderc <= "1111111";
				outcontc <= "00000";
				outFlagc <= '0';
				aux := '0';
			
			when "10" =>
				case incontc is 
					when "1000" =>
						case inkeyc is
							when "0000" =>
								aux:='0';
								outcontc <= outcontc;
								outFlagc <= '0';
							when "0001" =>
								if(aux = '0') then
									aux := '1';
									outcoderc <= dig1;
									outcontc <= outcontc + '1';
									outFlagc <= '1';
								else 
									outFlagc <= '0';
								end if;
							
							when "0010" =>
								if(aux = '0') then
									aux := '1';
									outcoderc <= dig2;
									outcontc <= outcontc + '1';
									outFlagc <= '1';
								else 
									outFlagc <= '0';
								end if;
								
							when "0100" =>
								if(aux = '0') then
									aux := '1';
									outcoderc <= dig3;
									outcontc <= outcontc + '1';
									outFlagc <= '1';
								else 
									outFlagc <= '0';
								end if;
								
							when "1000" =>
								if(aux = '0') then
									aux := '1';
									outcoderc <= letA;
									outcontc <= outcontc + '1';
									outFlagc <= '1';
								else 
									outFlagc <= '0';
								end if;
							when others => null;
						end case;
--------------------------------------------------------------------------------
					when "0100" =>
					
						case inkeyc is
							when "0000" =>
								aux:='0';
								outcontc <= outcontc;
								outFlagc <= '0';
							when "0001" =>
								if(aux = '0') then
									aux := '1';
									outcoderc <= dig4;
									outcontc <= outcontc + '1';
									outFlagc <= '1';
								else 
									outFlagc <= '0';
								end if;
							
							when "0010" =>
								if(aux = '0') then
									aux := '1';
									outcoderc <= dig5;
									outcontc <= outcontc + '1';
									outFlagc <= '1';
								else 
									outFlagc <= '0';
								end if;
							when "0100" =>
								if(aux = '0') then
									aux := '1';
									outcoderc <= dig6;
									outcontc <= outcontc + '1';
									outFlagc <= '1';
								else 
									outFlagc <= '0';
								end if;
							when "1000" =>
								if(aux = '0') then
									aux := '1';
									outcoderc <= letb;
									outcontc <= outcontc + '1';
									outFlagc <= '1';
								else 
									outFlagc <= '0';
								end if;
							when others => null;
						end case;
					
--------------------------------------------------------------------------					
					
					when "0010" =>
					
						case inkeyc is
							when "0000" =>
								aux:='0';
								outcontc <= outcontc;
								outFlagc <= '0';
							when "0001" =>
								if(aux = '0') then
									aux := '1';
									outcoderc <= dig7;
									outcontc <= outcontc + '1';
									outFlagc <= '1';
								else 
									outFlagc <= '0';
								end if;
							
							when "0010" =>
								if(aux = '0') then
									aux := '1';
									outcoderc <= dig8;
									outcontc <= outcontc + '1';
									outFlagc <= '1';
								else 
									outFlagc <= '0';
								end if;
							when "0100" =>
								if(aux = '0') then
									aux := '1';
									outcoderc <= dig9;
									outcontc <= outcontc + '1';
									outFlagc <= '1';
								else 
									outFlagc <= '0';
								end if;
							when "1000" =>
								if(aux = '0') then
									aux := '1';
									outcoderc <= letC;
									outcontc <= outcontc + '1';
									outFlagc <= '1';
								else 
									outFlagc <= '0';
								end if;
							when others => null;
						end case;
						
---------------------------------------------------------------------------------
						
					when "0001" =>
					
						case inkeyc is
							when "0000" =>
								aux:='0';
								outcontc <= outcontc;
								outFlagc <= '0';
							when "0001" =>
								if(aux = '0') then
									aux := '1';
									outcoderc <= dig0;
									outcontc <= outcontc + '1';
									outFlagc <= '1';
								else 
									outFlagc <= '0';
								end if;
							
							when "0010" =>
								if(aux = '0') then
									aux := '1';
									outcoderc <= ast;
									outcontc <= outcontc + '1';
									outFlagc <= '1';
								else 
									outFlagc <= '0';
								end if;
							when "0100" =>
								if(aux = '0') then
									aux := '1';
									outcoderc <= mas;
									outcontc <= outcontc + '1';
									outFlagc <= '1';
								else 
									outFlagc <= '0';
								end if;
							when "1000" =>
								if(aux = '0') then
									aux := '1';
									outcoderc <= menos;
									outcontc <= outcontc + '1';
									outFlagc <= '1';
								else 
									outFlagc <= '0';
								end if;
							when others => null;
						end case;
						
					when others => null;
				end case;
				
			when others => null; --scontrol
		end case; --scontrol
		end if; --clkc
	end process pcoder;
end coder0;