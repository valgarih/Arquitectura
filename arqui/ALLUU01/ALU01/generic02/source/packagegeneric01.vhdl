library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;
library machxo2;
use machxo2.all;

package packagegeneric01 is

  component topdiv00
    port(
       indiv0: in std_logic_vector(3 downto 0);
       outdiv0: inout std_logic);
  end component;
  
  component andg01
    port(
       clka: in std_logic;
	   codopa: in std_logic_vector(4 downto 0);
	   portAa: in std_logic_vector(7 downto 0);
	   portBa: in std_logic_vector(7 downto 0);
	   inFlaga: in std_logic;
	   outa: out std_logic_vector(7 downto 0);
       outFlaga: out std_logic);
  end component;
  
   component org01
  port(
       clko: in std_logic;
	   codopo: in std_logic_vector(4 downto 0);
	   portAo: in std_logic_vector(7 downto 0);
	   portBo: in std_logic_vector(7 downto 0);
	   inFlago: in std_logic;
	   outo: out std_logic_vector(7 downto 0);
       outFlago: out std_logic);
end component;
  
  component xorg01
    port(
       clkx: in std_logic;
	   codopx: in std_logic_vector(4 downto 0);
	   portAx: in std_logic_vector(7 downto 0);
	   portBx: in std_logic_vector(7 downto 0);
	   inFlagx: in std_logic;
	   outx: out std_logic_vector(7 downto 0);
       outFlagx: out std_logic);
  end component;
  
  component notg01
  port(
       clkn: in std_logic;
	   codopn: in std_logic_vector(4 downto 0);
	   portAn: in std_logic_vector(7 downto 0);
	   inFlagn: in std_logic;
	   outn: out std_logic_vector(7 downto 0);
       outFlagn: out std_logic);
end component;
  
  component nandg01
  port(
       clkna: in std_logic;
	   codopna: in std_logic_vector(4 downto 0);
	   portAna: in std_logic_vector(7 downto 0);
	   portBna: in std_logic_vector(7 downto 0);
	   inFlagna: in std_logic;
	   outna: out std_logic_vector(7 downto 0);
       outFlagna: out std_logic);
end component;

component norg01
  port(
       clkno: in std_logic;
	   codopno: in std_logic_vector(4 downto 0);
	   portAno: in std_logic_vector(7 downto 0);
	   portBno: in std_logic_vector(7 downto 0);
	   inFlagno: in std_logic;
	   outno: out std_logic_vector(7 downto 0);
       outFlagno: out std_logic);
end component;
    
	component xnorg01
  port(
       clkxn: in std_logic;
	   codopxn: in std_logic_vector(4 downto 0);
	   portAxn: in std_logic_vector(7 downto 0);
	   portBxn: in std_logic_vector(7 downto 0);
	   inFlagxn: in std_logic;
	   outxn: out std_logic_vector(7 downto 0);
       outFlagxn: out std_logic);
end component;
	
  component topadder00
    port(
       SL: in std_logic;
	   Ai: in std_logic_vector(7 downto 0);
	   Bi: in std_logic_vector(7 downto 0);
	   So: out std_logic_vector(7 downto 0);
       LED: out std_logic);
  end component;
  
  component addg01
  port(
       clkad: in std_logic;
	   SLad: in std_logic;
	   codopad: in std_logic_vector(4 downto 0);
	   inFlagad: in std_logic;
	   outsad: in std_logic_vector(7 downto 0);
	   LEDsad: in std_logic;
	   outad: out std_logic_vector(7 downto 0);
	   LEDad: out std_logic;
       outFlagad: out std_logic);
  end component;
  
  component subg01
    port(
       clksb: in std_logic;
	   SLsb: in std_logic;
	   codopsb: in std_logic_vector(4 downto 0);
	   inFlagsb: in std_logic;
	   outssb: in std_logic_vector(7 downto 0);
	   LEDssb: in std_logic;
	   outsb: out std_logic_vector(7 downto 0);
	   LEDsb: out std_logic;
       outFlagsb: out std_logic);
  end component;
    
	component topmult4bit00
port(
		Am: in std_logic_vector(7 downto 0);
		Bm: in std_logic_vector(7 downto 0);
		Rm: out std_logic_vector(15 downto 0));
end component;
	
	component multg01
  port(
       clkmult: in std_logic;
	   codopmult: in std_logic_vector(4 downto 0);
	   inmult: in std_logic_vector(15 downto 0);
	   inFlagmult: in std_logic;
	   outmult: out std_logic_vector(15 downto 0);
       outFlagmult: out std_logic);
end component;

component ShiftL00
  port(
       clksl: in std_logic;
	   codopsl: in std_logic_vector(4 downto 0);
	   corrsl: in std_logic_vector(2 downto 0);
	   portAsl: in std_logic_vector(7 downto 0);
	   inFlagsl: in std_logic;
	   outsl: out std_logic_vector(7 downto 0);
       outFlagsl: out std_logic);
end component;
	
	component ShiftR00 
  port(
       clksr: in std_logic;
	   codopsr: in std_logic_vector(4 downto 0);
	   corrsr: in std_logic_vector(2 downto 0);
	   portAsr: in std_logic_vector(7 downto 0);
	   inFlagsr: in std_logic;
	   outsr: out std_logic_vector(7 downto 0);
       outFlagsr: out std_logic);
end component;

component rotL00
  port(
       clkrl: in std_logic;
	   codoprl: in std_logic_vector(4 downto 0);
	   corrrl: in std_logic_vector(2 downto 0);
	   portArl: in std_logic_vector(7 downto 0);
	   inFlagrl: in std_logic;
	   outrl: out std_logic_vector(7 downto 0);
       outFlagrl: out std_logic);
end component;

component rotR00
  port(
       clkrr: in std_logic;
	   codoprr: in std_logic_vector(4 downto 0);
	   corrrr: in std_logic_vector(2 downto 0);
	   portArr: in std_logic_vector(7 downto 0);
	   inFlagrr: in std_logic;
	   outrr: out std_logic_vector(7 downto 0);
       outFlagrr: out std_logic);
end component;
	
  component ucg01
    port(
       clkuc: in std_logic;
	   enableuc: in std_logic;
	   inFlaguc: in std_logic;
	   inuc: in std_logic_vector(15 downto 0);
	   outuc: out std_logic_vector(15 downto 0);
       outFlaguc: out std_logic);
  end component;

end packagegeneric01;
