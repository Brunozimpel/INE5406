library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display is
port(	clock50: in std_logic;
		outp: out std_logic_vector(3 downto 0)
	  );
end entity;

architecture arch of display is 
signal out_sig: integer := 0;
signal controle: integer:= 0;
begin 

outp <= std_logic_vector (to_unsigned(out_sig,4));
process(clock50)
	begin
		if clock50'event and clock50 = '1' then
			controle <= controle + 1;
			if controle = 49999999 then
				out_sig <= out_sig + 1;
				controle <= 0;
				if out_sig = 9 then
					out_sig <= 0;
				end if;
			end if;
		end if;	
end process;

end arch;
