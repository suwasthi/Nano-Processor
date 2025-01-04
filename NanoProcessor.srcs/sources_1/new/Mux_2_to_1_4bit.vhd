----------------------------------------------------------------------------------
-- Create Date: 04/13/2024 06:27:43 PM
-- Module Name: Decoder_3_to_8 - Behavioral
-- Description: 
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_2_to_1_4bit is
    Port ( --EN : in STD_LOGIC;
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0);
           D0 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0));
end Mux_2_to_1_4bit;

architecture Behavioral of Mux_2_to_1_4bit is

begin
    process(S, D0, D1)
    begin
        IF (S = '0') THEN
             Y <= D0;
        ELSE 
             Y <= D1;
        END IF;
    end process;

end Behavioral;