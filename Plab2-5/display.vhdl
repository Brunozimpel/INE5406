library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display is
port(	clock50, enable: in std_logic;
	outp0,outp1,outp2,outp3,outp4,outp5,outp6,outp7: out std_logic_vector(2 downto 0)
	  );
end entity;

architecture arch of display is 
signal out_sig0: integer := 7;
signal out_sig1: integer := 6;
signal out_sig2: integer := 5;
signal out_sig3: integer := 4;
signal out_sig4: integer := 3;
signal out_sig5: integer := 2;
signal out_sig6: integer := 1;
signal out_sig7: integer := 0;
begin 

outp0 <= std_logic_vector (to_unsigned(out_sig0,3));
outp1 <= std_logic_vector (to_unsigned(out_sig1,3));
outp2 <= std_logic_vector (to_unsigned(out_sig2,3));
outp3 <= std_logic_vector (to_unsigned(out_sig3,3));
outp4 <= std_logic_vector (to_unsigned(out_sig4,3));
outp5 <= std_logic_vector (to_unsigned(out_sig5,3));
outp6 <= std_logic_vector (to_unsigned(out_sig6,3));
outp7 <= std_logic_vector (to_unsigned(out_sig7,3));

process(clock50)
	begin
		if clock50'event and clock50 = '1' and enable = '1' then
			out_sig0 <= out_sig0 + 1;
			out_sig1 <= out_sig1 + 1;
			out_sig2 <= out_sig2 + 1;
			out_sig3 <= out_sig3 + 1;
			out_sig4 <= out_sig4 + 1;
			out_sig5 <= out_sig5 + 1;
			out_sig6 <= out_sig6 + 1;
			out_sig7 <= out_sig7 + 1;
			
			if out_sig0 = 7 then
				out_sig0 <= 0;
			end if;
			if out_sig1 = 7 then
				out_sig1 <= 0;
			end if;
			if out_sig2 = 7 then
				out_sig2 <= 0;
			end if;
			if out_sig3 = 7 then
				out_sig3 <= 0;
			end if;
			if out_sig4 = 7 then
				out_sig4 <= 0;
			end if;
			if out_sig5 = 7 then
				out_sig5 <= 0;
			end if;
			if out_sig6 = 7 then
				out_sig6 <= 0;
			end if;
			if out_sig7 = 7 then
				out_sig7 <= 0;
			end if;
		end if;	
	end process;
end arch;
