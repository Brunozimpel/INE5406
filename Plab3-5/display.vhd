library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display is
	port(	clock, reset: in std_logic;
			adress_out: out std_logic_vector(4 downto 0)
	);
end display;

architecture arch of display is
type state is (S0,S1,S2,S3,S4,S5);
signal EA,PE: state;
signal adress_sig: std_logic_vector(4 downto 0):="00000";
signal maior, enable: std_logic;
signal tempo: integer:=0;
begin
-- registrador de estados
	process(clock,reset)
	begin
		if reset = '0' then
			EA <= S0;
			--adress_sig <= "00000";
		elsif rising_edge(clock) then
			EA <= PE;
		end if;
	end process;
	
-- logica de proximo estado
	process(EA,clock,adress_sig)
	begin
		case EA is
			when S0 =>
				PE <= S1;
			when S1 =>
				PE <= S2;
			when S2 =>
				PE <= S3;
			when S3 =>
				if enable = '1'then
					PE <= S4;
				else
					PE <= S2;
				end if;
			when S4 =>
				PE <= S5;
			when S5 =>
				if maior = '1' then
					PE <= S0;
				else
					PE <= S1;
				end if;
		end case;
	end process;
	
--logica da FSM
	process(EA)
	begin
	enable <= '0';
	maior <= '0';	
		case EA is
			when S0 =>
				adress_sig <= "00000";
			when S1 =>
				tempo <= 0;
			when S2 =>
				tempo <= tempo + 1;
			when S3 =>
				if tempo = 3 then
					enable <= '1';
				end if;
			when S4 =>
				adress_sig <= std_logic_vector(unsigned(adress_sig)+1);
				adress_out <= adress_sig;
			when S5 =>
				if (unsigned(adress_sig)>31) then
					maior <= '1';
				end if;
		end case;
		adress_out <= adress_sig;
	end process;
end arch;
