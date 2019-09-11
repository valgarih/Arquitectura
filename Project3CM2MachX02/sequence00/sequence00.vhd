library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

--Sequence detector for detecting the sequence "1011".
--Sequence detector for detecting the sequence "11010".
--Non overlapping type.
entity sequence00 is
	port
	(  
		clkS: in std_logic;  --clock signal
        enS: in std_logic;   --reset signal
        seq: in std_logic;    --serial bit sequence    
        detected: out std_logic  --A '1' indicates the pattern "11010" is detected in the sequence. 
     );
end sequence00;

architecture sequence0 of sequence00 is
type state_type is (A, B, C, D, E);  --Defines the type for states in the state machine
signal state: state_type := A;  --Declare the signal with the corresponding state type.
begin
	psSeq: process(clkS) 
	begin
		if(enS = '0') then     --resets state and output signal when en is asserted.
			detected <= '0';
			state <= A; 
		elsif (clkS'event and clkS = '1') then   --calculates the next state based on current state and input bit.
			case state is
				when A =>   --when the current state is A.
					detected <= '0';
					if ( seq = '1' ) then
						state <= B;
					else    
						state <= A;
					end if; 
				when B =>   --when the current state is B.
					if ( seq = '1' ) then
						state <= C;
					else    
						state <= A;
					end if; 
				when C =>   --when the current state is C.
					if ( seq = '1' ) then
						state <= B;
					else    
						state <= D;
					end if;
				when D =>   --when the current state is D.
					if ( seq = '1' ) then
						state <= E;
					else    
						state <= A;
					end if;
				when E =>   --when the current state is E.
					if ( seq = '1' ) then
						state <= B;
					else    
						state <= A;
						detected <= '1';   --Output is asserted when the pattern "1011" is found in the sequence.
					end if;
				when others => null;
			end case;	
		end if;
	end process psSeq;    
end sequence0;
