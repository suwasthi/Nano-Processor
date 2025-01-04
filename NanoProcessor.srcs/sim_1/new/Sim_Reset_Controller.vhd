----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.04.2024 13:35:33
-- Design Name: 
-- Module Name: Sim_Reset_Controller - Behavioral
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


entity Sim_Reset_Controller is
--  Port ( );
end Sim_Reset_Controller;

architecture Behavioral of Sim_Reset_Controller is
component ResetController
    Port (  ResIn : in STD_LOGIC;
            Clk : in STD_LOGIC;
            ResOut : out STD_LOGIC);
end component;
signal ResIn,ResOut:std_logic;
signal Clk:std_logic := '0';

begin
UUT:ResetController
    port map(
        Clk=>Clk,
        ResIn=>ResIn,
        ResOut => ResOut);
        
process
begin
    wait for 1ns;
    Clk<=not(Clk);
end process;

process
begin
    ResIn <= '0';
    wait for 100ns;
    ResIn <= '1';
    wait for 100ns;
    ResIn <= '0';
    wait;
end process;
end Behavioral;
