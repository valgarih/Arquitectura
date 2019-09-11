library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Sumador8bitAritmetico is
    Port 
	( 
		NUM1 : in  STD_LOGIC_VECTOR (7 downto 0);    -- 4-bit number
        NUM2 : in  STD_LOGIC_VECTOR (7 downto 0);    -- 4-bit number
		option: in std_logic;
        SUM : out  STD_LOGIC_VECTOR (8 downto 0)     -- 5 bit result
	);   
end Sumador8bitAritmetico;

architecture Sumador8bitAritmetico0 of Sumador8bitAritmetico is
begin
	process(option)
	begin
		if (option = '0') then
			SUM <= ('0' & NUM1) + ('0' & NUM2);
		else
			SUM <= ('0' & NUM1) - ('0' & NUM2);
		end if;
	end process;
end Sumador8bitAritmetico0;