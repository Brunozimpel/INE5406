library IEEE;
use IEEE.Std_Logic_1164.all;

entity decod_adress is
port (C: in std_logic_vector (4 downto 0);
		F: out integer RANGE 0 to 31
		);
end decod_adress;

architecture decod_bhv of decod_adress is
begin
F <= 0 when C = "00000" else 
	  1 when C = "00001" else
	  2 when C = "00010" else
	  3 when C = "00011" else
	  4 when C = "00100" else
	  
	  5 when C = "00101" else
	  6 when C = "00110" else
	  7 when C = "00111" else
	  8 when C = "01000" else
	  9 when C = "01001" else
	  
	  10 when C = "01010" else
	  11 when C = "01011" else
	  12 when C = "01100" else
	  13 when C = "01101" else
	  14 when C = "01110" else
	  
	  15 when C = "01111" else
	  16 when C = "10000" else
	  17 when C = "10001" else
	  18 when C = "10010" else
	  19 when C = "10011" else
	  
	  20 when C = "10100" else
	  21 when C = "10101" else
	  22 when C = "10110" else
	  23 when C = "10111" else
	  24 when C = "11000" else
	  
	  25 when C = "11001" else
	  26 when C = "11010" else
	  27 when C = "11011" else
	  28 when C = "11100" else
	  29 when C = "11101" else
	  
	  30 when C = "11110" else
	  31; -- 11111

end decod_bhv;
