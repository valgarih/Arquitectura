library ieee;
use ieee.std_logic_1164.all;
use pack_topcombin.all;

entity eTopMultip00 is
	port(
	entrada1_tm: in std_logic_vector(3 downto 0);
	entrada2_tm: in std_logic_Vector(3 downto 0);
	resultado_tm: out std_logic_vector(7 downto 0));
end;

architecture aTopMultip of eTopMultip00 is
signal and01, and02, and03, and10, and11, and12, and13, and20, and21, and22, and23, and30, and31, and32, and33: std_logic;
signal CS1, CS2, CS3, CS4, CS5, CS6, CS7, CS8, CS9, CS10, CS11: std_logic;
signal SS2, SS3, SS4, SS6, SS7, SS8: std_logic;
begin
	A00: eAnd port map(
	entrada1_and => entrada1_tm(0),
	entrada2_and => entrada2_tm(0),
	salida_and => resultado_tm(0);
	
	A10: eAnd port map( 
	entrada1_and => entrada1_tm(1),
	entrada2_and => entrada2_tm(0),
	salida_and => and10;
	
	A01: eAnd port map(
	entrada1_and => entrada1_tm(0),
	entrada2_and => entrada2_tm(1),
	salida_and => and01;
	

	S1: eTopSumCompleto port map(
	acarreoI_tsc => '0', 
	entrada1_tsc => and01,
	entrada2_tsc => and10,
	acarreoO_tsc => CS1,
	resultado_tsc => resultado_tm(1);
	
	
end aTopMultip;