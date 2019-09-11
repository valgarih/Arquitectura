library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;

entity nxor00 is
  port(
       clknx: in std_logic;
	   codopnx: in std_logic_vector(4 downto 0);
	   portAnx: in std_logic_vector(7 downto 0);
	   portBnx: in std_logic_vector(7 downto 0);
	   inFlagnx: in std_logic;
	    
	   outnx: out std_logic_vector(7 downto 0);
       outFlagnx: out std_logic);
end nxor00;

architecture nxor0 of nxor00 is
begin
   pnxor: process(clknx, codopnx, inFlagnx)
   variable aux: bit:='0';
     begin
	     if (clknx'event and clknx = '1') then
		     if (codopnx = "00110") then
			     if (inFlagnx = '1') then
				    if (aux = '0') then
					   aux:= '1';
				       outnx <= not(portAnx xor portBnx);
				       outFlagnx <= '1';
					 else
				       outFlagnx <= '1';
				    end if;
				 else
				   outFlagnx <= '0';
				 end if;
			 else
			   outnx <= (others => 'Z');
			   outFlagnx <= 'Z';
			   aux:='0';
			 end if;
		 end if;
     end process pnxor;
end nxor0;