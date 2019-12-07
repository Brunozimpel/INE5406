library ieee;
use ieee.std_logic_1164.all;

entity decod7seg is
port (In_4: in std_logic_vector (3 downto 0);
		Out_7: out std_logic_vector (6 downto 0)
		);
end decod7seg;

architecture decod_bhv of decod7seg is
begin
Out_7 <= "1000000" when In_4 = "0000" else -- 0
			"1111001" when In_4 = "0001" else -- 1
			"0100100" when In_4 = "0010" else -- 2
			"0110000" when In_4 = "0011" else -- 3
			"0011001" when In_4 = "0100" else -- 4
			"0010010" when In_4 = "0101" else -- 5
			"0000010" when In_4 = "0110" else -- 6
			"1111100" when In_4 = "0111" else -- 7
			"0000000" when In_4 = "1000" else -- 8
			"0010000" when In_4 = "1001" else -- 9
			"1111111"; -- apagado
	  
end decod_bhv;
