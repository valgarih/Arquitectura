library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library lattice;
use lattice.all;

entity ram00 is 
	port
	(
		clkra: in std_logic;
		enra: in std_logic;
		rwra: in std_logic;
		inwordra: in std_logic_vector(10 downto 0);
		indirWra: in std_logic_vector(4 downto 0);
		indirRra: in std_logic_vector(4 downto 0);
		outwordra: out std_logic_vector(10 downto 0)
	);
end ram00;

architecture ram0 of ram00 is
type arrayram is array(0 to 63) of std_logic_vector(10 downto 0);
signal wordram: arrayram;
begin
	pram: process(clkra)
	begin
		if (clkra'event and clkra = '1') then
			case enra is
				when '0' =>
					outwordra <= "11111111111";
				when '1' =>
					case rwra is
						when '0' => -- escribir
							wordram(conv_integer(indirWra)) <= inwordra; --Se necesita conversión pues indirWra es binario no integer
							outwordra <= inwordra;
						when '1' => -- lectura
							outwordra <= wordram(conv_integer(indirRra));
						when others => null;
					end case;
				when others => null;
			end case;
		end if;
	end process pram;
end ram0;