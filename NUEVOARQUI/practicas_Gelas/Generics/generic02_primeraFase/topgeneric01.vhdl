library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;
use packagegeneric01.all;

entity topgeneric01 is
  port(
       clk0: in std_logic;
	   enable0: in std_logic;
	   cdiv0: in std_logic_vector(3 downto 0);
	   codop0: in std_logic_vector(4 downto 0);
	   portA0: in std_logic_vector(7 downto 0);
	   portB0: in std_logic_vector(7 downto 0);
	   carryOut : out std_logic;
	    carryOut1 : out std_logic;
	   outdiv00: inout std_logic;
	   sFlag0: inout std_logic;
	   outFlag0: inout std_logic;
	   AC0: out std_logic_vector(7 downto 0));
end topgeneric01;

architecture topgeneric0 of topgeneric01 is
signal sout: std_logic_vector(7 downto 0);
signal carr1, carr2: std_logic;
begin

  G00: topdiv00 port map(indiv0 => cdiv0,
                         outdiv0 => outdiv00);
  
  G01: and00 port map(clka => clk0,
                      codopa => codop0,
					  portAa => portA0,
					  portBa => portB0,
					  inFlaga => outFlag0,
					  outa => sout,
                      outFlaga => sFlag0);
  
  G02: xor00 port map(clkx => clk0, 
                      codopx => codop0,
					  portAx=> portA0,
					  portBx => portB0,
					  inFlagx => outFlag0,
					  outx => sout,
                      outFlagx => sFlag0);
					  
  G03: not00 port map(
	clkn => clk0, 
	codopn => codop0,
	portAn=> portA0,
	inFlagn => outFlag0,
	outn => sout,
	outFlagn => sFlag0
  );
  
  G04: or00 port map(
	clko => clk0,
	codopo => codop0,
	portAo=> portA0,
	portBo => portB0,
	inFlago => outFlag0,
	outo => sout,
	outFlago => sFlag0
  );
  
  G05: nand00 port map(
	clkna => clk0,
	codopna => codop0,
	portAna => portA0,
	portBna => portB0,
	inFlagna => outFlag0,
	outna => sout,
	outFlagna => sFlag0
  );
  
  G06: nor00 port map(
	clkno => clk0,
	codopno => codop0,
	portAno=> portA0,
	portBno => portB0,
	inFlagno => outFlag0,
	outno => sout,
	outFlagno => sFlag0
  );
  
  G07: nxor00 port map(
	clknx => clk0, 
	codopnx => codop0,
	portAnx=> portA0,
	portBnx => portB0,
	inFlagnx => outFlag0,
	outnx => sout,
	outFlagnx => sFlag0
  );
  
  G08: add00 port map(
	clkadd => clk0, 
	codopadd => codop0,
	portAadd=> portA0,
	portBadd => portB0,
	inFlagadd => outFlag0,
	outadd => sout,
	outCarryadd => carr1,
	outFlagadd => sFlag0
  );
  
  G09: sub00 port map(
	clksub => clk0, 
	codopsub => codop0,
	portAsub=> portA0,
	portBsub => portB0,
	inFlagsub => outFlag0,
	outsub => sout,
	outCarrysub => carr2,
	outFlagsub => sFlag0
  );
  
  G10: shiftr00 port map(
	clksr => clk0, 
	codopsr => codop0,
	portAsr=> portA0,
	inFlagsr => outFlag0,
	outsr => sout,
	outFlagsr => sFlag0
  );
  
  G11: shiftl00 port map(
	clksl => clk0, 
	codopsl => codop0,
	portAsl=> portA0,
	inFlagsl => outFlag0,
	outsl => sout,
	outFlagsl => sFlag0
  );
  
  G12: rotr00 port map(
	clkrr => clk0, 
	codoprr => codop0,
	portArr=> portA0,
	inFlagrr => outFlag0,
	outrr => sout,
	outFlagrr => sFlag0
  );
  
  G13: rotl00 port map(
	clkrl => clk0, 
	codoprl => codop0,
	portArl=> portA0,
	inFlagrl => outFlag0,
	outrl => sout,
	outFlagrl => sFlag0
  );
  
  G14: comp2 port map(
	clkc2 => clk0, 
	codopc2 => codop0,
	portAc2=> portA0,
	inFlagc2 => outFlag0,
	outc2 => sout,
	outFlagc2 => sFlag0
  );
  
  G15: comp00 port map(
	clkc0 => clk0, 
	codopc0 => codop0,
	portAc0=> portA0,
	portBc0 => portB0,
	inFlagc0 => outFlag0,
	outc0 => sout,
	outFlagc0 => sFlag0
  ); 
  
  G16: concat00 port map(
	clkct => clk0, 
	codopct => codop0,
	portAct=> portA0,
	portBct => portB0,
	inFlagct => outFlag0,
	outct => sout,
	outFlagct => sFlag0
  ); 
  
  G19: uc00 port map(clkuc => clk0,
                     enable => enable0,
                     inuc => sout,
					 inuc2 => carr1,
					 inuc3 => carr2,
					 inFlaguc => sFlag0,
					 outuc=> AC0,
					 outuc2 => carryOut,
					 outuc3 => carryOut1,
                     outFlaguc => outFlag0);

end topgeneric0;