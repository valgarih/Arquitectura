library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
------------------
package packagelcdram00 is

	component toposc00
		port(
		 clk0: inout std_logic;
		 cdiv0: in std_logic_vector(4 downto 0));
	end component;
	  
	component lcdram00
	port(
		LCD_DATA : out  STD_LOGIC_VECTOR (7 downto 0);
		
		LCD_ENABLE : out  STD_LOGIC;
		LCD_RS : out  STD_LOGIC;

		LED1 : out  STD_LOGIC;
		LED2 : out  STD_LOGIC;

		CLK : in  STD_LOGIC;
		CLR : in  STD_LOGIC;
	
	COLS: inout std_logic_vector(3 downto 0);
	ROWS: in std_logic_vector(3 downto 0);
	
	OP: IN STD_LOGIC
	);
	end component;

end packagelcdram00;