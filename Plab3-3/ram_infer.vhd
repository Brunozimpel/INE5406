-- http://quartushelp.altera.com/14.0/mergedProjects/hdl/vhdl/vhdl_pro_ram_inferred.htm
-- Parte 3

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY ram_infer IS
   PORT
   (
      clock: IN   std_logic;
      data:  IN   std_logic_vector (7 DOWNTO 0);
      address:  IN   integer RANGE 0 to 31;   
      we:    IN   std_logic;
      q:     OUT  std_logic_vector (7 DOWNTO 0)
   );
END ram_infer;
ARCHITECTURE rtl OF ram_infer IS
   TYPE mem IS ARRAY(0 TO 31) OF std_logic_vector(7 DOWNTO 0);
   SIGNAL ram_block : mem;
BEGIN
   PROCESS (clock)
   BEGIN
      IF (clock'event AND clock = '1') THEN
         IF (we = '1') THEN
            ram_block(address) <= data;
         END IF;
         q <= ram_block(address);
      END IF;
   END PROCESS;
END rtl;
