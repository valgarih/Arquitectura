library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packagebcd00 is

  component topdiv00
  port(
       indiv0: in std_logic_vector(4 downto 0);
       oscout0: inout std_logic;
	   indiv01: in std_logic_vector(4 downto 0);
	   oscout01: inout std_logic);
  end component;

  component init00
  port( 
	clkinit: in std_logic;
	opcodeinit: in std_logic_vector( 3 downto 0 );
	inFlag8init: in std_logic;
	outAC8init: out std_logic_vector ( 7 downto 0 );
	outAC12init: out std_logic_vector ( 11 downto 0 );
	outFlag12init: out std_logic;
	outFlag8init: out std_logic);
    end component;

  component loadData00
port( 
	clkLD: in std_logic ;
	opcodeLD: in std_logic_vector ( 3 downto 0 );
	inDataLD: in std_logic_vector ( 7 downto 0 );
	outDataLD: out std_logic_vector ( 7 downto 0 );
	inFlagLD: in std_logic ;
	outFlagLD: out std_logic  );
    end component;

  component ac800
  port(
       clkac8: in std_logic;
	   inAC8: in std_logic_vector(7 downto 0);
	   inFlagac8: in std_logic;
	   outAC8: out std_logic_vector(7 downto 0);
       outFlagac8: out std_logic);
    end component;

  component pc00
  port(
       clkpc: in std_logic;
	   inFlagpc: in std_logic_vector(2 downto 0);
	   outpc: inout std_logic_vector(3 downto 0);
       outFlagpc: out std_logic);
    end component;

  component progMem00
port( 
	inFlagPM: in std_logic ;
	outFlagPM: out std_logic ;
	inPCPM: in std_logic_vector ( 3 downto 0 );
	outcodePM: out std_logic_vector(3 downto 0)  );
    end component;

  component shift800
  port(
       clks8: in std_logic;
	   opcodes8: in std_logic_vector(3 downto 0);
	   inACs8: in std_logic_vector(7 downto 0);
	   inFlags8: in std_Logic;
	   outACs8: out std_logic_vector(7 downto 0);
       outFlags8: out std_logic);
   end component;

  component ac1200
    port(
      clkac12: in std_logic;
	  inac12: in std_logic_vector ( 11 downto 0 );
	  outac12: out std_logic_vector ( 11 downto 0 );
	  inFlagac12Inst: in std_logic ;
	  outFlagac12: out std_logic  );
   end component;

  component sust00
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
   end component;

  component compadd00
   port( 
	 clkca: in std_logic ;
	 codopca: in std_logic_vector ( 3 downto 0 );
	 inBuf12ca: in std_logic_vector ( 11 downto 0 );
	 inFlagUCca: in std_logic ;
	 outFlagca: out std_logic ;
	 outBuf12ca: out std_logic_vector ( 11 downto 0 ) );
  end component;

  component shift1200
  port(
       clks12: in std_logic;
	   opcodes12: in std_logic_vector(3 downto 0);
	   inACs12: in std_logic_vector(11 downto 0);
	   inFlags12: in std_logic;
	   outACs12: out std_logic_vector(12 downto 0);
       outFlags12: out std_logic);
  end component;

  component contiter00
    port( 
	  clkit: in std_logic ;
	  resetIt: in std_logic ;
	  inFlagIt: in std_logic ;
	  outFlagIt: out std_logic ;
	  contIterac: out std_logic_vector(3 downto 0)  );
    end component;


  component uc00
    port(
       RSTuc: in std_logic;
	   ENuc: in std_logic;
	   inFlagIteruc: in std_logic;
	   inFlagAC12uc: in std_logic;
	   inFlagAC8uc: in std_logic;
	   inFlagCodeuc: in std_logic;
	   F1F2F3uc: out std_logic_vector(2 downto 0));
  end component;

  component codernibbles00
    port( 
	  AC12bit03: in std_logic_vector ( 11 downto 0 );
	  outU: out std_logic_vector ( 6 downto 0 );
	  outD: out std_logic_vector ( 6 downto 0 );
	  outC: out std_logic_vector ( 6 downto 0 ) );
    end component;

  component contring00
    port( 
	  clkr: in std_logic ;
	  resetr: in std_logic ;
	  outr: out std_logic_vector ( 3 downto 0 ) );
    end component;

  component mux00
    port( 
	  selmux: in std_logic_vector ( 3 downto 0 );
	  intBCDU: in std_logic_vector ( 6 downto 0 );
	  intBCDD: in std_logic_vector ( 6 downto 0 );
	  intBCDC: in std_logic_vector ( 6 downto 0 );
	  outBCDmux: out std_logic_vector ( 6 downto 0 ) );
    end component;


  component checkCode00
    port(
       clkch: in std_logic;
	   resetch: in std_logic;
	   inCodech: in std_logic_vector(3 downto 0);
       outFlagch: out std_logic);
  end component;

end packagebcd00; 	