library ieee;
use ieee.std_logic_1164.all;

entity topo is
	port(
		  CLOCK_50: in std_logic;
		  HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7: out std_logic_vector(6 downto 0)
		 );
end topo;

architecture ports of topo is

component display is
port(	clock50: in std_logic;
		outp: out std_logic_vector(3 downto 0)
	  );
end component;

component decod7seg is
port (In_4: in std_logic_vector (3 downto 0);
		Out_7: out std_logic_vector (6 downto 0)
		);
end component;

signal In_4: std_logic_vector(3 downto 0);
begin

L0:  display port map (CLOCK_50,In_4);
L1:	decod7seg	port map (In_4, HEX0);
HEX1 <= "1111111";
HEX2 <= "1111111";
HEX3 <= "1111111";
HEX4 <= "1111111";
HEX5 <= "1111111";
HEX6 <= "1111111";
HEX7 <= "1111111";
end ports;
