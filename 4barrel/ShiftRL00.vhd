library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity shiftRL00 is
	port
	(
		clks: in std_logic;
		ens: in std_logic;
		ins: in std_logic_vector(8 downto 0);
		outs: out std_logic_vector(8 downto 0);
		--notimes: in std_logic_vector(3 downto 0);
		sel: in std_logic_vector(1 downto 0)
		--outseq: out std_logic
		
	);
end shiftRL00;

architecture shiftRL0 of shiftRL00 is

signal sins: std_logic_vector(8 downto 0);
--signal snotimes: std_logic_vector(3 downto 0);


-- singal scontrol: std_logic_vector(2 downto 0)
begin
	psRL: process(clks)
	begin
	if(clks'event and clks = '1') then
			case ens is
				when '0' => 
					outs <= (others => '0');
					sins <= ins;
					--snotimes <= notimes + '1';
				when '1' =>
				--if (snotimes > 0) then 
					case sel is
						when "00" => 
								sins(8) <= '0'; 
								sins(7 downto 0) <= sins(8 downto 1);
								outs <= sins;
						when "01" => 
								sins(0) <= '0'; 
								sins(8 downto 1) <= sins(7 downto 0);
								outs <= sins;	
						when "10" => 
								sins(8) <= sins(0); 
								sins(7 downto 0) <= sins(8 downto 1);
								outs <= sins;
								
						when others => 
								sins(0) <= sins(8); 
								sins(8 downto 1)<= sins(7 downto 0) ;
								outs <= sins;				
								
					end case;
						--snotimes <= snotimes - '1';		
					--end	if;					
				when others => null;
			end case;
		end if;
	end process psRL;
	
end shiftRL0;
