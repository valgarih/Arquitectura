library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;
library machxo2;
use machxo2.all;
use packagemult4bit00.all;

entity topmult4bit00 is
port(
		Am: in std_logic_vector(7 downto 0);
		Bm: in std_logic_vector(7 downto 0);
		Rm: out std_logic_vector(15 downto 0));
end topmult4bit00;

architecture topmult4bit0 of topmult4bit00 is
signal S0, S1, S2, S3, S4: std_logic_vector(7 downto 0);
signal S5, S6, S7, S8, S9, S10: std_logic_vector(7 downto 0);
signal S11, S12, S13, S14, S15: std_logic_vector(7 downto 0);
signal S16, S17, S18, S19, S20: std_logic_vector(7 downto 0);
begin

	M00: and00 port map(
						Aa => Am(0),
						Ba => Bm(0),
						Ya => S0(0));
	Rm(0) <= S0(0);
	
	M01: and00 port map(
						Aa => Am(1),
						Ba => Bm(0),
						Ya => S0(1));
						
	M02: and00 port map(
						Aa => Am(2),
						Ba => Bm(0),
						Ya => S0(2));
						
	M03: and00 port map(
						Aa => Am(3),
						Ba => Bm(0),
						Ya => S0(3));
	
	M04: and00 port map(
						Aa => Am(4),
						Ba => Bm(0),
						Ya => S0(4));
						
	M05: and00 port map(
						Aa => Am(5),
						Ba => Bm(0),
						Ya => S0(5));
	
	M06: and00 port map(
						Aa => Am(6),
						Ba => Bm(0),
						Ya => S0(6));
						
	M07: and00 port map(
						Aa => Am(7),
						Ba => Bm(0),
						Ya => S0(7));
						
	M08: and00 port map(
						Aa => Am(0),
						Ba => Bm(1),
						Ya => S1(0));
						
	M09: and00 port map(
						Aa => Am(1),
						Ba => Bm(1),
						Ya => S1(1));
						
	M10: and00 port map(
						Aa => Am(2),
						Ba => Bm(1),
						Ya => S1(2));
						
	M11: and00 port map(
						Aa => Am(3),
						Ba => Bm(1),
						Ya => S1(3));
						
	M12: and00 port map(
						Aa => Am(4),
						Ba => Bm(1),
						Ya => S1(4));
						
	M13: and00 port map(
						Aa => Am(5),
						Ba => Bm(1),
						Ya => S1(5));

	M14: and00 port map(
						Aa => Am(6),
						Ba => Bm(1),
						Ya => S1(6));

	M15: and00 port map(
						Aa => Am(7),
						Ba => Bm(1),
						Ya => S1(7));
	
	M16: topfa00 port map(
						C00 => '0',
						A00 => S0(1),
						B00 => S1(0),
						C01 => S2(0),
						S00 => S3(0));
						
	Rm(1) <= S3(0);
	
	M17: topfa00 port map(
						C00 => S2(0),
						A00 => S0(2),
						B00 => S1(1),
						C01 => S2(1),
						S00 => S3(1));
						
	M18: topfa00 port map(
						C00 => S2(1),
						A00 => S0(3),
						B00 => S1(2),
						C01 => S2(2),
						S00 => S3(2));	

	M19: topfa00 port map(
						C00 => S2(2),
						A00 => S0(4),
						B00 => S1(3),
						C01 => S2(3),
						S00 => S3(3));
						
	M20: topfa00 port map(
						C00 => S2(3),
						A00 => S0(5),
						B00 => S1(4),
						C01 => S2(4),
						S00 => S3(4));
						
	M21: topfa00 port map(
						C00 => S2(4),
						A00 => S0(6),
						B00 => S1(5),
						C01 => S2(5),
						S00 => S3(5));
						
	M22: topfa00 port map(
						C00 => S2(5),
						A00 => S0(7),
						B00 => S1(6),
						C01 => S2(6),
						S00 => S3(6));
	
	M23: topfa00 port map(
						C00 => S2(6),
						A00 => '0',
						B00 => S1(7),
						C01 => S2(7),
						S00 => S3(7));

	M24: and00 port map(
						Aa => Am(0),
						Ba => Bm(2),
						Ya => S4(0));

	M25: and00 port map(
						Aa => Am(1),
						Ba => Bm(2),
						Ya => S4(1));

	M26: and00 port map(
						Aa => Am(2),
						Ba => Bm(2),
						Ya => S4(2));

	M27: and00 port map(
						Aa => Am(3),
						Ba => Bm(2),
						Ya => S4(3));
						
	M28: and00 port map(
						Aa => Am(4),
						Ba => Bm(2),
						Ya => S4(4));
						
	M29: and00 port map(
						Aa => Am(5),
						Ba => Bm(2),
						Ya => S4(5));
						
	M30: and00 port map(
						Aa => Am(6),
						Ba => Bm(2),
						Ya => S4(6));
						
	M31: and00 port map(
						Aa => Am(7),
						Ba => Bm(2),
						Ya => S4(7));

	M32: topfa00 port map(
					   C00 => '0',
					   A00 => S3(1),
					   B00 => S4(0),
					   C01 => S5(0),
					   S00 => S6(0));
					   
	Rm(2) <= S6(0);
	
	M33: topfa00 port map(
					   C00 => S5(0),
					   A00 => S3(2),
					   B00 => S4(1),
					   C01 => S5(1),
					   S00 => S6(1));

	M34: topfa00 port map(
					   C00 => S5(1),
					   A00 => S3(3),
					   B00 => S4(2),
					   C01 => S5(2),
					   S00 => S6(2));
					   
	M35: topfa00 port map(
					   C00 => S5(2),
					   A00 => S3(4),
					   B00 => S4(3),
					   C01 => S5(3),
					   S00 => S6(3));
					   
	M36: topfa00 port map(
					   C00 => S5(3),
					   A00 => S3(5),
					   B00 => S4(4),
					   C01 => S5(4),
					   S00 => S6(4));
					   
	M37: topfa00 port map(
					   C00 => S5(4),
					   A00 => S3(6),
					   B00 => S4(5),
					   C01 => S5(5),
					   S00 => S6(5));
					   
	M38: topfa00 port map(
					   C00 => S5(5),
					   A00 => S3(7),
					   B00 => S4(6),
					   C01 => S5(6),
					   S00 => S6(6));
					   
	M39: topfa00 port map(
					   C00 => S5(6),
					   A00 => S2(7),
					   B00 => S4(7),
					   C01 => S5(7),
					   S00 => S6(7));				   
	
	M40: and00 port map(
						Aa => Am(0),
						Ba => Bm(3),
						Ya => S7(0));
	
	M41: and00 port map(
						Aa => Am(1),
						Ba => Bm(3),
						Ya => S7(1));
						
	M42: and00 port map(
						Aa => Am(2),
						Ba => Bm(3),
						Ya => S7(2));
						
	M43: and00 port map(
						Aa => Am(3),
						Ba => Bm(3),
						Ya => S7(3));
						
	M44: and00 port map(
						Aa => Am(4),
						Ba => Bm(3),
						Ya => S7(4));
						
	M45: and00 port map(
						Aa => Am(5),
						Ba => Bm(3),
						Ya => S7(5));
						
	M46: and00 port map(
						Aa => Am(6),
						Ba => Bm(3),
						Ya => S7(6));
						
	M47: and00 port map(
						Aa => Am(7),
						Ba => Bm(3),
						Ya => S7(7));
						
	M48: topfa00 port map(
					   C00 => '0',
					   A00 => S6(1),
					   B00 => S7(0),
					   C01 => S8(0),
					   S00 => S9(0));
					   
	Rm(3) <= S9(0);
					   
	M49: topfa00 port map(
					   C00 => S8(0),
					   A00 => S6(2),
					   B00 => S7(1),
					   C01 => S8(1),
					   S00 => S9(1));
					   
	M50: topfa00 port map(
					   C00 => S8(1),
					   A00 => S6(3),
					   B00 => S7(2),
					   C01 => S8(2),
					   S00 => S9(2));
					   
	M51: topfa00 port map(
					   C00 => S8(2),
					   A00 => S6(4),
					   B00 => S7(3),
					   C01 => S8(3),
					   S00 => S9(3));
					   
	M52: topfa00 port map(
					   C00 => S8(3),
					   A00 => S6(5),
					   B00 => S7(4),
					   C01 => S8(4),
					   S00 => S9(4));
					   
	M53: topfa00 port map(
					   C00 => S8(4),
					   A00 => S6(6),
					   B00 => S7(5),
					   C01 => S8(5),
					   S00 => S9(5));
					   
	M54: topfa00 port map(
					   C00 => S8(5),
					   A00 => S6(7),
					   B00 => S7(6),
					   C01 => S8(6),
					   S00 => S9(6));
					   
	M55: topfa00 port map(
					   C00 => S8(6),
					   A00 => S5(7),
					   B00 => S7(7),
					   C01 => S8(7),
					   S00 => S9(7));
					   
	M56: and00 port map(
						Aa => Am(0),
						Ba => Bm(4),
						Ya => S10(0));

	M57: and00 port map(
						Aa => Am(1),
						Ba => Bm(4),
						Ya => S10(1));
						
	M58: and00 port map(
						Aa => Am(2),
						Ba => Bm(4),
						Ya => S10(2));
						
	M59: and00 port map(
						Aa => Am(3),
						Ba => Bm(4),
						Ya => S10(3));
						
	M60: and00 port map(
						Aa => Am(4),
						Ba => Bm(4),
						Ya => S10(4));
						
	M61: and00 port map(
						Aa => Am(5),
						Ba => Bm(4),
						Ya => S10(5));
						
	M62: and00 port map(
						Aa => Am(6),
						Ba => Bm(4),
						Ya => S10(6));
						
	M63: and00 port map(
						Aa => Am(7),
						Ba => Bm(4),
						Ya => S10(7));

	M64: topfa00 port map(
					   C00 => '0',
					   A00 => S9(1),
					   B00 => S10(0),
					   C01 => S11(0),
					   S00 => S12(0));
					   
	Rm(4) <= S12(0);
	
	M65: topfa00 port map(
					   C00 => S11(0),
					   A00 => S9(2),
					   B00 => S10(1),
					   C01 => S11(1),
					   S00 => S12(1));
					   
	M66: topfa00 port map(
					   C00 => S11(1),
					   A00 => S9(3),
					   B00 => S10(2),
					   C01 => S11(2),
					   S00 => S12(2));
					   
	M67: topfa00 port map(
					   C00 => S11(2),
					   A00 => S9(4),
					   B00 => S10(3),
					   C01 => S11(3),
					   S00 => S12(3));
					   
	M68: topfa00 port map(
					   C00 => S11(3),
					   A00 => S9(5),
					   B00 => S10(4),
					   C01 => S11(4),
					   S00 => S12(4));
					   
	M69: topfa00 port map(
					   C00 => S11(4),
					   A00 => S9(6),
					   B00 => S10(5),
					   C01 => S11(5),
					   S00 => S12(5));
					   
	M70: topfa00 port map(
					   C00 => S11(5),
					   A00 => S9(7),
					   B00 => S10(6),
					   C01 => S11(6),
					   S00 => S12(6));
					   
	M71: topfa00 port map(
					   C00 => S11(6),
					   A00 => S8(7),
					   B00 => S10(7),
					   C01 => S11(7),
					   S00 => S12(7));
					   
	M72: and00 port map(
						Aa => Am(0),
						Ba => Bm(5),
						Ya => S13(0));
						
	M73: and00 port map(
						Aa => Am(1),
						Ba => Bm(5),
						Ya => S13(1));
						
	M74: and00 port map(
						Aa => Am(2),
						Ba => Bm(5),
						Ya => S13(2));
						
	M75: and00 port map(
						Aa => Am(3),
						Ba => Bm(5),
						Ya => S13(3));
						
	M76: and00 port map(
						Aa => Am(4),
						Ba => Bm(5),
						Ya => S13(4));
						
	M77: and00 port map(
						Aa => Am(5),
						Ba => Bm(5),
						Ya => S13(5));
						
	M78: and00 port map(
						Aa => Am(6),
						Ba => Bm(5),
						Ya => S13(6));
						
	M79: and00 port map(
						Aa => Am(7),
						Ba => Bm(5),
						Ya => S13(7));
	
	M80: topfa00 port map(
					   C00 => '0',
					   A00 => S12(1),
					   B00 => S13(0),
					   C01 => S14(0),
					   S00 => S15(0));
					   
	Rm(5) <= S15(0);
	
	M81: topfa00 port map(
					   C00 => S14(0),
					   A00 => S12(2),
					   B00 => S13(1),
					   C01 => S14(1),
					   S00 => S15(1));
					   
	M82: topfa00 port map(
					   C00 => S14(1),
					   A00 => S12(3),
					   B00 => S13(2),
					   C01 => S14(2),
					   S00 => S15(2));
					   
	M83: topfa00 port map(
					   C00 => S14(2),
					   A00 => S12(4),
					   B00 => S13(3),
					   C01 => S14(3),
					   S00 => S15(3));
					   
	M84: topfa00 port map(
					   C00 => S14(3),
					   A00 => S12(5),
					   B00 => S13(4),
					   C01 => S14(4),
					   S00 => S15(4));
					   
	M85: topfa00 port map(
					   C00 => S14(4),
					   A00 => S12(6),
					   B00 => S13(5),
					   C01 => S14(5),
					   S00 => S15(5));
					   
	M86: topfa00 port map(
					   C00 => S14(5),
					   A00 => S12(7),
					   B00 => S13(6),
					   C01 => S14(6),
					   S00 => S15(6));
					   
	M87: topfa00 port map(
					   C00 => S14(6),
					   A00 => S11(7),
					   B00 => S13(7),
					   C01 => S14(7),
					   S00 => S15(7));
					   
	M88: and00 port map(
						Aa => Am(0),
						Ba => Bm(6),
						Ya => S16(0));
						
	M89: and00 port map(
						Aa => Am(1),
						Ba => Bm(6),
						Ya => S16(1));
						
	M90: and00 port map(
						Aa => Am(2),
						Ba => Bm(6),
						Ya => S16(2));
						
	M91: and00 port map(
						Aa => Am(3),
						Ba => Bm(6),
						Ya => S16(3));
						
	M92: and00 port map(
						Aa => Am(4),
						Ba => Bm(6),
						Ya => S16(4));
						
	M93: and00 port map(
						Aa => Am(5),
						Ba => Bm(6),
						Ya => S16(5));
						
	M94: and00 port map(
						Aa => Am(6),
						Ba => Bm(6),
						Ya => S16(6));
						
	M95: and00 port map(
						Aa => Am(7),
						Ba => Bm(6),
						Ya => S16(7));
						
	M96: topfa00 port map(
					   C00 => '0',
					   A00 => S15(1),
					   B00 => S16(0),
					   C01 => S17(0),
					   S00 => S18(0));
					   
	Rm(6) <= S18(0);
	
	M97: topfa00 port map(
					   C00 => S17(0),
					   A00 => S15(2),
					   B00 => S16(1),
					   C01 => S17(1),
					   S00 => S18(1));
					   
	M98: topfa00 port map(
					   C00 => S17(1),
					   A00 => S15(3),
					   B00 => S16(2),
					   C01 => S17(2),
					   S00 => S18(2));
					   
	M99: topfa00 port map(
					   C00 => S17(2),
					   A00 => S15(4),
					   B00 => S16(3),
					   C01 => S17(3),
					   S00 => S18(3));
					   
	M100: topfa00 port map(
					   C00 => S17(3),
					   A00 => S15(5),
					   B00 => S16(4),
					   C01 => S17(4),
					   S00 => S18(4));
					   
	M101: topfa00 port map(
					   C00 => S17(4),
					   A00 => S15(6),
					   B00 => S16(5),
					   C01 => S17(5),
					   S00 => S18(5));
					   
	M102: topfa00 port map(
					   C00 => S17(5),
					   A00 => S15(7),
					   B00 => S16(6),
					   C01 => S17(6),
					   S00 => S18(6));
					   
	M103: topfa00 port map(
					   C00 => S17(6),
					   A00 => S14(7),
					   B00 => S16(7),
					   C01 => S17(7),
					   S00 => S18(7));
					   
	M104: and00 port map(
						Aa => Am(0),
						Ba => Bm(7),
						Ya => S19(0));  
						
	M105: and00 port map(
						Aa => Am(1),
						Ba => Bm(7),
						Ya => S19(1)); 
						
	M106: and00 port map(
						Aa => Am(2),
						Ba => Bm(7),
						Ya => S19(2)); 
						
	M107: and00 port map(
						Aa => Am(3),
						Ba => Bm(7),
						Ya => S19(3)); 
						
	M108: and00 port map(
						Aa => Am(4),
						Ba => Bm(7),
						Ya => S19(4)); 
						
	M109: and00 port map(
						Aa => Am(5),
						Ba => Bm(7),
						Ya => S19(5)); 
						
	M110: and00 port map(
						Aa => Am(6),
						Ba => Bm(7),
						Ya => S19(6)); 
						
	M111: and00 port map(
						Aa => Am(7),
						Ba => Bm(7),
						Ya => S19(7)); 				   
						
	M112: topfa00 port map(
					   C00 => '0',
					   A00 => S18(1),
					   B00 => S19(0),
					   C01 => S20(0),
					   S00 => Rm(7));
	
	M113: topfa00 port map(
					   C00 => S20(0),
					   A00 => S18(2),
					   B00 => S19(1),
					   C01 => S20(1),
					   S00 => Rm(8));
					   
	M114: topfa00 port map(
					   C00 => S20(1),
					   A00 => S18(3),
					   B00 => S19(2),
					   C01 => S20(2),
					   S00 => Rm(9));
					   
	M115: topfa00 port map(
					   C00 => S20(2),
					   A00 => S18(4),
					   B00 => S19(3),
					   C01 => S20(3),
					   S00 => Rm(10));
					   
	M116: topfa00 port map(
					   C00 => S20(3),
					   A00 => S18(5),
					   B00 => S19(4),
					   C01 => S20(4),
					   S00 => Rm(11));
					   
	M117: topfa00 port map(
					   C00 => S20(4),
					   A00 => S18(6),
					   B00 => S19(5),
					   C01 => S20(5),
					   S00 => Rm(12));
					   
	M118: topfa00 port map(
					   C00 => S20(5),
					   A00 => S18(7),
					   B00 => S19(6),
					   C01 => S20(6),
					   S00 => Rm(13));
					   
	M119: topfa00 port map(
					   C00 => S20(6),
					   A00 => S17(7),
					   B00 => S19(7),
					   C01 => S20(7),
					   S00 => Rm(14));
					   
	Rm(15) <= S20(7);

end topmult4bit0;