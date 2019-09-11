library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;

package packagegeneric01 is

  component topdiv00
  port(
       indiv0: in std_logic_vector(3 downto 0);
       outdiv0: inout std_logic);
  end component;

  component and00
    port(
       clka: in std_logic;
	   codopa: in std_logic_vector(4 downto 0);
	   portAa: in std_logic_vector(7 downto 0);
	   portBa: in std_logic_vector(7 downto 0);
	   inFlaga: in std_logic;
	    
	   outa: out std_logic_vector(7 downto 0);
       outFlaga: out std_logic);
  end component;
  
  component xor00
    port(
       clkx: in std_logic;
	   codopx: in std_logic_vector(4 downto 0);
	   portAx: in std_logic_vector(7 downto 0);
	   portBx: in std_logic_vector(7 downto 0);
	   inFlagx: in std_logic;
	    
	   outx: out std_logic_vector(7 downto 0);
       outFlagx: out std_logic);
	end component;
  
	component not00
		port(
       clkn: in std_logic;
	   codopn: in std_logic_vector(4 downto 0);
	   portAn: in std_logic_vector(7 downto 0);
	   inFlagn: in std_logic;
	    
	   outn: out std_logic_vector(7 downto 0);
       outFlagn: out std_logic);
	end component;
		  
	component or00
		port(
       clko: in std_logic;
	   codopo: in std_logic_vector(4 downto 0);
	   portAo: in std_logic_vector(7 downto 0);
	   portBo: in std_logic_vector(7 downto 0);
	   inFlago: in std_logic;
	    
	   outo: out std_logic_vector(7 downto 0);
       outFlago: out std_logic);
	end component;

	component nand00
		port(
       clkna: in std_logic;
	   codopna: in std_logic_vector(4 downto 0);
	   portAna: in std_logic_vector(7 downto 0);
	   portBna: in std_logic_vector(7 downto 0);
	   inFlagna: in std_logic;
	    
	   outna: out std_logic_vector(7 downto 0);
       outFlagna: out std_logic);
	end component;
	component nor00
		port(
       clkno: in std_logic;
	   codopno: in std_logic_vector(4 downto 0);
	   portAno: in std_logic_vector(7 downto 0);
	   portBno: in std_logic_vector(7 downto 0);
	   inFlagno: in std_logic;
	    
	   outno: out std_logic_vector(7 downto 0);
       outFlagno: out std_logic);
	end component;

	component nxor00
		port(
       clknx: in std_logic;
	   codopnx: in std_logic_vector(4 downto 0);
	   portAnx: in std_logic_vector(7 downto 0);
	   portBnx: in std_logic_vector(7 downto 0);
	   inFlagnx: in std_logic;
	    
	   outnx: out std_logic_vector(7 downto 0);
       outFlagnx: out std_logic);
	end component;

	component add00
		port(
       clkadd: in std_logic;
	   codopadd: in std_logic_vector(4 downto 0);
	   portAadd: in std_logic_vector(7 downto 0);
	   portBadd: in std_logic_vector(7 downto 0);
	   inFlagadd: in std_logic;
	   outadd: out std_logic_vector(7 downto 0);
	   outCarryadd: out std_logic;
       outFlagadd: out std_logic);
	end component;

	component sub00
		port(
       clksub: in std_logic;
	   codopsub: in std_logic_vector(4 downto 0);
	   portAsub: in std_logic_vector(7 downto 0);
	   portBsub: in std_logic_vector(7 downto 0);
	   inFlagsub: in std_logic;
	   outsub: out std_logic_vector(7 downto 0);
	   outCarrysub: out std_logic;
       outFlagsub: out std_logic);
	end component;
	
	component shiftr00
		port(
       clksr: in std_logic;
	   codopsr: in std_logic_vector(4 downto 0);
	   portAsr: in std_logic_vector(7 downto 0);
	   inFlagsr: in std_logic;
	    
	   outsr: out std_logic_vector(7 downto 0);
       outFlagsr: out std_logic);
	end component;

	component shiftl00
		 port(
       clksl: in std_logic;
	   codopsl: in std_logic_vector(4 downto 0);
	   portAsl: in std_logic_vector(7 downto 0);
	   inFlagsl: in std_logic;
	    
	   outsl: out std_logic_vector(7 downto 0);
       outFlagsl: out std_logic);
	end component;

	component rotr00
		 port(
       clkrr: in std_logic;
	   codoprr: in std_logic_vector(4 downto 0);
	   portArr: in std_logic_vector(7 downto 0);
	   inFlagrr: in std_logic;
	    
	   outrr: inout std_logic_vector(7 downto 0);
       outFlagrr: out std_logic);
	end component;

	component rotl00
		 port(
       clkrl: in std_logic;
	   codoprl: in std_logic_vector(4 downto 0);
	   portArl: in std_logic_vector(7 downto 0);
	   inFlagrl: in std_logic;
	    
	   outrl: inout std_logic_vector(7 downto 0);
       outFlagrl: out std_logic);
	end component;

	component comp2
		port(
       clkc2: in std_logic;
	   codopc2: in std_logic_vector(4 downto 0);
	   portAc2: in std_logic_vector(7 downto 0);
	   inFlagc2: in std_logic;
	    
	   outc2: out std_logic_vector(7 downto 0);
       outFlagc2: out std_logic);
	end component;

	component comp00
		port(
       clkc0: in std_logic;
	   codopc0: in std_logic_vector(4 downto 0);
	   portAc0: in std_logic_vector(7 downto 0);
	   portBc0: in std_logic_vector(7 downto 0);
	   inFlagc0: in std_logic;
	    
	   outc0: out std_logic_vector(7 downto 0);
       outFlagc0: out std_logic);
	end component;
	
	component concat00 is
  port(
       clkct: in std_logic;
	   codopct: in std_logic_vector(4 downto 0);
	   portAct: in std_logic_vector(7 downto 0);
	   portBct: in std_logic_vector(7 downto 0);
	   inFlagct: in std_logic;
	    
	   outct: out std_logic_vector(7 downto 0);
       outFlagct: out std_logic);
end component;
	
	component multicomb00 is
	port(
       clkmc: in std_logic;
	   codopmc: in std_logic_vector(4 downto 0);
	   portAmc: in std_logic_vector(7 downto 0);
	   inFlagmc: in std_logic;
	   outmc: out std_logic_vector(7 downto 0);
       outFlagmc: out std_logic);
	   end component;
	   
	   component eTopMultip00 is
		port(
		entrada1_tm: in std_logic_vector(3 downto 0);
		entrada2_tm: in std_logic_Vector(3 downto 0);
		resultado_tm: out std_logic_vector(7 downto 0));
		end component;
		
component shiftrx00 is
  port(clksrx: in std_logic;
	   codopsrx: in std_logic_vector(4 downto 0);
	   portAsrx: in std_logic_vector(7 downto 0);
	   portBsrx: in std_logic_vector(7 downto 0);
	   inFlagsrx: in std_logic;	    
	   outsrx: out std_logic_vector(7 downto 0);
       outFlagsrx: out std_logic);
end component;
	
  component uc00
      port(
       clkuc: in std_logic;
	   enable: in std_logic;
	   inuc: in std_logic_vector(7 downto 0);
	   inuc2 : in std_logic;
		inuc3 : in std_logic;
	   inFlaguc: inout std_logic;
       outuc: out std_logic_vector(7 downto 0);
	   outuc2: out std_logic;
	   outuc3: out std_logic;
	   outFlaguc: inout std_logic);
  end component;

end packagegeneric01;