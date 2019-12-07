library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity enable is
port(	clock50: in std_logic;
		enable: out std_logic
	  );
end entity;

architecture arch of enable is 
signal controle: integer:= 0;
begin 

process(clock50)
	begin
		if clock50'event and clock50 = '1' then
			controle <= controle + 1;
			if controle = 49999999 then
				enable <= '1';
				controle <= 0;
			else
				enable <= '0';
			end if;
		end if;	
end process;

end arch;
