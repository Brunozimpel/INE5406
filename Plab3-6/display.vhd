library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display is
	port(	enable: in std_logic;
			clock: in std_logic;
			reset: in std_logic;
			adress_out: out std_logic_vector(4 downto 0)
	);
end display;

architecture arch of display is
type state is (S0,S1,S2);
signal EA,PE: state;
signal adress_sig: std_logic_vector(4 downto 0):="00000";
signal maior: std_logic;
begin
-- registrador de estados
	process(clock,reset)
	begin
		if reset = '1' then
			EA <= S0;
			--adress_sig <= "00000";
		elsif rising_edge(clock) then
			EA <= PE;
		end if;
	end process;
	
-- logica de proximo estado
	process(enable, EA)
	begin
		case EA is
			when S0 =>
				adress_sig <= "00000";
				if enable = '1' then
					PE <= S1;
				end if;
			when S1 =>
				adress_sig <= std_logic_vector(unsigned(adress_sig)+1);
				PE <= S2;
			when S2 =>
				if enable = '1' then
					if (unsigned(adress_sig)>31) then
						PE <= S0;
					else	
						PE <= S1;
					end if;
				end if;
		end case;
	end process;

--logica de saída
	adress_out <= adress_sig;

end arch;
