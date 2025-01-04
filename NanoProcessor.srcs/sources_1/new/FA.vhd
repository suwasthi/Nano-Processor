----------------------------------------------------------------------------------
-- Create Date: 06.04.2024 22:04:36: 
-- Module Name: FA - Behavioral 
-- Description: Design Source File
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end FA;

architecture Behavioral of FA is
    COMPONENT HA
    port(A,B:in std_logic;
        C,S:out std_logic);
    END COMPONENT;
    SIGNAL HA0_C,HA0_S,HA1_C,HA1_S:std_logic;
begin
    HA0:HA
        PORT MAP(
                A=>A,
                B=>B,
                S=>HA0_S,
                C=>HA0_C);
     HA1:HA
        PORT MAP(
                A=>HA0_S,
                B=>C_in,
                S=>HA1_S,
                C=>HA1_C);
    S<=HA1_S;
    C_out<=HA0_C OR HA1_C;
    

end Behavioral;