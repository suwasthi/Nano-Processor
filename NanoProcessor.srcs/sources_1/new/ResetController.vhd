----------------------------------------------------------------------------------
-- Module Name: ResetController - Behavioral
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ResetController is
    Port ( ResIn : in STD_LOGIC;
    Clk : in STD_LOGIC;
    ResOut : out STD_LOGIC);
end ResetController;

architecture Behavioral of ResetController is

signal PreReset:std_logic:='1';

begin
    process (Clk)
    begin
        if (rising_edge(Clk)) then
            if ResIn='1' then
                ResOut<='1';
                PreReset<='0';
            elsif PreReset='1' then
                ResOut<='1';
            else
                ResOut<='0';
            end if;
        end if;
    end process;
end Behavioral;
