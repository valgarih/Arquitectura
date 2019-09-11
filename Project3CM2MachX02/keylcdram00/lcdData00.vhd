library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity lcdData00 is
	port
	(
		clkw: in std_logic;
		enablew: in std_logic;
		rwdata: in std_logic;
		inFlagw: in std_logic;
		inWordw: in std_logic_vector(7 downto 0);
		outWordw: out std_logic_vector(10 downto 0)
	);
end lcdData00;

architecture lcdData0 of lcdData00 is
signal scontrol: std_logic_vector(1 downto 0);
begin
  scontrol <= (inFlagw) & (rwdata);	
  pdata: process(clkw)
  variable aux: bit:='0';
  variable aux1: bit:='0';
  variable aux2: bit:='0';
  variable aux3: bit:='1';
  variable wordsCounter: integer:= 0;
  begin
    if (clkw'event and clkw = '1') then
	  case enablew is
	    when '0' =>
		  outWordw <= (others => '1');
		when '1' =>
		  case scontrol is
		    when "00" => -- Sigue configurando
			  outWordw <= (others => '1');
			when "10" => -- Acabó de configurar, entonces a escribir
				if(inWordw /= "00000000") then --Si no se está presionando ninguna tecla no hay porque hacer algo
					if(wordsCounter < 16) then -- Mientras no se hayan escrito 16 chars en este renglón
						if(wordsCounter = 0 and aux3 = '1') then --Si el número de palabras escritas es cero se limpia la pantalla
							if(aux = '0') then --Push command
								aux := '1';
								outWordw <= "00000001100"; -- Screen Clear
							else --Release command
								aux := '0';
								aux3 := '0';
								outWordw <= "00000001000"; --Screen Clear
							end if;
						else
							if(inWordw = "00000001") then -- Se esta presionando el botón de CLEAR
								if(aux = '0') then --Push command
									aux := '1';
									outWordw <= inWordw & ('1') & ('0') & ('0');
								elsif(aux = '1') then --Release command
									aux := '0';
									outWordw <= inWordw & ('0') & ('0') & ('0');
									wordsCounter := 0;
								end if;         
							elsif(inWordw = "10101001") then --Se presiona ENTER
								if(aux1 = '0') then --Push
									aux1 := '1';
									outWordw <= "10101001" & ('1') & ('0') & ('0'); --Saltamos a la posición 41 de la DDRAM (Renglón 2)
								else --Release
									aux1 := '0';
									aux2 := '1';
									wordsCounter := 0;
									outWordw <= "10101001" & ('0') & ('0') & ('0');  --Saltamos a la posición 41 de la DDRAM (Renglón 2)
								end if;
							else -- Se esta presionando cualquier otra tecla
								if(aux = '0') then --Push data
									aux := '1';
									outWordw <= inWordw & ('1') & ('0') & ('1');
								elsif(aux = '1') then --Release data
									aux := '0';
									outWordw <= inWordw & ('0') & ('0') & ('1');	
									wordsCounter := wordsCounter + 1;
								end if;              		
							end if;
						end if;
					else -- Si llegamos a los 16 chars escritos entonces hacemos un salto de renglón
						if(aux2 = '1') then
							if(aux1 = '0') then
								aux1 := '1';
								outWordw <= "10000000" & ('1') & ('0') & ('0'); --Saltamos a la posición 0 de la DDRAM (Comienzo del renglón 1)
							else
								aux1 := '0';
								aux2 := '0';
								aux3 := '1'; --Para activar el clear
								wordsCounter := 0;
								outWordw <= "10000000" & ('0') & ('0') & ('0');  --Saltamos a la posición 0 de la DDRAM (Renglón 1)	
							end if;
						else
							if(aux1 = '0') then --Push
								aux1 := '1';
								outWordw <= "10101001" & ('1') & ('0') & ('0'); --Saltamos a la posición 41 de la DDRAM (Renglón 2)
							else --Release
								aux1 := '0';
								aux2 := '1';
								wordsCounter := 0;
								outWordw <= "10101001" & ('0') & ('0') & ('0');  --Saltamos a la posición 41 de la DDRAM (Renglón 2)
							end if;
						end if;
					end if;
				end if;
			when others => null;
		  end case;
		when others => null;
	  end case;
	end if;
  end process pdata;
end lcdData0;