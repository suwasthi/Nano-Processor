-- Create Date: 06.04.2024 21:47:55: 
-- Module Name: HA - Behavioral 
-- Description: Design source file
-- Revision 0.01 - File Created 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S: out STD_LOGIC;
           C : out STD_LOGIC);
end HA;

architecture Behavioral of HA is

begin
    S <=A XOR B;
    C<=A AND B;

end Behavioral;