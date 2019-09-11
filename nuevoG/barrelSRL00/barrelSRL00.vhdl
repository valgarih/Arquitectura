library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity barrelSRL00 is
	port(
		 RL: in std_logic;
		 RD1: in std_logic;
		 RD2: in std_logic;
		 clks: in std_logic;
		 en: in std_logic;
		 control: std_logic_vector (3 downto 0);
		 ins: std_logic_vector (7 downto 0);
		 outs: out std_logic_vector(7 downto 0)
		);
	
end barrelSRL00;

architecture barrelSRL0 of barrelSRL00 is
	signal sins: std_logic_vector(7 downto 0);
	signal scont: std_logic_vector (3 downto 0);	
begin
	pbarrelSRL: process(clks)
	begin
	
	if (clks'event and clks= '1') then
		if(RL = '0') then
			case en is
				when '0' => 
					outs <= (others => '0');
					scont <= (others => '0');
					sins <= ins;
				when '1' =>
					if(scont < control) then
						scont <= scont + '1';
						sins (0) <= '0';
						sins(7 downto 1) <= sins (6 downto 0);
						outs <= sins;				
					else
						scont <= scont;
					end if;
				when others => null;
			end case;
		else
			case en is
				when '0' => 
					outs <= (others => '0');
					scont <= (others => '0');
					sins <= ins;
				when '1' =>
					if(scont < control) then
						scont <= scont + '1';
						sins (7) <= '0';
						sins(6 downto 0) <= sins(7 downto 1);
						--sins(7 downto 1) <= sins (6 downto 0);
						outs <= sins;				
					else
						scont <= scont;
					end if;
				when others => null;
			end case;
		end if;	
		if(RD1 = '1') then
			case en is
				when '0' => 
					outs <= (others => '0');
					scont <= (others => '0');
					sins <= ins;
				when '1' =>
					if(scont < control) then
						scont <= scont + '1';
						sins (0) <= sins(7);
						sins(7 downto 1) <= sins (6 downto 0);
						outs <= sins;				
					else
						scont <= scont;
					end if;
				when others => null;
			end case;
		end if;
		if(RD2 = '1') then 
			case en is
				when '0' => 
					outs <= (others => '0');
					scont <= (others => '0');
					sins <= ins;
				when '1' =>
					if(scont < control) then
						scont <= scont + '1';
						sins (7) <= sins(0);
						sins(6 downto 0) <= sins(7 downto 1);
						--sins(7 downto 1) <= sins (6 downto 0);
						outs <= sins;				
					else
						scont <= scont;
					end if;
				when others => null;
			end case;
		end if;	
	end if;
	end process pbarrelSRL;
end barrelSRL0;
