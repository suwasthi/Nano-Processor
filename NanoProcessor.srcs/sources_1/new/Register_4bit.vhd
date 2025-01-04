library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_4bit is
    Port (D : in STD_LOGIC_VECTOR (3 downto 0);
         EN : in STD_LOGIC; 
         Clk : in STD_LOGIC; 
         Reset : in STD_LOGIC; 
         Q : out STD_LOGIC_VECTOR (3 downto 0));
end Register_4bit;

architecture Behavioral of Register_4bit is

begin
process (Clk) begin
    if Reset = '0' then
        if (rising_edge(Clk)) then
            if EN = '1' then
                Q <= D;
            end if;
            
        end if;
    else
         Q <= (others => '0'); 
    end if;
end process;
end Behavioral;