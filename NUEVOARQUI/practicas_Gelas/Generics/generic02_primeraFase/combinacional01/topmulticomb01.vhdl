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
	salida_and => resultado_tm(0));
	
	A10: eAnd port map(
	entrada1_and => entrada1_tm(1),
	entrada2_and => entrada2_tm(0),
	salida_and => and10);
	
	A01: eAnd port map(
	entrada1_and => entrada1_tm(0),
	entrada2_and => entrada2_tm(1),
	salida_and => and01);
	
	A20: eAnd port map(
	entrada1_and => entrada1_tm(2),
	entrada2_and => entrada2_tm(0),
	salida_and => and20);
	
	A30: eAnd port map(
	entrada1_and => entrada1_tm(3),
	entrada2_and => entrada2_tm(0),
	salida_and => and30);
	
	A11: eAnd port map(
	entrada1_and => entrada1_tm(1),
	entrada2_and => entrada2_tm(1),
	salida_and => and11);
	
	A21: eAnd port map(
	entrada1_and => entrada1_tm(2),
	entrada2_and => entrada2_tm(1),
	salida_and => and21);
	
	A31: eAnd port map(
	entrada1_and => entrada1_tm(3),
	entrada2_and => entrada2_tm(1),
	salida_and => and31);
	
	A02: eAnd port map(
	entrada1_and => entrada1_tm(0),
	entrada2_and => entrada2_tm(2),
	salida_and => and02);
	
	A12: eAnd port map(
	entrada1_and => entrada1_tm(1),
	entrada2_and => entrada2_tm(2),
	salida_and => and12);
	
	A22: eAnd port map(
	entrada1_and => entrada1_tm(2),
	entrada2_and => entrada2_tm(2),
	salida_and => and22);
	
	A32: eAnd port map(
	entrada1_and => entrada1_tm(3),
	entrada2_and => entrada2_tm(2),
	salida_and => and32);
	
	A03: eAnd port map(
	entrada1_and => entrada1_tm(0),
	entrada2_and => entrada2_tm(3),
	salida_and => and03);
	
	A13: eAnd port map(
	entrada1_and => entrada1_tm(1),
	entrada2_and => entrada2_tm(3),
	salida_and => and13);
	
	A23: eAnd port map(
	entrada1_and => entrada1_tm(2),
	entrada2_and => entrada2_tm(3),
	salida_and => and23);
	
	A33: eAnd port map(
	entrada1_and => entrada1_tm(3),
	entrada2_and => entrada2_tm(3),
	salida_and => and33);

	S1: eTopSumCompleto port map(
	acarreoI_tsc => '0',
	entrada1_tsc => and01,
	entrada2_tsc => and10,
	acarreoO_tsc => CS1,
	resultado_tsc => resultado_tm(1));
	
	S2: eTopSumCompleto port map(
	acarreoI_tsc => CS1,
	entrada1_tsc => and11,
	entrada2_tsc => and20,
	acarreoO_tsc => CS2,
	resultado_tsc => SS2);
	
	S3: eTopSumCompleto port map(
	acarreoI_tsc => CS2,
	entrada1_tsc => and21,
	entrada2_tsc => and30,
	acarreoO_tsc => CS3,
	resultado_tsc => SS3);
	
	S4: eTopSumCompleto port map(
	acarreoI_tsc => CS3,
	entrada1_tsc => and31,
	entrada2_tsc => '0',
	acarreoO_tsc => CS4,
	resultado_tsc => SS4);
	
	S5: eTopSumCompleto port map(
	acarreoI_tsc => '0',
	entrada1_tsc => and02,
	entrada2_tsc => SS2,
	acarreoO_tsc => CS5,
	resultado_tsc => resultado_tm(2));
	
	S6: eTopSumCompleto port map(
	acarreoI_tsc => CS5,
	entrada1_tsc => and12,
	entrada2_tsc => SS3,
	acarreoO_tsc => CS6,
	resultado_tsc => SS6);
	
	S7: eTopSumCompleto port map(
	acarreoI_tsc => CS6,
	entrada1_tsc => and22,
	entrada2_tsc => SS4,
	acarreoO_tsc => CS7,
	resultado_tsc => SS7);
	
	S8: eTopSumCompleto port map(
	acarreoI_tsc => CS7,
	entrada1_tsc => and32,
	entrada2_tsc => CS4,
	acarreoO_tsc => CS8,
	resultado_tsc => SS8);
	
	S9: eTopSumCompleto port map(
	acarreoI_tsc => '0',
	entrada1_tsc => and03,
	entrada2_tsc => SS6,
	acarreoO_tsc => CS9,
	resultado_tsc => resultado_tm(3));
	
	S10: eTopSumCompleto port map(
	acarreoI_tsc => CS9,
	entrada1_tsc => and13,
	entrada2_tsc => SS7,
	acarreoO_tsc => CS10,
	resultado_tsc => resultado_tm(4));
	
	S11: eTopSumCompleto port map(
	acarreoI_tsc => CS10,
	entrada1_tsc => and23,
	entrada2_tsc => SS8,
	acarreoO_tsc => CS11,
	resultado_tsc => resultado_tm(5));
	
	S12: eTopSumCompleto port map(
	acarreoI_tsc => CS11,
	entrada1_tsc => and33,
	entrada2_tsc => CS8,
	acarreoO_tsc => resultado_tm(7),
	resultado_tsc => resultado_tm(6));
	
end aTopMultip;