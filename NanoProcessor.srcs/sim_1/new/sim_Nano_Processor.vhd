----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.04.2024 13:43:01
-- Design Name: 
-- Module Name: sim_Nano_Processor - Behavioral
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

entity sim_Nano_Processor is
-- Port ( );
end sim_Nano_Processor;
architecture Behavioral of sim_Nano_Processor is

component Nano_Processor
    Port (  Clk : in STD_LOGIC;
            Reset : in STD_LOGIC;
            Overflow : out STD_LOGIC;
            Zero : out STD_LOGIC;
            R7_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Overflow,Zero:std_logic;
signal Clk,Reset:std_logic:='1';
signal R7_out :STD_LOGIC_VECTOR (3 downto 0);

begin
UUT:Nano_processor
    port map(
        Clk=>Clk,
        Reset=>Reset,
        OverFlow=>Overflow,
        Zero=>Zero,
        R7_out=>R7_out
    );

process
begin
    wait for 1ns;
    Clk<=not(Clk);
end process;

process
begin
    wait for 200ns;
    Reset<='1';
    wait for 20ns;
    Reset<='0';
    wait for 500ns;
    Reset<='1';
    wait for 20ns;
    Reset<='0';
    wait for 1500ns;
    Reset<='1';
    wait for 20ns;
    Reset<='0';
    wait;
end process;
end Behavioral;