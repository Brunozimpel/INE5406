library ieee;
use ieee.std_logic_1164.all;

 entity part1_control_unit is
 port(Run,Resetn: in std_logic;
		Counter: in std_logic_vector(1 downto 0);
		IR: in std_logic_vector(8 downto 0);
		R0out,R1out,R2out,R3out,R4out,R5out,R6out,R7out: out std_logic;
		R0in,R1in,R2in,R3in,R4in,R5in,R6in,R7in: out std_logic;
		Gout,DINout: out std_logic;
		Gin: out std_logic;
		Addsub: out std_logic;
		Ain: out std_logic;
		IRin: out std_logic;
		Clear: out std_logic;
		Done: out std_logic

 );
 
 architecture arch of part1_control_unit is
 
 end arch;
