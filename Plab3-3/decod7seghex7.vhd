library IEEE;
use IEEE.Std_Logic_1164.all;

entity decod7seghex7 is
port (C: in std_logic;
		F: out std_logic_vector (6 downto 0)
		);
end decod7seghex7;

architecture decod_bhv of decod7seghex7 is
begin
F <= "1000000" when C = '0' else -- 0
	  "1111001" when C = '1' else -- 1
	  "1111111";
	  
	  end decod_bhv;
