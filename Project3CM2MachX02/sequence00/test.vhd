LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

use packagesequence00.all;

ENTITY test IS
END test;

ARCHITECTURE behavior OF test IS 
signal clk, en, seq, detected: std_logic := '0';
constant clk_period : time := 10 ns;
BEGIN
   -- Instantiate the Unit Under Test (UUT)
   uut: entity sequence00 PORT MAP 
   (
	  clk => clk,
	  en => en,
	  seq => seq,
	  detected => detected
   );

   -- Clock process definitions
   clk_process :process
   begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
   end process;

   -- Stimulus process : Apply the bits in the sequence one by one.
   stim_proc: process
   begin        
        seq <= '1';             --1
      wait for clk_period;
        seq <= '1';             --11
      wait for clk_period;
        seq <= '0';             --110
      wait for clk_period;
        seq <= '1';             --1101
      wait for clk_period;
        seq <= '1';             --11011
      wait for clk_period;
        seq <= '1';             --110111
      wait for clk_period;
        seq <= '0';             --1101110
      wait for clk_period;
        seq <= '1';             --11011101
      wait for clk_period;
        seq <= '0';             --110111010
      wait for clk_period;
        seq <= '1';             --1101110101
      wait for clk_period;
      wait;         
   end process;
END;