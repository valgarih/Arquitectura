library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;
use packageosc00.all;
 
entity toposc00 is  
	port (
			lectura: in std_logic;
			indiv0: in std_logic_vector(3 downto 0);
			reset: in std_logic;
			VCC: out std_logic;
			salidaPantalla: inout std_logic_vector (7 downto 0);
			salidaPantallaMirror: out std_logic_vector (7 downto 0);
			RW: out std_logic;
			RS: out std_logic;
			EN: out std_logic;
			salidaAux: out std_logic;
			anillo: out std_logic_vector (3 downto 0);
			entradaTeclado: in std_logic_vector(3 downto 0);
			salidaContadorCondiguracion:out std_logic_vector(4 downto 0);
			salidaContadorDatos: out std_logic_vector(5 downto 0);
			outosc0: inout std_logic);
end toposc00;

architecture toposc0 of toposc00 is

constant CERO:  STD_LOGIC_VECTOR(7 downto 0) :="00110000";
constant UNO:  STD_LOGIC_VECTOR(7 downto 0) :="00110001";
constant DOS:  STD_LOGIC_VECTOR(7 downto 0) :="00110010";
constant TRES:  STD_LOGIC_VECTOR(7 downto 0) :="00110011";
constant CUATRO:  STD_LOGIC_VECTOR(7 downto 0) :="00110100";
constant CINCO:  STD_LOGIC_VECTOR(7 downto 0) :="00110101";
constant SEIS:  STD_LOGIC_VECTOR(7 downto 0) :="00110110";
constant SIETE:  STD_LOGIC_VECTOR(7 downto 0) :="00110111";
constant OCHO:  STD_LOGIC_VECTOR(7 downto 0) :="00111000";
constant NUEVE:  STD_LOGIC_VECTOR(7 downto 0) :="00111001";

constant ARROBA:  STD_LOGIC_VECTOR(7 downto 0) :="01000000";
constant AM:  STD_LOGIC_VECTOR(7 downto 0) :="01000001";
constant BM:  STD_LOGIC_VECTOR(7 downto 0) :="01000010";
constant CM:  STD_LOGIC_VECTOR(7 downto 0) :="01000011";
constant DM:  STD_LOGIC_VECTOR(7 downto 0) :="01000100";
constant EM:  STD_LOGIC_VECTOR(7 downto 0) :="01000101";
constant FM:  STD_LOGIC_VECTOR(7 downto 0) :="01000110";
constant GM:  STD_LOGIC_VECTOR(7 downto 0) :="01000111";
constant HM:  STD_LOGIC_VECTOR(7 downto 0) :="01001000";
constant IM:  STD_LOGIC_VECTOR(7 downto 0) :="01001001";
constant JM:  STD_LOGIC_VECTOR(7 downto 0) :="01001010";
constant KM:  STD_LOGIC_VECTOR(7 downto 0) :="01001011";
constant LM:  STD_LOGIC_VECTOR(7 downto 0) :="01001100";
constant MM:  STD_LOGIC_VECTOR(7 downto 0) :="01001101";
constant NM:  STD_LOGIC_VECTOR(7 downto 0) :="01001110";
constant OM:  STD_LOGIC_VECTOR(7 downto 0) :="01001111";

constant PM:  STD_LOGIC_VECTOR(7 downto 0) :="01010000";
constant QM:  STD_LOGIC_VECTOR(7 downto 0) :="01010001";
constant RM:  STD_LOGIC_VECTOR(7 downto 0) :="01010010";
constant SM:  STD_LOGIC_VECTOR(7 downto 0) :="01010011";
constant TM:  STD_LOGIC_VECTOR(7 downto 0) :="01010100";
constant UM:  STD_LOGIC_VECTOR(7 downto 0) :="01010101";
constant VM:  STD_LOGIC_VECTOR(7 downto 0) :="01010110";
constant WM:  STD_LOGIC_VECTOR(7 downto 0) :="01010111";
constant XM:  STD_LOGIC_VECTOR(7 downto 0) :="01011000";
constant YM:  STD_LOGIC_VECTOR(7 downto 0) :="01011001";
constant ZM:  STD_LOGIC_VECTOR(7 downto 0) :="01011010";


constant a:  STD_LOGIC_VECTOR(7 downto 0) :="01100001";
constant b:  STD_LOGIC_VECTOR(7 downto 0) :="01100010";
constant c:  STD_LOGIC_VECTOR(7 downto 0) :="01100011";
constant d:  STD_LOGIC_VECTOR(7 downto 0) :="01100100";
constant e:  STD_LOGIC_VECTOR(7 downto 0) :="01100101";
constant f:  STD_LOGIC_VECTOR(7 downto 0) :="01100110";
constant g:  STD_LOGIC_VECTOR(7 downto 0) :="01100111";
constant h:  STD_LOGIC_VECTOR(7 downto 0) :="01101000";
constant i:  STD_LOGIC_VECTOR(7 downto 0) :="01101001";
constant j:  STD_LOGIC_VECTOR(7 downto 0) :="01101010";
constant k:  STD_LOGIC_VECTOR(7 downto 0) :="01101011";
constant l:  STD_LOGIC_VECTOR(7 downto 0) :="01101100";
constant m:  STD_LOGIC_VECTOR(7 downto 0) :="01101101";
constant n:  STD_LOGIC_VECTOR(7 downto 0) :="01101110";
constant o:  STD_LOGIC_VECTOR(7 downto 0) :="01101111";

constant p:  STD_LOGIC_VECTOR(7 downto 0) :="01110000";
constant q:  STD_LOGIC_VECTOR(7 downto 0) :="01110001";
constant r:  STD_LOGIC_VECTOR(7 downto 0) :="01110010";
constant s:  STD_LOGIC_VECTOR(7 downto 0) :="01110011";
constant t:  STD_LOGIC_VECTOR(7 downto 0) :="01110100";
constant u:  STD_LOGIC_VECTOR(7 downto 0) :="01110101";
constant v:  STD_LOGIC_VECTOR(7 downto 0) :="01110110";
constant w:  STD_LOGIC_VECTOR(7 downto 0) :="01110111";
constant x:  STD_LOGIC_VECTOR(7 downto 0) :="01111000";
constant y:  STD_LOGIC_VECTOR(7 downto 0) :="01111001";
constant z:  STD_LOGIC_VECTOR(7 downto 0) :="01111010";
constant espacio:  STD_LOGIC_VECTOR(7 downto 0) :="00100000";
constant adm: STD_LOGIC_VECTOR(7 downto 0):="00100001";
constant menorq: STD_LOGIC_VECTOR(7 downto 0):="00111110";
constant salto: STD_LOGIC_VECTOR(7 downto 0):="11111111";
constant salto2: STD_LOGIC_VECTOR(7 downto 0):="11111110";

type arrayRom is array(0 to 31) of std_logic_vector(7 downto 0);
signal dataWord: arrayRom:=(others => espacio);
--signal Aux: std_logic;
signal señalAnillo: std_logic_vector(3 downto 0);
signal bufferPalabra: std_logic_vector(7 downto 0);
signal sclkdiv: std_logic;
signal seLeenDatos: std_logic;
signal seLeenDatosRam: std_logic;
signal datosEsVacio: std_logic;
signal datosEsVacioRam: std_logic;
signal contadorData: std_logic_vector(5 downto 0);
signal contadorConfiguracion: std_logic_vector(4 downto 0);
signal contadorConfiguracionRam: std_logic_vector(4 downto 0);
signal contadorRam: std_logic_vector(5 downto 0);
signal desactivaContadorConfiguracion: std_logic;
signal RWc, RSc,Enc,RWcd, RScd,Encd,ENR,RWR,RSR,ENRc,RWRc,RSRc: std_logic;
signal desactivaContadorData: std_logic;
signal desactivaContadorRam: std_logic;
signal salidaAPantallaConfiguracion: std_logic_vector(7 downto 0);
signal salidaAPantallaConfiguracionRam: std_logic_vector(7 downto 0);
signal salidaAPantallaDatos: std_logic_vector(7 downto 0);
signal salidaAPantallaRam: std_logic_vector(7 downto 0);
signal desactivaContadorConfiguracionRam:std_logic;
signal ultimovalorContador:std_logic_vector(5 downto 0);

	begin
	salidaAux<='1';
	salidaPantallaMirror<=salidaPantalla;
	salidaContadorDatos<=contadorData;
	salidaContadorCondiguracion<=contadorConfiguracion;
	VCC<='1';
		O00: osc00 port map(osc_int => sclkdiv);
	
		O01: div00 port map(clkdiv => sclkdiv,
						  indiv => indiv0,
						  outosc => outosc0);
-------------------CONTADOR DE CONFIGURACION	(AQUI SE ACTIVA EL CONTADOR DE DATOS)				  
	process (outosc0,reset)
	begin
		if(outosc0'event and outosc0='1') then
			case reset is 
				when '0'=>
					desactivaContadorData<='0';
					contadorConfiguracion<="00000";
				when '1'=>
					if(desactivaContadorConfiguracion ='0') then
						contadorConfiguracion<=contadorConfiguracion+1;
						desactivaContadorData<='1';
					else 
						contadorConfiguracion<=contadorConfiguracion;
						desactivaContadorData<='0';
					end if;
				when others => null;		
			end case;
		end if;
	end process;

----------------CONFIGURACION DEL TECLADO (AQUI SE DESACTIVA EL CONTADOR DE CONFIGURACION)

	process(outosc0,reset,desactivaContadorData,contadorConfiguracion)
	begin
		if(outosc0'event and outosc0='1') then
			case reset is
				when '0'=>
					salidaAPantallaConfiguracion<="00000001";
					desactivaContadorConfiguracion<='0';
					RWc <= '0';
					RSc <= '0';
					ENc <= '0';
				when '1'=>
					case desactivaContadorData is
						when '1'=>
							case contadorConfiguracion is
								when "00011" =>
									desactivaContadorConfiguracion<='0';
									salidaAPantallaConfiguracion<="00000001";
									RWc <= '0';
									RSc <= '0';
									ENc <= '1';
								when "00100" =>
									desactivaContadorConfiguracion<='0';
									salidaAPantallaConfiguracion<="00000001";
									RWc <= '0';
									RSc <= '0';
									ENc <= '0';
								when "00101" =>
									desactivaContadorConfiguracion<='0';
									salidaAPantallaConfiguracion<="00000011";
									RWc <= '0';
									RSc <= '0';
									ENc <= '1';
								when "00110" =>
									desactivaContadorConfiguracion<='0';
									salidaAPantallaConfiguracion<="00000011";
									RWc <= '0';
									RSc <= '0';
									ENc <= '0';
								when "00111" =>
									desactivaContadorConfiguracion<='0';
									salidaAPantallaConfiguracion<="00000110";
									RWc <= '0';
									RSc <= '0';
									ENc <= '1';
								when "01000" =>
									desactivaContadorConfiguracion<='0';
									salidaAPantallaConfiguracion<="00000110";
									RWc <= '0';
									RSc <= '0';
									ENc <= '0';
								when "01001" =>
									desactivaContadorConfiguracion<='0';
									salidaAPantallaConfiguracion<="00001111";
									RWc <= '0';
									RSc <= '0';
									ENc <= '1';
								when "01010" =>
									desactivaContadorConfiguracion<='0';
									salidaAPantallaConfiguracion<="00001111";
									RWc <= '0';
									RSc <= '0';
									ENc <= '0';
								when "01011" =>
									desactivaContadorConfiguracion<='0';
									salidaAPantallaConfiguracion<="00011100";
									RWc <= '0';
									RSc <= '0';
									ENc <= '1';
								when "01100" =>
									desactivaContadorConfiguracion<='0';
									salidaAPantallaConfiguracion<="00011100";
									RWc <= '0';
									RSc <= '0';
									ENc <= '0';
								when "01101" =>
									desactivaContadorConfiguracion<='0';
									salidaAPantallaConfiguracion<="00111100";
									RWc <= '0';
									RSc <= '0';
									ENc <= '1';
								when "01110" =>
									desactivaContadorConfiguracion<='0';
									salidaAPantallaConfiguracion<="00111100";
									RWc <= '0';
									RSc <= '0';
									ENc <= '0';
								when "01111" =>
									desactivaContadorConfiguracion<='0';
									salidaAPantallaConfiguracion<="10000000";
									RWc <= '0';
									RSc <= '0';
									ENc <= '1';
								when "10000" =>
									desactivaContadorConfiguracion<='1';
									salidaAPantallaConfiguracion<="10000000";
									RWc <= '0';
									RSc <= '0';
									ENc <= '1';
								when others=> null;
							end case;
							when others=>null;
					end case;
					when others=>null;
			end case;
		end if;
	end process;
----------------- ANILLO DE TECLADO MATRICIAL

	process(outosc0)
	begin
		if(outosc0'event and outosc0='1') then
			case reset is
				when '0'=>
					señalAnillo<="1000";
					Anillo<="0000";
				when '1'=>
					señalAnillo(3)<=señalAnillo(0);
					señalAnillo(2 downto 0)<=señalAnillo(3 downto 1);
					Anillo<=señalAnillo;
				when others => null;	
			end case;
		end if;
	end process;

------------------ CONTADOR DE DATOS

	process (outosc0,reset,desactivaContadorConfiguracion,seLeenDatos)
	begin
		if(outosc0'event and outosc0='1') then
			case reset is
				when '0'=>
					contadorData<="000000";
					datosEsVacio<='0';
				when '1'=>
					case desactivaContadorConfiguracion is
						when '0'=>
							datosEsVacio<='0';
						when '1'=>
							if(seLeenDatos='1')then
								if(contadorData<"111111")then
									contadorData<=contadorData+1;
									ultimovalorContador<=contadorData;
									datosEsVacio<='0';
								end if;
							else
								contadorData<=contadorData;
					--			datosEsVacio<='1';
							end if;
						when others => null;	
					end case;
				when others => null;	
			end case;
		end if;
	end process;

------------------------DATOS

	process (outosc0,reset,desactivaContadorConfiguracion,datosEsVacio)
	variable aux: std_logic_vector(7 downto 0);
	
	begin
		if(outosc0'event and outosc0='1') then
			case reset is
				when '0'=>
					salidaAPantallaDatos<=espacio;
					seLeenDatos<='1';
					bufferPalabra<=espacio;
					aux:="11111111";
				when '1'=>
					case desactivaContadorConfiguracion is
						when '0'=>
							salidaAPantallaDatos<=espacio;
							seLeenDatos<='0';
							aux:="11111111";
						when '1'=>
							if(contadorData<"111111") then
								if(datosEsVacio='0') then
									if(contadorData="001111")then
											salidaAPantallaDatos<="10101011";
											seLeenDatos<='1';
											RWcd <= '0';
											RScd <= '0';
											ENcd <= '1';
									elsif(contadorData="010000")then
											salidaAPantallaDatos<="10101011";
											seLeenDatos<='1';
											RWcd <= '0';
											RScd <= '0';
											ENcd <= '1';
									else
										--if(lectura='0') then
											case señalAnillo & entradaTeclado is
												when "0001" & "0000"=>
													seLeenDatos<='0'; 
													salidaAPantallaDatos<=bufferPalabra;
													--aux:="11111111";
													RWcd <= '0';
													RScd <= '1';
													ENcd <= '0';
												when "0010" & "0000"=>
													seLeenDatos<='0';
													salidaAPantallaDatos<=espacio;
													--aux:="11111111";
													RWcd <= '0';
													RScd <= '1';
													ENcd <= '0';
												when "0100" & "0000"=>
													seLeenDatos<='0';
													salidaAPantallaDatos<=espacio;
													--aux:="11111111";
													RWcd <= '0';
													RScd <= '1';
													ENcd <= '0';
												when "1000" & "0000"=>
													seLeenDatos<='0';
													salidaAPantallaDatos<=espacio;
												    --aux:="11111111";
													RWcd <= '0';
													RScd <= '1';
													ENcd <= '0';
												when "0001" & "0001"=>
													if(aux/=SIETE) then
														seLeenDatos<='1';
														salidaAPantallaDatos<=SIETE;
														dataWord(conv_integer(contadorData))<=espacio;
														dataWord(conv_integer(contadorData))<=SIETE;
														RWcd <= '0';
														RScd <= '1';
														ENcd <= '1';
														aux:=SIETE;--aqui
													end if;
												when "0001" & "0010"=>
													if(aux/=OCHO) then
														seLeenDatos<='1';
														salidaAPantallaDatos<=OCHO;--UNO
														dataWord(conv_integer(contadorData))<=ESPACIO;
														dataWord(conv_integer(contadorData))<=OCHO;
														RWcd <= '0';
														RScd <= '1';
														ENcd <= '1';
														aux:=OCHO;
													end if;
												when "0001" & "0100"=>
													if(aux /= NUEVE) then
														seLeenDatos<='1';
														salidaAPantallaDatos<=NUEVE;--DOS
														dataWord(conv_integer(contadorData))<=ESPACIO;
														dataWord(conv_integer(contadorData))<=NUEVE;
														RWcd <= '0';
														RScd <= '1';
														ENcd <= '1';
														aux:=NUEVE;
													end if;
												when "0001" & "1000"=>
													if(aux/=CM) then
														seLeenDatos<='1';
														salidaAPantallaDatos<=CM;--TRES
														dataWord(conv_integer(contadorData))<=ESPACIO;
														dataWord(conv_integer(contadorData))<=CM;
														RWcd <= '0';
														RScd <= '1';
														ENcd <= '1';
														aux:=CM;
													end if;
												when "0010" & "0001"=>
													if(aux/=CUATRO) then
														seLeenDatos<='1';
														salidaAPantallaDatos<=CUATRO;
														dataWord(conv_integer(contadorData))<=ESPACIO;
														dataWord(conv_integer(contadorData))<=CUATRO;
														RWcd <= '0';
														RScd <= '1';
														ENcd <= '1';
														aux:=CUATRO;
													end if;
												when "0010" & "0010"=>
													if(aux/=CINCO) then
														seLeenDatos<='1';
														salidaAPantallaDatos<=CINCO;--CUATRO
														dataWord(conv_integer(contadorData))<=ESPACIO;
														dataWord(conv_integer(contadorData))<=CINCO;
														RWcd <= '0';
														RScd <= '1';
														ENcd <= '1';
														aux:=CINCO;
													end if;
												
												when "0010" & "0100"=>
													if(aux/=SEIS) then
														seLeenDatos<='1';
														salidaAPantallaDatos<=SEIS;--CINCO
														dataWord(conv_integer(contadorData))<=ESPACIO;
														dataWord(conv_integer(contadorData))<=SEIS;
														RWcd <= '0';
														RScd <= '1';
														ENcd <= '1';
														aux:=SEIS;
													end if;
												when "0010" & "1000"=>
													if(aux/=BM) then
														seLeenDatos<='1';
														salidaAPantallaDatos<=BM;--SEIS
														dataWord(conv_integer(contadorData))<=ESPACIO;
														dataWord(conv_integer(contadorData))<=BM;
														RWcd <= '0';
														RScd <= '1';
														ENcd <= '1';
														aux:=BM;
													end if;
												when "0100" & "0001"=>
													if(aux/=UNO) then
														seLeenDatos<='1';
														salidaAPantallaDatos<=UNO;
														dataWord(conv_integer(contadorData))<=ESPACIO;
														dataWord(conv_integer(contadorData))<=UNO;
														RWcd <= '0';
														RScd <= '1';
														ENcd <= '1';
														aux:=UNO;
													end if;
												when "0100" & "0010"=>
													if(aux/=DOS) then
														seLeenDatos<='1';
														salidaAPantallaDatos<=DOS;--SIETE
														dataWord(conv_integer(contadorData))<=ESPACIO;
														dataWord(conv_integer(contadorData))<=DOS;
														RWcd <= '0';
														RScd <= '1';
														ENcd <= '1';
														aux:=DOS;
													end if;
												when "0100" & "0100"=>
													if(aux/=TRES) then
														seLeenDatos<='1';
														salidaAPantallaDatos<=TRES;--OCHO
														dataWord(conv_integer(contadorData))<=espacio;
														dataWord(conv_integer(contadorData))<=TRES;
														RWcd <= '0';
														RScd <= '1';
														ENcd <= '1';
														aux:=TRES;
													end if;
												when "0100" & "1000"=>
													if(aux/=AM) then
														seLeenDatos<='1'; 
														salidaAPantallaDatos<=AM;--NUEVE
														dataWord(conv_integer(contadorData))<=ESPACIO;
														dataWord(conv_integer(contadorData))<=AM;
														RWcd <= '0';
														RScd <= '1';
														ENcd <= '1';
														aux:=AM;
													end if;
												when "1000" & "0001"=>
													if(aux/=ESPACIO) then
														seLeenDatos<='1';
														salidaAPantallaDatos<=ESPACIO;
														dataWord(conv_integer(contadorData))<=ESPACIO;
														dataWord(conv_integer(contadorData))<=ESPACIO;
														RWcd <= '0';
														RScd <= '1';
														ENcd <= '1';
														aux:=ESPACIO;
													end if;
												when "1000" & "0010"=>
													if(aux/=CERO) then
														seLeenDatos<='1';
														salidaAPantallaDatos<=CERO;--CERO
														dataWord(conv_integer(contadorData))<=ESPACIO;
														dataWord(conv_integer(contadorData))<=CERO;
														RWcd <= '0';
														RScd <= '1';
														ENcd <= '1';
														aux:=CERO;
													end if;
												when "1000" & "0100"=>
													if(aux/=SALTO) then
														seLeenDatos<='1';
														salidaAPantallaDatos<=SALTO;
														dataWord(conv_integer(contadorData))<=ESPACIO;
														dataWord(conv_integer(contadorData))<=SALTO;
														RWcd <= '0';
														RScd <= '1';
														ENcd <= '1';
														aux:=SALTO;
													end if;
												when "1000" & "1000"=>
													if(aux/=DM) then
														seLeenDatos<='1';
														salidaAPantallaDatos<=DM;
														dataWord(conv_integer(contadorData))<=ESPACIO;
														dataWord(conv_integer(contadorData))<=DM;
														RWcd <= '0';
														RScd <= '1';
														ENcd <= '1';
														aux:=DM;
													end if;
												when others=>
													salidaAPantallaDatos<=arroba;
													dataWord(conv_integer(contadorData))<=ESPACIO;
													dataWord(conv_integer(contadorData))<=ARROBA;
													RWcd <= '0';
													RScd <= '1';
													ENcd <= '1';
													
											end case;
										--else
											--salidaAPantallaDatos<=dataWord(conv_integer(contadorData));
											--seLeenDatos<='1';
											--RWcd <= '0';
											--RScd <= '1';
											--ENcd <= '1';
										--end if;
									end if;
								else
									seLeenDatos<='0';
									RWcd <= '0';
									RScd <= '1';
									ENcd <= '0';
								end if;
							end if;
						when others => null;
					end case;
					when others => null;
			end case;
		end if;
	end process;
---------------CONTADOR CONFIGURACION RAM	
	process (outosc0,reset)
	begin
		if(outosc0'event and outosc0='1') then
			case reset is 
				when '0'=>
					desactivaContadorRam<='0';
					contadorConfiguracionRam<="00000";
				when '1'=>
					if(desactivaContadorConfiguracionRam ='0') then
						contadorConfiguracionRam<=contadorConfiguracionRam+1;
						desactivaContadorRam<='1';
					else 
						contadorConfiguracionRam<=contadorConfiguracionRam;
						desactivaContadorRam<='0';
					end if;	
				when others => null;
			end case;
		end if;
	end process;

-------------CONFIGURACION LCD RAM
process(outosc0,reset,desactivaContadorRam,contadorConfiguracionRam)
	begin
		if(outosc0'event and outosc0='1') then
			case reset is
				when '0'=>
					salidaAPantallaConfiguracionRam<="00000001";
					desactivaContadorConfiguracionRam<='0';
					RWRc <= '0';
					RSRc <= '0';
					ENRc <= '0';
				when '1'=>
					case desactivaContadorRam is
						when '1'=>
							case contadorConfiguracionRam is
								when "00011" =>
									desactivaContadorConfiguracionRam<='0';
									salidaAPantallaConfiguracionRam<="00000001";
									RWRc <= '0';
									RSRc <= '0';
									ENRc <= '1';
								when "00100" =>
									desactivaContadorConfiguracionRam<='0';
									salidaAPantallaConfiguracionRam<="00000001";
									RWRc <= '0';
									RSRc <= '0';
									ENRc <= '0';
								when "00101" =>
									desactivaContadorConfiguracionRam<='0';
									salidaAPantallaConfiguracionRam<="00000011";
									RWRc <= '0';
									RSRc <= '0';
									ENRc <= '1';
								when "00110" =>
									desactivaContadorConfiguracionRam<='0';
									salidaAPantallaConfiguracionRam<="00000011";
									RWRc <= '0';
									RSRc <= '0';
									ENRc <= '0';
								when "00111" =>
									desactivaContadorConfiguracionRam<='0';
									salidaAPantallaConfiguracionRam<="00000110";
									RWRc <= '0';
									RSRc <= '0';
									ENRc <= '1';
								when "01000" =>
									desactivaContadorConfiguracionRam<='0';
									salidaAPantallaConfiguracionRam<="00000110";
									RWRc <= '0';
									RSRc <= '0';
									ENRc <= '0';
								when "01001" =>
									desactivaContadorConfiguracionRam<='0';
									salidaAPantallaConfiguracionRam<="00001111";
									RWRc <= '0';
									RSRc <= '0';
									ENRc <= '1';
								when "01010" =>
									desactivaContadorConfiguracionRam<='0';
									salidaAPantallaConfiguracionRam<="00001111";
									RWRc <= '0';
									RSRc <= '0';
									ENRc <= '0';
								when "01011" =>
									desactivaContadorConfiguracionRam<='0';
									salidaAPantallaConfiguracionRam<="00011100";
									RWRc <= '0';
									RSRc <= '0';
									ENRc <= '1';
								when "01100" =>
									desactivaContadorConfiguracionRam<='0';
									salidaAPantallaConfiguracionRam<="00011100";
									RWRc <= '0';
									RSRc <= '0';
									ENRc <= '0';
								when "01101" =>
									desactivaContadorConfiguracionRam<='0';
									salidaAPantallaConfiguracionRam<="00111100";
									RWRc <= '0';
									RSRc <= '0';
									ENRc <= '1';
								when "01110" =>
									desactivaContadorConfiguracionRam<='0';
									salidaAPantallaConfiguracionRam<="00111100";
									RWRc <= '0';
									RSRc <= '0';
									ENRc <= '0';
								when "01111" =>
									desactivaContadorConfiguracionRam<='0';
									salidaAPantallaConfiguracionRam<="10000000";
									RWRc <= '0';
									RSRc <= '0';
									ENRc <= '1';
								when "10000" =>
									desactivaContadorConfiguracionRam<='1';
									salidaAPantallaConfiguracionRam<="10000000";
									RWRc <= '0';
									RSRc <= '0';
									ENRc <= '1';
								when others=> null;
							end case;
							when others=>null;
					end case;
					when others=>null;
			end case;
		end if;
	end process;
------------------ CONTADOR DE RAM

	process (outosc0,reset,desactivaContadorConfiguracionrAM,seLeenDatosRam)
	begin
		if(outosc0'event and outosc0='1') then
			case reset is
				when '0'=>
					contadorRam<="000000";
					datosEsVacioRam<='0';
				when '1'=>
					case desactivaContadorConfiguracionRam is
						when '0'=>
							datosEsVacioRam<='0';
						when '1'=>
							if(seLeenDatosRam='1')then
								if(contadorRam<ultimovalorContador)then
									contadorRam<=contadorRam+1;
									datosEsVacioRam<='0';
								end if;
							else
								contadorRam<=contadorRam;
								datosEsVacioRam<='1';
							end if;
						when others => null;
					end case;
				when others => null;	
			end case;
		end if;
	end process;

-------------LECTOR DE RAM
	process (outosc0,reset,desactivaContadorConfiguracionRam,datosEsVacioRam)
	begin
		if(outosc0'event and outosc0='1') then
			case reset is
				when '0'=>
					salidaApantallaRam<=espacio;
					seLeenDatosRam<='1';
				when '1'=>
					case desactivaContadorConfiguracionRam is
						when '0'=>
							salidaAPantallaRam<=espacio;
							seLeenDatosRam<='0';
						when '1'=>
							if(contadorRam<"111111") then
								if(datosEsVacioRam='0') then
								----LO NUEVO
									if(dataWord(conv_integer(contadorRam))=salto) then
											salidaAPantallaRam<="10101011";
											seLeenDatosRam<='1';
											RWR <= '0';
											RSR <= '0';
											ENR <= '1';
									elsif(dataWord(conv_integer(contadorRam))=salto2) then	
											salidaAPantallaRam<="10101011";
											seLeenDatosRam<='1';
											RWR <= '0';
											RSR <= '0';
											ENR <= '1';
									else
										salidaAPantallaRam<=dataWord(conv_integer(contadorRam));
										seLeenDatosRam<='1';
										RWR <= '0';
										RSR <= '1';
										ENR <= '1';
									end if;
								----LO NUEVO
									--salidaAPantallaDatos<=dataWord(conv_integer(contadorData));
									--seLeenDatos<='1';
								else
									seLeenDatosRam<='0';
									RWR <= '0';
									RSR <= '1';
									ENR <= '0';
								end if;
							end if;
						when others => null;
					end case;
				when others => null;
			end case;
		end if;
	end process;

	
--------------MUX DE SALIDA
	process (outosc0,reset,desactivaContadorConfiguracion)
	begin
		if(outosc0'event and outosc0='1') then
			case reset is
				when '0'=>
					SalidaPantalla<="00111000";
					RW<='0';
					RS<='0';
					EN<='0';
				when '1'=>
					if(lectura='0') then
						case desactivaContadorConfiguracion is
							when '0'=>
								--dataWord <= ((others=> (others=>'0')));
								SalidaPantalla<=salidaAPantallaConfiguracion;
								RW<=RWc;
								EN<=ENc;
								RS<=RSc;
							when '1'=>
								SalidaPantalla<=salidaAPantallaDatos;
								RW<=RWcd;
								EN<=ENcd;
								RS<=RScd;
							when others=>null;
						end case;
					else
						case desactivaContadorConfiguracionRam is
							when '0'=>
								SalidaPantalla<=salidaAPantallaConfiguracionRam;
								RW<=RWRc;
								EN<=ENRc;
								RS<=RSRc;
							when '1'=>
								SalidaPantalla<=salidaAPantallaRam;
								RW<=RWR;
								EN<=ENR;
								RS<=RSR;
							when others=>null;
						end case;
					end if;
					when others=>null;
			end case;
		end if;
	end process;

end toposc0;