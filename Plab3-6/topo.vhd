library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std;

entity topo is
	port(
		  CLOCK_50: in std_logic;
		  SW: in std_logic_vector(17 downto 0);
		  KEY: in std_logic_vector(1 downto 0);
		  LEDG: out std_logic_vector(1 downto 0);
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
	port(	enable: in std_logic;
			clock: in std_logic;
			reset: in std_logic;
			adress_out: out std_logic_vector(4 downto 0)
	);
end component;

component mux is
	port (wraddress: in std_logic_vector(4 downto 0);
			rdaddress: in std_logic_vector(4 downto 0);
			wren: in std_logic;
			address: out std_logic_vector(4 downto 0)
			);
end component;

Component ramlpm is
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
end component;

component decod7seg is
port (C: in std_logic_vector (3 downto 0);
		F: out std_logic_vector (6 downto 0)
		);
end component;

component decod7seghex7 is
port (C: in std_logic;
		F: out std_logic_vector (6 downto 0)
		);
end component;

component decod7seghex3 is
port (C: in std_logic;
		sel: in std_logic;
		F: out std_logic_vector (6 downto 0)
		);
end component;

component decod7seghex2 is
port (C: in std_logic_vector (3 downto 0);
		sel: in std_logic;
		F: out std_logic_vector (6 downto 0)
		);
end component;

signal outp: std_logic_vector(7 downto 0);
signal enable_sig: std_logic;
signal adress_display: std_logic_vector(4 downto 0);
signal adress_mux: std_logic_vector(4 downto 0);
begin

L0: enable port map(CLOCK_50,enable_sig);
L2: display port map(enable_sig,CLOCK_50,KEY(0),adress_display);
L1: mux port map(SW(15 downto 11), adress_display, SW(17), adress_mux);
L3: ramlpm port map (adress_mux, CLOCK_50,SW(7 downto 0),SW(17),outp);

L4: decod7seghex7 port map (SW(15),HEX7);
L5: decod7seg port map (SW(14 downto 11),HEX6);
L6: decod7seg port map (SW(7 downto 4),HEX5);
L7: decod7seg port map (SW(3 downto 0),HEX4);
L8: decod7seg port map (outp(7 downto 4),HEX1);
L9: decod7seg port map (outp(3 downto 0),HEX0);
L10: decod7seghex3 port map(adress_display(4),SW(17),HEX3);
L11: decod7seghex2 port map(adress_display(3 downto 0),SW(17),HEX2);


LEDG(0) <= SW(17);
end ports;
