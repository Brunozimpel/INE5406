library IEEE;
use IEEE.Std_Logic_1164.all;

entity decod7seghex3 is
port (C: in std_logic;
		sel: in std_logic;
		F: out std_logic_vector (6 downto 0)
		);
end decod7seghex3;

architecture decod_bhv of decod7seghex3 is
begin
F <= "1000000" when (C = '0' and sel='0') else -- 0
	  "1111001" when (C = '1' and sel='0') else -- 1
	  "1111111";
	  
	  end decod_bhv;
