library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std;

entity topo is
	port(
		  SW: in std_logic_vector(17 downto 0);
		  KEY: in std_logic_vector(1 downto 0);
		  LEDG: out std_logic_vector(1 downto 0);
		  HEX0,HEX1,HEX4,HEX5,HEX6,HEX7: out std_logic_vector(6 downto 0);
		  HEX3,HEX2: out std_logic_vector(6 downto 0)
		 );
end topo;

architecture ports of topo is

Component ramlpm is
	PORT
	(
		Address		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		Clock			: IN STD_LOGIC  := '1';
		DataIn		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		Writee		: IN STD_LOGIC ;
		DataOut		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
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

signal outp: std_logic_vector(7 downto 0);
begin

L0: ramlpm port map (SW(15 downto 11),Key(0),SW(7 downto 0),SW(17),outp(7 downto 0));

L1: decod7seghex7 port map (SW(15),HEX7);
L2: decod7seg port map (SW(14 downto 11),HEX6);
L3: decod7seg port map (SW(7 downto 4),HEX5);
L4: decod7seg port map (SW(3 downto 0),HEX4);
L5: decod7seg port map (outp(7 downto 4),HEX1);
L6: decod7seg port map (outp(3 downto 0),HEX0);

HEX3 <= "1111111";
HEX2 <= "1111111";
LEDG(0) <= SW(17);
end ports;
