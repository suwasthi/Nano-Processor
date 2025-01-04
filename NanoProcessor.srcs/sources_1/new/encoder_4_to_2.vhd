----------------------------------------------------------------------------------
-- Create Date: 11.04.2024 19:06:36 
-- Module Name: encoder_4_to_2 - Behavioral
-- Description: Design Source File
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder_4_to_2 is
    Port ( S : in STD_LOGIC_VECTOR (3 downto 0);
           A : out STD_LOGIC_VECTOR(1 downto 0));
end encoder_4_to_2;

architecture Behavioral of encoder_4_to_2 is

begin
    A(0)<=(NOT(S(3)) AND S(2) AND NOT(S(1)) AND NOT(S(0))) OR (S(3) AND NOT(S(2)) AND NOT(S(1)) AND NOT(S(0)));
    A(1)<=(NOT(S(3)) AND NOT(S(2)) AND S(1) AND NOT(S(0))) OR (S(3) AND NOT(S(2)) AND NOT(S(1)) AND NOT(S(0)));

end Behavioral;