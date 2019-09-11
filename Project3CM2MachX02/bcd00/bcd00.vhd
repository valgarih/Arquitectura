library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagebcd00.all;

entity bcd00 is
  port(
       clk00: inout std_logic;
       clk01: inout std_logic;
	   cdiv00: in std_logic_vector(4 downto 0);
	   cdiv01: in std_logic_vector(4 downto 0);
	   inData0: in std_logic_vector(7 downto 0);
	   reset0: in std_logic; 
	   enable0: in std_logic;
	   outFlagI80: inout std_logic;--sale de cada inst de 8
	   outFlagI120: inout std_logic;-- sale de cada inst de 12
	   outFlagIter120: inout std_logic;--va hacia el contIter
	   outFlagAC80: inout std_logic;--sale del AC8
	   outFlagAC120: inout std_logic;--sale del AC12
	   outFlagIter0: inout std_logic;--sale del contIter
	   outFlagMP0: inout std_logic;
	   outFlagMC0: inout std_logic;
	   outFlagPC0: inout std_logic;
	   outcontIter0: inout std_logic_vector(3 downto 0);
	   outCode0: inout std_logic_vector(3 downto 0);
	   outFlagCode0: inout std_logic;--sale del checCode
	   outPC0: inout std_logic_vector(3 downto 0);
	   outAC120: inout std_logic_vector(11 downto 0);--sale del mod de sust
	   outAC80: inout std_logic_vector(7 downto 0)--sale del acumulador
	   );
end bcd00;

architecture bcd0 of bcd00 is
signal sAC8b: std_logic_vector(7 downto 0);
signal sout, sAC12a, sAC12b: std_logic_vector(11 downto 0);
signal sFlagFFF: std_logic_vector(2 downto 0);
signal soutU, soutD, soutC: std_logic_vector(6 downto 0);
begin
  
  BD00: topdiv00 port map(oscout0 => clk00,
                          oscout01 => clk01,
						  indiv0 => cdiv00,
                          indiv01 => cdiv01);
  
  BD01: init00 port map(clkinit => clk00,
                        opcodeinit => outCode0,
						inFlag8init => outFlagMP0,
						outAC8init => sAC8b,
						outAC12init => sAC12b,
						outFlag12init => outFlagI120,
                        outFlag8init => outFlagI80);
  
  BD02: loadData00 port map(clkLD => clk00,
                            opcodeLD => outCode0,
							inDataLD => inData0,
							outDataLD => sAC8b,
							inFlagLD => outFlagMP0,
                            outFlagLD => outFlagI80);
  
  BD03: sust00 port map(clksu => clk00,
                        opcodesu => outCode0,
						inAC8su => outAC80,
						inAC12su => outAC120,
						inFlagsu => outFlagMP0,
						outAC12su => sAC12b,--va al AC12
						outLED12su => outAC120,-- va a LEDs
						outFlagAC12su => outFlagI120,
                        outFlagItersu => outFlagIter0);
  
  BD04: compadd00 port map(clkca => clk00,
                           codopca => outCode0,
						   inAC12ca => outAC120,
						   inFlagca => outFlagMP0,
						   outAC12ca => sAC12b,
                           outFlagAC12ca => outFlagI120);
  
  BD05: shift800 port map(clks8 => clk00,
                          opcodes8 => outCode0,
						  inACs8 => outAC80,
						  inFlags8 => outFlagMP0,
						  outACs8 => sAC8b,
                          outFlags8 => outFlagI80);
  
  BD06: shift1200 port map(clks12 => clk00,
                           opcodes12 => outCode0,
						   inACs12 => outAC120,
						   inFlags12 => outFlagMP0,
						   outACs12 => sAC12b,
                           outFlags12 => outFlagI120);
  
  BD07: ac800 port map(clkac8 => clk00,
                       inAC8 => outAC80,
					   inFlagac8 => outFlagMP0,
					   outAC8 => sAC8b,
                       outFlagac8 => outFlagAC80);
  
  BD08: ac1200 port map(clkac12 => clk00,
                        inAC12 => outAC120,
						inFlagac12 => outFlagMP0,
						outAc12 => sAC12b,
                        outFlagac12 => outFlagAC120);
  
  BD09: contIter00 port map(clkIter => clk00,
                            inFlagIter => outFlagIter120,
							resetIter => reset0,
							outContIter => outcontIter0,
                            outFlagIter => outFlagIter0);
  
  BD10: uc00 port map(RSTuc => reset0,
                      ENuc => enable0,
					  inFlagIteruc => outFlagIter0,
					  inFlagAC12uc => outFlagAC120,
					  inFlagAC8uc => outFlagAC80,
					  inFlagCodeuc => outFlagCode0,
                      F1F2F3uc => sFlagFFF);
  
  BD11: progMem00 port map(
                           );
  
  BD12: contring00 port map();
  
  BD13: coderNibbes00 port map();
  
  BD14: mux00 port map();
end bcd0;