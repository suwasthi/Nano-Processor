----------------------------------------------------------------------------------
-- Module Name: Program_Counter - Behavioral
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Program_Counter is
    Port ( Clk : in STD_LOGIC;
    Reset : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR (2 downto 0);
    Q : out STD_LOGIC_VECTOR (2 downto 0));
end Program_Counter;

architecture Behavioral of Program_Counter is

begin
    process (Clk)
    begin
        if (rising_edge(Clk)) then
            if Reset = '1' then
                Q <= "000";
            else
                Q <= D;
                --Qbar <= not D;
            end if;
        end if;
    end process;
end Behavioral;