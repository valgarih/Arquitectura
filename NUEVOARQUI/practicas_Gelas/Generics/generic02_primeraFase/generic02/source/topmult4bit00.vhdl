library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;
use packagemult4bit00.all;

entity topmult4bit00 is
port(
	Amult,Bmult: in std_logic_vector(7 downto 0);
	Outmult: out std_logic_vector(15 downto 0)
);
end topmult4bit00;

architecture topmult4bit0 of topmult4bit00 is
signal Sa: std_logic_vector(41 downto 0);
signal S: std_logic_vector(62 downto 0);signal C: std_logic_vector(54 downto 0);
begin		
	UA00: and00 port map(
		Aa=>Amult(0),
		Ba=>Bmult(0),
		Ya=>Outmult(0)
	);
	
	UA01: and00 port map(
		Aa=>Amult(1),
		Ba=>Bmult(0),
		Ya=>S(0)
	);
	
	UA02: and00 port map(
		Aa=>Amult(0),
		Ba=>Bmult(1),
		Ya=>S(1)
	);
	
	UX00: topfa00 port map(		
		A00 =>S(0),
		B00 =>S(1),
		C00 =>'0',
		S00 =>Outmult(1),
		C01 =>C(0)
	);
	
	UA03: and00 port map(
		Aa=>Amult(2),
		Ba=>Bmult(0),
		Ya=>S(2)
	);
	
	UA04: and00 port map(
		Aa=>Amult(1),
		Ba=>Bmult(1),
		Ya=>S(3)
	);
	
	UX01: topfa00 port map(		
		A00 => S(2),
		B00 => S(3),
		C00 => C(0),
		S00 => Sa(0),
		C01 => C(1));
	
	UA05: and00 port map(
		Aa=>Amult(3),
		Ba=>Bmult(0),
		Ya=>S(4)
	);
	
	UA06: and00 port map(
		Aa=>Amult(2),
		Ba=>Bmult(1),
		Ya=>S(5)
	);
	
	UX02: topfa00 port map(		
		A00 =>S(4),
		B00 =>S(5),
		C00 =>C(1),
		S00 =>Sa(1),
		C01 => C(2)
	);
	
	UA07: and00 port map(
		Aa=>Amult(4),
		Ba=>Bmult(0),
		Ya=>S(6)
	);	
	
	UA08: and00 port map(
		Aa=>Amult(3),
		Ba=>Bmult(1),
		Ya=>S(7)
	);	
	
	UX03: topfa00 port map(		
		A00 => S(6),
		B00 => S(7),
		C00 => C(2),
		S00 =>Sa(2),
		C01 => C(3)
	);
	
	UA09: and00 port map(
		Aa=>Amult(5),
		Ba=>Bmult(0),
		Ya=>S(8)
	);	
	
	UA10: and00 port map(
		Aa=>Amult(4),
		Ba=>Bmult(1),
		Ya=>S(9)
	);	
	
	UX04: topfa00 port map(		
		A00 => S(8),
		B00 => S(9),
		C00 => C(3),
		S00 =>Sa(3),
		C01 => C(4)
	);
	
	UA11: and00 port map(
		Aa=>Amult(6),
		Ba=>Bmult(0),
		Ya=>S(10)
	);	
	
	UA12: and00 port map(
		Aa=>Amult(5),
		Ba=>Bmult(1),
		Ya=>S(11)
	);	
	
	UX05: topfa00 port map(		
		A00 => S(10),
		B00 => S(11),
		C00 => C(4),
		S00 =>Sa(4),
		C01 => C(5)
	);
	
	UA13: and00 port map(
		Aa=>Amult(7),
		Ba=>Bmult(0),
		Ya=>S(12)
	);	
	
	UA14: and00 port map(
		Aa=>Amult(6),
		Ba=>Bmult(1),
		Ya=>S(13)
	);	
	
	UX06: topfa00 port map(		
		A00 => S(12),
		B00 => S(13),
		C00 => C(5),
		S00 =>Sa(5),
		C01 => C(6)
	);
	
	UA15: and00 port map(
		Aa=>Amult(7),
		Ba=>Bmult(1),
		Ya=>S(14)
	);	
	
	UX07: topfa00 port map(		
		A00 => S(14),
		B00 => '0',
		C00 => C(6),
		S00 =>Sa(6),
		C01 => C(7)
	);
	
	--Segundo nivel
	UA16: and00 port map(
		Aa=>Amult(0),
		Ba=>Bmult(2),
		Ya=>S(15)
	);
	
	UX08: topfa00 port map(		
		A00 => S(15),
		B00 => Sa(0),
		C00 => '0',
		S00 => Outmult(2),
		C01 => C(8)
	);
	
	UA17: and00 port map(
		Aa=>Amult(1),
		Ba=>Bmult(2),
		Ya=>S(16)
	);
	
	UX09: topfa00 port map(		
		A00 => S(16),
		B00 => Sa(1),
		C00 => C(8),
		S00 => Sa(7),
		C01 => C(9)
	);
	
	
	UA18: and00 port map(
		Aa=>Amult(2),
		Ba=>Bmult(2),
		Ya=>S(17)
	);
	
	UX10: topfa00 port map(		
		A00 => S(17),
		B00 => Sa(2),
		C00 => C(9),
		S00 => Sa(8),
		C01 => C(10)
	);
	
	UA19: and00 port map(
		Aa=>Amult(3),
		Ba=>Bmult(2),
		Ya=>S(18)
	);
	
	UX11: topfa00 port map(		
		A00 => S(18),
		B00 => Sa(3),
		C00 => C(10),
		S00 => Sa(9),
		C01 => C(11)
	);
		
	UA20: and00 port map(
		Aa=>Amult(4),
		Ba=>Bmult(2),
		Ya=>S(19)
	);
	
	UX12: topfa00 port map(		
		A00 => S(19),
		B00 => Sa(4),
		C00 => C(11),
		S00 => Sa(10),
		C01 => C(12)
	);
		
	UA21: and00 port map(
		Aa=>Amult(5),
		Ba=>Bmult(2),
		Ya=>S(20)
	);
	
	UX13: topfa00 port map(		
		A00 => S(20),
		B00 => Sa(5),
		C00 => C(12),
		S00 => Sa(11),
		C01 => C(13)
	);
	
	UA22: and00 port map(
		Aa=>Amult(6),
		Ba=>Bmult(2),
		Ya=>S(21)
	);
	
	UX14: topfa00 port map(		
		A00 => S(21),
		B00 => Sa(6),
		C00 => C(13),
		S00 => Sa(12),
		C01 => C(14)
	);
	
	UA23: and00 port map(
		Aa=>Amult(7),
		Ba=>Bmult(2),
		Ya=>S(22)
	);
	
	UX15: topfa00 port map(		
		A00 => S(22),
		B00 => C(7),
		C00 => C(14),
		S00 => Sa(13),
		C01 => C(15)
	);
	
--Tercer nivel
	
	UA24: and00 port map(
		Aa=>Amult(0),
		Ba=>Bmult(3),
		Ya=>S(23)
	);
	
	UX16: topfa00 port map(		
		A00 => S(23),
		B00 => Sa(7),
		C00 => '0',
		S00 => Outmult(3),
		C01 => C(16)
	);
	
	UA25: and00 port map(
		Aa=>Amult(1),
		Ba=>Bmult(3),
		Ya=>S(24)
	);
	
	UX17: topfa00 port map(		
		A00 => S(24),
		B00 => Sa(8),
		C00 => C(16),
		S00 => Sa(14),
		C01 => C(17)
	);

	
	UA26: and00 port map(
		Aa=>Amult(2),
		Ba=>Bmult(3),
		Ya=>S(25)
	);	
	
	UX18: topfa00 port map(		
		A00 => S(25),
		B00 => Sa(9),
		C00 => C(17),
		S00 => Sa(15),
		C01 => C(18)
	);
		UA27: and00 port map(
		Aa=>Amult(3),
		Ba=>Bmult(3),
		Ya=>S(26)
	);	
	
	UX19: topfa00 port map(		
		A00 => S(26),
		B00 => Sa(10),
		C00 => C(18),
		S00 => Sa(16),
		C01 => C(19)
	);
	
	UA28: and00 port map(
		Aa=>Amult(4),
		Ba=>Bmult(3),
		Ya=>S(27)
	);	
	
	UX20: topfa00 port map(		
		A00 => S(27),
		B00 => Sa(11),
		C00 => C(19),
		S00 => Sa(17),
		C01 => C(20)
	);
	
	UA29: and00 port map(
		Aa=>Amult(5),
		Ba=>Bmult(3),
		Ya=>S(28)
	);	
	
	UX21: topfa00 port map(		
		A00 => S(28),
		B00 => Sa(12),
		C00 => C(20),
		S00 => Sa(18),
		C01 => C(21)
	);
	
	UA30: and00 port map(
		Aa=>Amult(6),
		Ba=>Bmult(3),
		Ya=>S(29)
	);	
	
	UX22: topfa00 port map(		
		A00 => S(29),
		B00 => Sa(13),
		C00 => C(21),
		S00 => Sa(19),
		C01 => C(22)
	);
	
	UA31: and00 port map(
		Aa=>Amult(7),
		Ba=>Bmult(3),
		Ya=>S(30)
	);	
	
	UX23: topfa00 port map(		
		A00 => S(30),
		B00 => C(15),
		C00 => C(22),
		S00 => Sa(20),
		C01 => C(23)
	);
	
	--cuarto nivel
	
	UA32: and00 port map(
		Aa=>Amult(0),
		Ba=>Bmult(4),
		Ya=>S(31)
	);	
	
	UX24: topfa00 port map(		
		A00 => S(31),
		B00 => Sa(14),
		C00 => '0',
		S00 => Outmult(4),
		C01 => C(24)
	);
	
	UA33: and00 port map(
		Aa=>Amult(1),
		Ba=>Bmult(4),
		Ya=>S(32)
	);	
	
	UX25: topfa00 port map(		
		A00 => S(32),
		B00 => Sa(15),
		C00 => C(24),
		S00 => Sa(21),
		C01 => C(25)
	);

	UA34: and00 port map(
		Aa=>Amult(2),
		Ba=>Bmult(4),
		Ya=>S(33)
	);	
	
	UX26: topfa00 port map(		
		A00 => S(33),
		B00 => Sa(16),
		C00 => C(25),
		S00 => Sa(22),
		C01 => C(26)
	);
	
	UA35: and00 port map(
		Aa=>Amult(3),
		Ba=>Bmult(4),
		Ya=>S(34)
	);	
	
	UX27: topfa00 port map(		
		A00 => S(34),
		B00 => Sa(17),
		C00 => C(26),
		S00 => Sa(23),
		C01 => C(27)
	);
	
	UA36: and00 port map(
		Aa=>Amult(4),
		Ba=>Bmult(4),
		Ya=>S(35)
	);	
	
	UX28: topfa00 port map(		
		A00 => S(35),
		B00 => Sa(18),
		C00 => C(27),
		S00 => Sa(24),
		C01 => C(28)
	);
	
	UA37: and00 port map(
		Aa=>Amult(5),
		Ba=>Bmult(4),
		Ya=>S(36)
	);	
	
	UX29: topfa00 port map(		
		A00 => S(36),
		B00 => Sa(19),
		C00 => C(28),
		S00 => Sa(25),
		C01 => C(29)
	);
	
	UA38: and00 port map(
		Aa=>Amult(6),
		Ba=>Bmult(4),
		Ya=>S(37)
	);	
	
	UX30: topfa00 port map(		
		A00 => S(37),
		B00 => Sa(20),
		C00 => C(29),
		S00 => Sa(26),
		C01 => C(30)
	);
	
	UA39: and00 port map(
		Aa=>Amult(7),
		Ba=>Bmult(4),
		Ya=>S(38)
	);	
	
	UX31: topfa00 port map(		
		A00 => S(38),
		B00 => C(23),
		C00 => C(30),
		S00 => Sa(27),
		C01 => C(31)
	);
	
	-- quinto nivel
	
	UA40: and00 port map(
		Aa=>Amult(0),
		Ba=>Bmult(5),
		Ya=>S(39)
	);	
	
	UX32: topfa00 port map(		
		A00 => S(39),
		B00 => Sa(21),
		C00 => '0',
		S00 => Outmult(5),
		C01 => C(32)
	);
	
	UA41: and00 port map(
		Aa=>Amult(1),
		Ba=>Bmult(5),
		Ya=>S(40)
	);	
	
	UX33: topfa00 port map(		
		A00 => S(40),
		B00 => Sa(22),
		C00 => C(32),
		S00 => Sa(28),
		C01 => C(33)
	);
	
	UA42: and00 port map(
		Aa=>Amult(2),
		Ba=>Bmult(5),
		Ya=>S(41)
	);	
	
	UX34: topfa00 port map(		
		A00 => S(41),
		B00 => Sa(23),
		C00 => C(33),
		S00 => Sa(29),
		C01 => C(34)
	);
	
	UA43: and00 port map(
		Aa=>Amult(3),
		Ba=>Bmult(5),
		Ya=>S(42)
	);	
	
	UX35: topfa00 port map(		
		A00 => S(42),
		B00 => Sa(24),
		C00 => C(34),
		S00 => Sa(30),
		C01 => C(35)
	);
	
	UA44: and00 port map(
		Aa=>Amult(4),
		Ba=>Bmult(5),
		Ya=>S(43)
	);	
	
	UX36: topfa00 port map(		
		A00 => S(43),
		B00 => Sa(25),
		C00 => C(35),
		S00 => Sa(31),
		C01 => C(36)
	);
	
	UA45: and00 port map(
		Aa=>Amult(5),
		Ba=>Bmult(5),
		Ya=>S(44)
	);	
	
	UX37: topfa00 port map(		
		A00 => S(44),
		B00 => Sa(26),
		C00 => C(36),
		S00 => Sa(32),
		C01 => C(37)
	);
	
	UA46: and00 port map(
		Aa=>Amult(6),
		Ba=>Bmult(5),
		Ya=>S(45)
	);	
	
	UX38: topfa00 port map(		
		A00 => S(45),
		B00 => Sa(27),
		C00 => C(37),
		S00 => Sa(33),
		C01 => C(38)
	);
	
	UA47: and00 port map(
		Aa=>Amult(7),
		Ba=>Bmult(5),
		Ya=>S(46)
	);	
	
	UX39: topfa00 port map(		
		A00 => S(46),
		B00 => C(31),
		C00 => C(38),
		S00 => Sa(34),
		C01 => C(39)
	);
	
	--sexto nivel
	
	UA48: and00 port map(
		Aa=>Amult(0),
		Ba=>Bmult(6),
		Ya=>S(47)
	);	
	
	UX40: topfa00 port map(		
		A00 => S(47),
		B00 => Sa(28),
		C00 => '0',
		S00 => Outmult(6),
		C01 => C(40)
	);
	
	UA49: and00 port map(
		Aa=>Amult(1),
		Ba=>Bmult(6),
		Ya=>S(48)
	);	
	
	UX41: topfa00 port map(		
		A00 => S(48),
		B00 => Sa(29),
		C00 => C(40),
		S00 => Sa(35),
		C01 => C(41)
	);
	
	UA50: and00 port map(
		Aa=>Amult(2),
		Ba=>Bmult(6),
		Ya=>S(49)
	);	
	
	UX42: topfa00 port map(		
		A00 => S(49),
		B00 => Sa(30),
		C00 => C(41),
		S00 => Sa(36),
		C01 => C(42)
	);
	
	UA51: and00 port map(
		Aa=>Amult(3),
		Ba=>Bmult(6),
		Ya=>S(50)
	);	
	
	UX43: topfa00 port map(		
		A00 => S(50),
		B00 => Sa(31),
		C00 => C(42),
		S00 => Sa(37),
		C01 => C(43)
	);
	
	UA52: and00 port map(
		Aa=>Amult(4),
		Ba=>Bmult(6),
		Ya=>S(51)
	);	
	
	UX44: topfa00 port map(		
		A00 => S(51),
		B00 => Sa(32),
		C00 => C(43),
		S00 => Sa(38),
		C01 => C(44)
	);
	UA53: and00 port map(
		Aa=>Amult(5),
		Ba=>Bmult(6),
		Ya=>S(52)
	);	
	
	UX45: topfa00 port map(		
		A00 => S(52),
		B00 => Sa(33),
		C00 => C(44),
		S00 => Sa(39),
		C01 => C(45)
	);
	
	UA54: and00 port map(
		Aa=>Amult(6),
		Ba=>Bmult(6),
		Ya=>S(53)
	);	
	
	UX46: topfa00 port map(		
		A00 => S(53),
		B00 => Sa(34),
		C00 => C(45),
		S00 => Sa(40),
		C01 => C(46)
	);
	
	UA55: and00 port map(
		Aa=>Amult(7),
		Ba=>Bmult(6),
		Ya=>S(54)
	);	
	
	UX47: topfa00 port map(		
		A00 => S(54),
		B00 => C(39),
		C00 => C(46),
		S00 => Sa(41),
		C01 => C(47)
	);
	
	--septimo nivel

	UA56: and00 port map(
		Aa=>Amult(0),
		Ba=>Bmult(7),
		Ya=>S(55)
	);	
	
	UX48: topfa00 port map(		
		A00 => S(55),
		B00 => Sa(35),
		C00 => '0',
		S00 => Outmult(7),
		C01 => C(48)
	);

	UA57: and00 port map(
		Aa=>Amult(1),
		Ba=>Bmult(7),
		Ya=>S(56)
	);	
	
	UX49: topfa00 port map(		
		A00 => S(56),
		B00 => Sa(36),
		C00 => C(48),
		S00 => Outmult(8),
		C01 => C(49)
	);

	UA58: and00 port map(
		Aa=>Amult(2),
		Ba=>Bmult(7),
		Ya=>S(57)
	);	
	
	UX50: topfa00 port map(		
		A00 => S(57),
		B00 => Sa(37),
		C00 => C(49),
		S00 => Outmult(9),
		C01 => C(50)
	);
	
	UA59: and00 port map(
		Aa=>Amult(3),
		Ba=>Bmult(7),
		Ya=>S(58)
	);	
	
	UX51: topfa00 port map(		
		A00 => S(58),
		B00 => Sa(38),
		C00 => C(50),
		S00 => Outmult(10),
		C01 => C(51)
	);
	
	UA60: and00 port map(
		Aa=>Amult(4),
		Ba=>Bmult(7),
		Ya=>S(59)
	);	
	
	UX52: topfa00 port map(		
		A00 => S(59),
		B00 => Sa(39),
		C00 => C(51),
		S00 => Outmult(11),
		C01 => C(52)
	);
	
	UA61: and00 port map(
		Aa=>Amult(5),
		Ba=>Bmult(7),
		Ya=>S(60)
	);	
	
	UX53: topfa00 port map(		
		A00 => S(60),
		B00 => Sa(40),
		C00 => C(52),
		S00 => Outmult(12),
		C01 => C(53)
	);
	
	UA62: and00 port map(
		Aa=>Amult(6),
		Ba=>Bmult(7),
		Ya=>S(61)
	);	
	
	UX54: topfa00 port map(		
		A00 => S(61),
		B00 => Sa(41),
		C00 => C(53),
		S00 => Outmult(13),
		C01 => C(54)
	);
	UA63: and00 port map(
		Aa=>Amult(7),
		Ba=>Bmult(7),
		Ya=>S(62)
	);	
	
	UX55: topfa00 port map(		
		A00 => S(62),
		B00 => C(47),
		C00 => C(54),
		S00 => Outmult(14),
		C01 => Outmult(15)
	);


end topmult4bit0;