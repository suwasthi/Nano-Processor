----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 11:56:08 AM
-- Design Name: 
-- Module Name: encoder_8_to_3 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder_8_to_3 is
    Port ( S : in STD_LOGIC_VECTOR (7 downto 0);
           A : out STD_LOGIC_VECTOR(2 downto 0));
end encoder_8_to_3;

architecture Behavioral of encoder_8_to_3 is
    COMPONENT encoder_4_to_2
        Port ( S : in STD_LOGIC_VECTOR (3 downto 0);
               A : out STD_LOGIC_VECTOR(1 downto 0)
              );
    END COMPONENT;
    
    signal I:std_logic_vector(1 downto 0);
    
    begin
        A<="000" when S(0)='1' else
        "001" when S(1)='1' else
        "010" when S(2)='1' else
        "011" when S(3)='1' else
        "100" when S(4)='1' else
        "101" when S(5)='1' else
        "110" when S(6)='1' else
        "111" when S(7)='1' else
        "XXX";
  end Behavioral;