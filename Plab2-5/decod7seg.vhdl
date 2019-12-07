library ieee;
use ieee.std_logic_1164.all;

entity decod7seg is
port (In_3: in std_logic_vector (2 downto 0);
		Out_7: out std_logic_vector (6 downto 0)
		);
end decod7seg;

architecture decod_bhv of decod7seg is
begin
Out_7 <= "1111111" when In_3 = "000" else -- 
			"1111111" when In_3 = "001" else -- 
			"1111111" when In_3 = "010" else -- 
			"0001001" when In_3 = "011" else -- H
			"0000110" when In_3 = "100" else -- E
			"1000111" when In_3 = "101" else -- L
			"1000111" when In_3 = "110" else -- L
			"1000000" when In_3 = "111" else -- O
			"1111111"; -- apagado
	  
end decod_bhv;
