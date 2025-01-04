----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.04.2024 13:46:15
-- Design Name: 
-- Module Name: TB_Slow_Clk - Behavioral
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

entity TB_Slow_Clk is
--  Port ( );
end TB_Slow_Clk;

architecture Behavioral of TB_Slow_Clk is

component Slow_Clk
    port (  Clk_in : in STD_LOGIC;
            Clk_out : out STD_LOGIC);
end component;

signal Clk_in : STD_LOGIC:='0';
signal Clk_out : STD_LOGIC;

begin
UUT: Slow_Clk
    port map(
        Clk_in=>Clk_in,
        Clk_out=>Clk_out );
process
begin
    wait for 20ns;
    Clk_in <= NOT(Clk_in);
end process;
end Behavioral;