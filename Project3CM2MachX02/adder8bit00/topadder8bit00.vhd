library ieee;
use ieee.std_logic_1164.all;

library lattice;
use lattice.all;

use packageadder4bit00.all;

entity topadder8bit00 is 
	port
	(
		Ai: in std_logic_vector(7 downto 0);
		Bi: in std_logic_vector(7 downto 0);
		SL: in std_logic;
		So: out std_logic_vector(7 downto 0); 
		LED: out std_logic
	);
end topadder8bit00;

architecture topadder8bit0 of topadder8bit00 is
signal SB,SC,SA: std_logic_vector(7 downto 0);
signal Sx: std_logic;
begin
-- |||||||||||||||||||||||XORS
	AD00: xoradd port map
	(	
		Ax => SL,
		Bx => Bi(0),
		Yx => SB(0)
	);
	
	AD01: xoradd port map
	(	
		Ax => SL,
		Bx => Bi(1),
		Yx => SB(1)
	);
	
	AD02: xoradd port map
	(	
		Ax => SL,
		Bx => Bi(2),
		Yx => SB(2)
	);
	
	AD03: xoradd port map
	(	
		Ax => SL,
		Bx => Bi(3),
		Yx => SB(3)
	);
	
	AD04: xoradd port map
	(	
		Ax => SL,
		Bx => Bi(4),
		Yx => SB(4)
	);
	
	AD05: xoradd port map
	(	
		Ax => SL,
		Bx => Bi(5),
		Yx => SB(5)
	);
	
	AD06: xoradd port map
	(	
		Ax => SL,
		Bx => Bi(6),
		Yx => SB(6)
	);
	
	AD07: xoradd port map
	(	
		Ax => SL,
		Bx => Bi(7),
		Yx => SB(7)
	);
-- ||||||||||||||||||||||| FAS
		AD08: fa00 port map
	(
		C00 => SL,
		A00 => Ai(0),
		B00 => SB(0),
		C01 => SC(0),
		S00 => SA(0)
	);
	
	AD09: fa00 port map
	(
		C00 => SC(0),
		A00 => Ai(1),
		B00 => SB(1),
		C01 => SC(1),
		S00 => SA(1)
	);
	
	AD10: fa00 port map
	(
		C00 => SC(1),
		A00 => Ai(2),
		B00 => SB(2),
		C01 => SC(2),
		S00 => SA(2)
	);
	
	AD11: fa00 port map
	(
		C00 => SC(2),
		A00 => Ai(3),
		B00 => SB(3),
		C01 => SC(3),
		S00 => SA(3)
	);
	
	AD12: fa00 port map
	(
		C00 => SC(3),
		A00 => Ai(4),
		B00 => SB(4),
		C01 => SC(4),
		S00 => SA(4)
	);
	
	AD13: fa00 port map
	(
		C00 => SC(4),
		A00 => Ai(5),
		B00 => SB(5),
		C01 => SC(5),
		S00 => SA(5)
	);
	
	AD14: fa00 port map
	(
		C00 => SC(5),
		A00 => Ai(6),
		B00 => SB(6),
		C01 => SC(6),
		S00 => SA(6)
	);
	
	AD15: fa00 port map
	(
		C00 => SC(6),
		A00 => Ai(7),
		B00 => SB(7),
		C01 => SC(7),
		S00 => SA(7)
	);
	
-- |||||||||||||||||||| ANDS
	
	AD16: andadd port map
	(
		Aa => Sx,
		Ba => SA(0),
		Ya => So(0)
	);
	
	AD17: andadd port map
	(
		Aa => Sx,
		Ba => SA(1),
		Ya => So(1)
	);
	
	AD18: andadd port map
	(
		Aa => Sx,
		Ba => SA(2),
		Ya => So(2)
	);
	
	AD19: andadd port map
	(
		Aa => Sx,
		Ba => SA(3),
		Ya => So(3)
	);
	
	AD20: andadd port map
	(
		Aa => Sx,
		Ba => SA(4),
		Ya => So(4)
	);
	
	AD21: andadd port map
	(
		Aa => Sx,
		Ba => SA(5),
		Ya => So(5)
	);
	
	AD22: andadd port map
	(
		Aa => Sx,
		Ba => SA(6),
		Ya => So(6)
	);
	
	AD23: andadd port map
	(
		Aa => Sx,
		Ba => SA(7),
		Ya => So(7)
	);
-- ||||||||||||||||||||||| XORS
	
	AD24: xnoradd port map
	(
		Axn => SC(6),
		Bxn => SC(7),
		Yxn => Sx
	);
	
	AD25: xoradd port map
	(
		Ax => SC(6),
		Bx => SC(7),
		Yx => LED
	);
	
end topadder8bit0;