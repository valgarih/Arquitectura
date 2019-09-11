library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;
library machxo2;
use machxo2.all;
use packagegeneric01.all;

entity topgeneric01 is
  port(
       clk0: inout std_logic;
	   cdiv0: in std_logic_vector(3 downto 0);
	   enable0: in std_logic;
	   SL0: in std_logic;
	   portA0: in std_logic_vector(7 downto 0);
	   portB0: in std_logic_vector(7 downto 0);
	   codop0: in std_logic_vector(4 downto 0);
	   corr0: in std_logic_vector(2 downto 0);
	   inFlag0: inout std_logic;
	   outFlag0: inout std_logic;
	   ac0: out std_logic_vector(15 downto 0);
       LEDas0: out std_logic);
end topgeneric01;

architecture topgeneric0 of topgeneric01 is
signal sPAad, sPAsb, sPBad, sPBsb: std_logic_vector(7 downto 0);
signal soutsad, soutssb: std_logic_vector(7 downto 0);
signal smult, sout: std_logic_vector(15 downto 0);
signal sLEDad, sLEDsb, sSLad, sSLsb: std_logic;
begin

  G00: topdiv00 port map(outdiv0 => clk0,
                         indiv0 => cdiv0);
  
  G01: andg01 port map(clka => clk0,
                        inFlaga => outFlag0,
						codopa => codop0,
						portAa => portA0,
						portBa => portB0,
						outFlaga => inFlag0,
                        outa => sout(7 downto 0));--va hacia la unidad de contrrol
						
  G02: org01 port map(clko => clk0,
                        inFlago => outFlag0,
						codopo => codop0,
						portAo => portA0,
						portBo => portB0,
						outFlago => inFlag0,
                        outo => sout(7 downto 0));--va hacia la unidad de contrrol					

  G03: xorg01 port map(clkx => clk0,
                        inFlagx => outFlag0,
						codopx => codop0,
						portAx => portA0,
						portBx => portB0,
						outFlagx => inFlag0,
                        outx => sout(7 downto 0));--va hacia la unidad de control
  
    G04: notg01 port map(clkn => clk0,
                        inFlagn => outFlag0,
						codopn => codop0,
						portAn => portA0,
						outFlagn => inFlag0,
                        outn => sout(7 downto 0));--va hacia la unidad de control
						
	G05: nandg01 port map(clkna => clk0,
                        inFlagna => outFlag0,
						codopna => codop0,
						portAna => portA0,
						portBna => portB0,
						outFlagna => inFlag0,
                        outna => sout(7 downto 0));--va hacia la unidad de control		

	G06: norg01 port map(clkno => clk0,
                        inFlagno => outFlag0,
						codopno => codop0,
						portAno => portA0,
						portBno => portB0,
						outFlagno => inFlag0,
                        outno => sout(7 downto 0));--va hacia la unidad de control	
						
	G07: xnorg01 port map(clkxn => clk0,
                        inFlagxn => outFlag0,
						codopxn => codop0,
						portAxn => portA0,
						portBxn => portB0,
						outFlagxn => inFlag0,
                        outxn => sout(7 downto 0));--va hacia la unidad de control	
  
  G08: topadder00 port map(SL => SL0,--sSLad,
                               Ai => portA0,--sPAad,
							   Bi => portB0,--sPBad,
							   So => soutsad,
                               LED => sLEDad);
  
  G09: addg01 port map(clkad => clk0,
                       SLad => SL0,
                       codopad => codop0,
					   inFlagad => outFlag0,
					   outsad => soutsad,--llega desde el circuito sumador
					   LEDsad => sLEDad,-- llega desde el sumador
					   outad => sout(7 downto 0),--va hacia la unidad de control
					   LEDad => LEDas0,
					   outFlagad => inFlag0);
  
  G10: subg01 port map(clksb => clk0,
                       SLsb => SL0,
                       codopsb => codop0,
					   inFlagsb => outFlag0,
					   outssb => soutsad,--llega desde el circuito sumador
					   LEDssb => sLEDad,-- llega desde el sumador
					   outsb => sout(7 downto 0),--va hacia la unidad de control
					   LEDsb => LEDas0,
					   outFlagsb => inFlag0);

  G11: topmult4bit00 port map(Am => portA0,--sPAad,
							   Bm => portB0,--sPBad,
							   Rm => smult);
  
  G12: multg01 port map(clkmult => clk0,
                       inFlagmult => outFlag0,
					   codopmult => codop0,
					   inmult => smult,--llega desde el circuito sumador
					   outmult => sout,--va hacia la unidad de control
					   outFlagmult => inFlag0);
					 
  G13: ShiftL00 port map(clksl => clk0,
						codopsl => codop0,
						corrsl => corr0,
						portAsl => portA0,
						inFlagsl => outFlag0,
						outsl => sout(7 downto 0),
						outFlagsl => inFlag0);
  
  G14: ShiftR00 port map(clksr => clk0,
						codopsr => codop0,
						corrsr => corr0,
						portAsr => portA0,
						inFlagsr => outFlag0,
						outsr => sout(7 downto 0),
						outFlagsr => inFlag0);
						
  G15: rotL00 port map(clkrl => clk0,
						codoprl => codop0,
						corrrl => corr0,
						portArl => portA0,
						inFlagrl => outFlag0,
						outrl => sout(7 downto 0),
						outFlagrl => inFlag0);
						
  G16: rotR00 port map(clkrr => clk0,
						codoprr => codop0,
						corrrr => corr0,
						portArr => portA0,
						inFlagrr => outFlag0,
						outrr => sout(7 downto 0),
						outFlagrr => inFlag0);
  
  G17: ucg01 port map(clkuc => clk0,
                       inFlaguc => inFlag0,
					   enableuc => enable0,
					   inuc => sout,
					   outuc => ac0,
                       outFlaguc => outFlag0);

end topgeneric0;