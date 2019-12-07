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

component display is
	port(	clock: in std_logic;
			reset: in std_logic;
			adress_out: out std_logic_vector(4 downto 0)
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

component mux is
	port (wraddress: in std_logic_vector(4 downto 0);
			rdaddress: in std_logic_vector(4 downto 0);
			wren: in std_logic;
			address: out std_logic_vector(4 downto 0)
			);
end component;

component decod7seg is
port (C: in std_logic_vector (3 downto 0);
		F: out std_logic_vector (6 downto 0)
		);
end component;


signal outp: std_logic_vector(7 downto 0);
signal display_address: std_logic_vector(4 downto 0);
signal mux_address: std_logic_vector(4 downto 0);

begin

L1: display port map(CLOCK_50,KEY(0),display_address);
L2: mux port map(SW(15 downto 11), display_address, SW(17), mux_address);
L3: ramlpm port map (mux_address, CLOCK_50, SW(7 downto 0) ,SW(17),outp);
L4: decod7seg port map (("000"&SW(15)),HEX7);
L5: decod7seg port map (SW(14 downto 11),HEX6);
L6: decod7seg port map (SW(7 downto 4),HEX5);
L7: decod7seg port map (SW(3 downto 0),HEX4);
L8: decod7seg port map (outp(7 downto 4),HEX1);
L9: decod7seg port map (outp(3 downto 0),HEX0);
L10: decod7seg port map(("000"&mux_address(4)),HEX3);
L11: decod7seg port map(mux_address(3 downto 0),HEX2);
LEDG(0) <= SW(17);
end ports;
