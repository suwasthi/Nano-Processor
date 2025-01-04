----------------------------------------------------------------------------------
-- Create Date: 20.04.2024 14:40:51
-- Module Name: SlowClk_7seg - Behavioral
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SlowClk_7seg is
    Generic (count_max:integer:= 15000000); --100000000
    Port ( Clk_in : in STD_LOGIC;
    Clk_out : out STD_LOGIC);
end SlowClk_7seg;

architecture Behavioral of SlowClk_7seg is

signal count : integer :=1;
signal clk_status:std_logic:='0';

begin
process (clk_in) begin
    if(rising_edge(clk_in)) then
        count<=count+1;
        if (count=count_max) then
            clk_status<= not(clk_status);
            clk_out<= clk_status;
            count<=1;
        end if;
    end if;
end process;
end Behavioral;
