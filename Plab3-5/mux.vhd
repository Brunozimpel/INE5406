library IEEE; 
use IEEE.std_logic_1164.all; 

entity mux is
	port (wraddress: in std_logic_vector(4 downto 0);
			rdaddress: in std_logic_vector(4 downto 0);
			wren: in std_logic;
			address: out std_logic_vector(4 downto 0)
			);
end mux;

architecture comportamental of mux is
	begin
		address <= rdaddress when wren = '0' else 
									wraddress;
end comportamental;								
