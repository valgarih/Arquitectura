library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

package packageram00 is

  component toposc00
    port(
		 clk0: inout std_logic;
		 cdiv0: in std_logic_vector (4 downto 0));
  end component;
  
  component contring00
    port(
       clkcr: in std_logic;
	   enablecr: in std_logic;
	   rwcr: in std_logic;
       outcr: out std_logic_vector(3 downto 0));
  end component;
  
  component coder00
    port(
       clkcd: in std_logic;
	   enablecd: in std_logic;
	   rwcd: in std_logic;
	   inkeycd: in std_logic_vector(3 downto 0);
	   incontcd: in std_logic_vector(3 downto 0);
       outcodercd: out std_logic_vector(7 downto 0);
	   outcontwcd: inout std_logic_vector(4 downto 0);
	   outFlagcd: out std_logic);
  end component;
  
  component ram00
    port(
       clkra: in std_logic;
	   enablera: in std_logic;
	   rwra: in std_logic;
	   inFlagra: in std_logic;
	   inFlagdd: in std_logic;
	   indirWra: in std_logic_vector(4 downto 0);
	   indirRra: in std_logic_vector(4 downto 0);
	   inwordra: in std_logic_vector(7 downto 0);
       outwordra: out std_logic_vector(7 downto 0));
  end component;
  
  component muxra00
    port(
       clklm: in std_logic;
	   resetlm: in std_logic;
	   inFlagclm: in std_logic;--Lógica fuerte
	   inFlagdlm: in std_logic;--viene de la rom
	   inwordclm: in std_logic_vector(7 downto 0);
	   inworddlm: in std_logic_vector(7 downto 0);
	   RWc: in std_logic;
	   RSc: in std_logic;
	   ENc: in std_logic;
	   RWd: in std_logic;
	   RSd: in std_logic;
	   ENdd: in std_logic;
	   outwordlm: out std_logic_vector(7 downto 0);
	   RWlm: out std_logic;
	   RSlm: out std_logic;
       ENlm: out std_logic);
  end component;
  
  component contReadRa00
    port(
       clkrd: in std_logic;
	   enablerd: in std_logic;
	   rwrd: in std_logic;
	   incontWrd: in std_logic_vector(4 downto 0);
       outcontRrd: inout std_logic_vector(4 downto 0);
	   RWcd: out std_logic;
	   RScd: out std_logic;
	   ENcd: out std_logic;
       outFlagcd: out std_logic);
  end component;
  
  component lcdconfig00
    port(
       clkc: in std_logic;
	   resetc: in std_logic;
	   inFlagc: in std_logic;
	   incontc: in std_logic_vector(4 downto 0);
	   comandoc: out std_logic_vector(7 downto 0);
	   outFlagc: out std_logic;
	   RWc: out std_logic;
	   RSc: out std_logic;
       ENc: out std_logic);
  end component;
  
  component lcdcontconfig00
    port(
       clkcc:in std_logic;
	   resetcc: in std_logic;
	   inFlagcc: in std_logic;--fuerte
	   outcontcc: inout std_logic_vector(4 downto 0);
       outFlagcc: out std_logic);
  end component;

end packageram00;