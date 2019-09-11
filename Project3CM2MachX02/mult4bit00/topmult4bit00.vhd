library ieee;
use ieee.std_logic_1164.all;

library lattice;
use lattice.all;

use packagemult4bit00.all;

entity topmult4bit00 is
	port
	(
		Am: in std_logic_vector(3 downto 0);
		Bm: in std_logic_vector(3 downto 0);
		Rm: out std_logic_vector(7 downto 0)
	);
end topmult4bit00;

architecture topmult4bit0 of topmult4bit00 is
signal S1, S2, S4, S5, S7: std_logic_vector(3 downto 0);
signal S0, S3, S6, S8: std_logic_vector(2 downto 0);
begin
	M00: andmu port map
	(
		Aam => Am(0),
		Bam => Bm(0),
		Yam => Rm(0)
	);
	
	M01: andmu port map
	(
		Aam => Am(1),
		Bam => Bm(0),
		Yam => S0(0)	
	);
	
	M02: andmu port map
	(
		Aam => Am(2),
		Bam => Bm(0),
		Yam => S0(1)	
	);
	
	M03: andmu port map
	(
		Aam => Am(3),
		Bam => Bm(0),
		Yam => S0(2)	
	);
	
	M04: andmu port map
	(
		Aam => Am(0),
		Bam => Bm(1),
		Yam => S1(0)	
	);
	
	M05: andmu port map
	(
		Aam => Am(1),
		Bam => Bm(1),
		Yam => S1(1)	
	);
	
	M06: andmu port map
	(
		Aam => Am(2),
		Bam => Bm(1),
		Yam => S1(2)	
	);
	
	M07: andmu port map
	(
		Aam => Am(3),
		Bam => Bm(1),
		Yam => S1(3)	
	);
	
	M08: famu00 port map
	(
		Cmu00 => '0',
		Amu00 => S0(0),
		Bmu00 => S1(0),
		Cmu01 => S2(0),
		Smu00 => Rm(1)
	);
	
	M09: famu00 port map
	(
		Cmu00 => S2(0),
		Amu00 => S0(1),
		Bmu00 => S1(1),
		Cmu01 => S2(1),
		Smu00 => S3(0)
	);
	
	M10: famu00 port map
	(
		Cmu00 => S2(1),
		Amu00 => S0(2),
		Bmu00 => S1(2),
		Cmu01 => S2(2),
		Smu00 => S3(1)
	);
	
	M11: famu00 port map
	(
		Cmu00 => S2(2),
		Amu00 => '0',
		Bmu00 => S1(3),
		Cmu01 => S2(3),
		Smu00 => S3(2)
	);
	
	M12: andmu port map
	(
		Aam => Am(0),
		Bam => Bm(2),
		Yam => S4(0)	
	);
	
	M13: andmu port map
	(
		Aam => Am(1),
		Bam => Bm(2),
		Yam => S4(1)	
	);
	
	M14: andmu port map
	(
		Aam => Am(2),
		Bam => Bm(2),
		Yam => S4(2)	
	);
	
	M15: andmu port map
	(
		Aam => Am(3),
		Bam => Bm(2),
		Yam => S4(3)	
	);
	
	M16: famu00 port map
	(
		Cmu00 => '0',
		Amu00 => S3(0),
		Bmu00 => S4(0),
		Cmu01 => S5(0),
		Smu00 => Rm(2)
	);
	
	M17: famu00 port map
	(
		Cmu00 => S5(0),
		Amu00 => S3(1),
		Bmu00 => S4(1),
		Cmu01 => S5(1),
		Smu00 => S6(0)
	);
	
	M18: famu00 port map
	(
		Cmu00 => S5(1),
		Amu00 => S3(2),
		Bmu00 => S4(2),
		Cmu01 => S5(2),
		Smu00 => S6(1)
	);
	
	M19: famu00 port map
	(
		Cmu00 => S5(2),
		Amu00 => S2(3),
		Bmu00 => S4(3),
		Cmu01 => S5(3),
		Smu00 => S6(2)
	);
	
	M20: andmu port map
	(
		Aam => Am(0),
		Bam => Bm(3),
		Yam => S7(0)	
	);
	
	M21: andmu port map
	(
		Aam => Am(1),
		Bam => Bm(3),
		Yam => S7(1)	
	);
	
	M22: andmu port map
	(
		Aam => Am(2),
		Bam => Bm(3),
		Yam => S7(2)	
	);
	
	M23: andmu port map
	(
		Aam => Am(3),
		Bam => Bm(3),
		Yam => S7(3)	
	);
	
	M24: famu00 port map
	(
		Cmu00 => '0',
		Amu00 => S6(0),
		Bmu00 => S7(0),
		Cmu01 => S8(0),
		Smu00 => Rm(3)
	);
	
	M25: famu00 port map
	(
		Cmu00 => S8(0),
		Amu00 => S6(1),
		Bmu00 => S7(1),
		Cmu01 => S8(1),
		Smu00 => Rm(4)
	);
	
	M26: famu00 port map
	(
		Cmu00 => S8(1),
		Amu00 => S6(2),
		Bmu00 => S7(2),
		Cmu01 => S8(2),
		Smu00 => Rm(5)
	);
	
	M27: famu00 port map
	(
		Cmu00 => S8(2),
		Amu00 => S5(3),
		Bmu00 => S7(3),
		Cmu01 => Rm(7),
		Smu00 => Rm(6)
	);
	
end topmult4bit0;