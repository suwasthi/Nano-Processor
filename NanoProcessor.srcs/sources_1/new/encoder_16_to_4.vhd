----------------------------------------------------------------------------------
-- Create Date: 11.04.2024 19:34:53
-- Design Name: 
-- Module Name: encoder_16_to_4 - Behavioral
-- Description: 
-- Revision 0.01 - File Created 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder_16_to_4 is
    Port ( S : in STD_LOGIC_VECTOR (15 downto 0);
           A : out STD_LOGIC_VECTOR(3 downto 0));
end encoder_16_to_4;

architecture Behavioral of encoder_16_to_4 is

begin
    A<="0000" when S(0)='1' else
    "0001" when S(1)='1' else
    "0010" when S(2)='1' else
    "0011" when S(3)='1' else
    "0100" when S(4)='1' else
    "0101" when S(5)='1' else
    "0110" when S(6)='1' else
    "0111" when S(7)='1' else
    "1000" when S(8)='1' else
    "1001" when S(9)='1' else
    "1010" when S(10)='1' else
    "1011" when S(11)='1' else
    "1100" when S(12)='1' else
    "1101" when S(13)='1' else
    "1110" when S(14)='1' else
    "1111" when S(15)='1' else
    "XXXX";

end Behavioral;