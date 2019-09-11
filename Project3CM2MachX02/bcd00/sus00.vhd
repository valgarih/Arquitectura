library ieee;
use ieee.std_logic_1164.all;

library lattice;
use lattice.all;

entity sus00 is
	port
	(
		clksu: in std_logic;
		opcodesu: in std_logic_vector(3 downto 0);
		inAC8su: in std_logic_vector(7 downto 0); --entrada que viene del acumulador de 8 bits
		inAC12su: in std_logic_vector(11 downto 0); --entrada que viene del acumulador de 12 bits
		inFlagsu: in std_logic;
		outAC12su: out std_logic_vector(11 downto 0);
		outACLEDsu: out std_logic_vector(11 downto 0);
		outFlagAC12su: out std_logic;
		outFlagsu: out std_logic
	);
end sus00;

architecture sus0 of sus00 is
begin
	psust: process (clksu)
	variable aux: bit:='0';
	begin
		if(clksu'event and clksu = '1') then
			if(opcodesu = "0010") then
				case inFlagsu is
					when '1' =>
						if(aux = '0') then
							aux:='1';
							outAC12su <= inAC12su(11 downto 1) & inAC8su(7);
							outACLEDsu <= inAC12su(11 downto 1) & inAC8su(7);
							outFlagAC12su <= '1';
							outFlagsu <= '1';
						else
							outFlagAC12su <= '0';
							outFlagsu <= '0';
						end if;
					when '0' =>
						outFlagAC12su <= '0';
						outFlagsu <= '0';
					when others => null;
				end case;
			else
				aux:='0';
				outFlagAC12su <= 'Z';
				outFlagsu <= 'Z';
				outAC12su <= (others => 'Z');
				outACLEDsu <= (others => 'Z');
			end if;
		end if;
	end process psust;
end sus0;
