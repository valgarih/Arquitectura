library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
use packageram00.all;

entity topram00 is
  port(
       clk0: inout std_logic;
	   cdiv0: in std_logic_vector(4 downto 0);
	   enable0: in std_logic;
	   rw0: in std_logic;
	   reset0: in std_logic;
	   inkey0: in std_logic_vector(3 downto 0);
	   outcrLed0: inout std_logic_vector(3 downto 0);
	   outcrK0: inout std_logic_vector(3 downto 0);
	   outcontW0: inout std_logic_vector(4 downto 0);
	   outcontR0: inout std_logic_vector(4 downto 0);
	   outWord0: out std_logic_vector(7 downto 0);
	   outcontcc0: inout std_logic_vector(4 downto 0);
	   outFlagc0: inout std_logic;
	   outFlagcc0: inout std_logic;
	   outFlagcd0: inout std_logic;
	   outFlagdd0: inout std_logic;
       outFlag0: inout std_logic;
	   RW1: out std_logic;
	   RS0: out std_logic;
       EN0: out std_logic);
end topram00;

architecture topram0 of topram00 is
signal soutcr: std_logic_vector(3 downto 0);
signal soutcodercd: std_logic_vector(7 downto 0);
signal soutwordra: std_logic_vector(7 downto 0);
signal scomandoc: std_logic_vector(7 downto 0);
signal sword: std_logic_vector(7 downto 0);
signal sRWc, sRSc, sENc, sRWcd, sRScd, sENcd: std_logic;
begin
outcrLed0 <= soutcr;
outcrK0 <= soutcr;
outWord0 <= sword;

  RA00: toposc00 port map(clk0 => clk0,
                          cdiv0 => cdiv0);
  
  RA01: contring00 port map(clkcr => clk0,
                            enablecr => enable0,
							rwcr => rw0,
                            outcr => soutcr);
  
  RA02: coder00 port map(clkcd => clk0,
                         enablecd => enable0,
						 rwcd => rw0,
						 inkeycd => inkey0,
						 incontcd => soutcr,
						 outcontwcd => outcontW0,
						 outcodercd => soutcodercd,
                         outFlagcd => outFlag0);
  
  RA03: ram00 port map(clkra => clk0,
                       enablera => enable0,
					   rwra => rw0,
					   indirWra => outcontW0,
					   indirRra => outcontR0,
					   inwordra => soutcodercd,
					   outwordra => soutwordra,
                       inFlagra => outFlag0,
					   inFlagdd => outFlagdd0);
  
  RA04: muxra00 port map(clklm => clk0,
                         resetlm => reset0,
						 inFlagclm => outFlagc0,
						 inFlagdlm => outFlagdd0,
						 inwordclm => scomandoc,
						 inworddlm => soutwordra,
						 RWc => sRWc,
						 RSc => sRSc,
						 ENc => sENc,
						 RWd => sRWcd,
						 RSd => sRScd,
						 ENdd => sENcd,
						 outwordlm => sword,
						 RWlm => RW1,
						 RSlm => RS0,
                         ENlm => EN0);
  
  RA05: contReadRa00 port map(clkrd => clk0,
                              enablerd => enable0,
							  rwrd => rw0,
							  incontWrd => outcontW0,
                              outcontRrd => outcontR0,
							  RWcd => sRWcd,
							  RScd => sRScd,
							  ENcd => sENcd,
                              outFlagcd => outFlagcd0);
							  
  RA06: lcdconfig00 port map(clkc => clk0,
							 resetc => reset0,
							 inFlagc => outFlagcc0,
							 incontc => outcontcc0,
							 comandoc => scomandoc,
							 outFlagc => outFlagc0,
							 RWc => sRWc,
							 RSc => sRSc,
                             ENc => sENc);
						
  RA07: lcdcontconfig00 port map(clkcc => clk0,
								 resetcc => reset0,
								 inFlagcc => outFlagc0,
								 outcontcc => outcontcc0,
								 outFlagcc => outFlagcc0);

end topram0;