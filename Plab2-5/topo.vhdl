library ieee;
use ieee.std_logic_1164.all;

entity topo is
	port(
		  CLOCK_50: in std_logic;
		  HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7: out std_logic_vector(6 downto 0)
		 );
end topo;

architecture ports of topo is

component enable is
port(	clock50: in std_logic;
	enable: out std_logic
	  );
end component;

component display is
port(	clock50, enable: in std_logic;
	outp0,outp1,outp2,outp3,outp4,outp5,outp6,outp7: out std_logic_vector(2 downto 0)
	  );
end component;

component decod7seg is
port (In_3: in std_logic_vector (2 downto 0);
      Out_7: out std_logic_vector (6 downto 0)
	);
end component;

signal out_hex7,out_hex6,out_hex5,out_hex4,out_hex3,out_hex2,out_hex1,out_hex0: std_logic_vector(2 downto 0);
signal enable1: std_logic;
begin

L0: enable port map (CLOCK_50,enable1);
L1: display port map (CLOCK_50, enable1, out_hex0,out_hex1,out_hex2,out_hex3,out_hex4,out_hex5,out_hex6,out_hex7);
L2: decod7seg port map (out_hex7,HEX7);
L3: decod7seg port map (out_hex6,HEX6);
L4: decod7seg port map (out_hex5,HEX5);
L5: decod7seg port map (out_hex4,HEX4);
L6: decod7seg port map (out_hex3,HEX3);
L7: decod7seg port map (out_hex2,HEX2);
L8: decod7seg port map (out_hex1,HEX1);
L9: decod7seg port map (out_hex0,HEX0);

end ports;
