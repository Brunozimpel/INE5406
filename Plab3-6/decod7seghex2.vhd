library IEEE;
use IEEE.Std_Logic_1164.all;

entity decod7seghex2 is
port (C: in std_logic_vector (3 downto 0);
		sel: in std_logic;
		F: out std_logic_vector (6 downto 0)
		);
end decod7seghex2;

architecture decod_bhv of decod7seghex2 is
begin


F <= "1000000" when (C = "0000" and sel ='0') else -- 0
	  "1111001" when (C = "0001" and sel ='0') else -- 1
	  "0100100" when (C = "0010" and sel ='0') else -- 2
	  "0110000" when (C = "0011" and sel ='0') else -- 3
	  "0011001" when (C = "0100" and sel ='0') else -- 4
	  
	  "0010010" when (C = "0101" and sel ='0') else -- 5
	  "0000010" when (C = "0110" and sel ='0') else -- 6
	  "1111000" when (C = "0111" and sel ='0') else -- 7
	  "0000000" when (C = "1000" and sel ='0') else -- 8
	  "0010000" when (C = "1001" and sel ='0') else -- 9
	  
	  "0001000" when (C = "1010" and sel ='0') else -- A
	  "0000011" when (C = "1011" and sel ='0') else -- b
	  "1000110" when (C = "1100" and sel ='0') else -- C
	  "0100001" when (C = "1101" and sel ='0') else -- d
	  "0000110" when (C = "1110" and sel ='0') else -- E
	  "0001110" when (C = "1111" and sel ='0') else -- F
	  "1111111";
	  
	  end decod_bhv;
