----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.04.2024 14:35:20
-- Design Name: 
-- Module Name: TB_Nano_Processor_with_7SegOut_final - Behavioral
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

entity TB_Nano_Processor_with_7SegOut_final is
--  Port ( );
end TB_Nano_Processor_with_7SegOut_final;

architecture Behavioral of TB_Nano_Processor_with_7SegOut_final is
component Nano_Processor_with_7SegOut_final
    Port ( Clk : in STD_LOGIC;
    Reset : in STD_LOGIC;
    Overflow : out STD_LOGIC;
    Zero : out STD_LOGIC;
    LED_out : out STD_LOGIC_VECTOR (3 downto 0);
    Anode_7Seg : out STD_LOGIC_VECTOR (3 downto 0);
    Cathode_7Seg : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal Clk : std_logic := '0';
signal Reset : std_logic;
signal Overflow,Zero: std_logic;
signal LED_out,Anode_7Seg : STD_LOGIC_VECTOR (3 downto 0);
signal Cathode_7Seg :STD_LOGIC_VECTOR (6 downto 0);

begin
    UUT:Nano_Processor_with_7SegOut_final
    port map(
    Clk=>Clk,
    Reset=>Reset,
    OverFlow=>Overflow,
    Zero=>Zero,
    LED_out => LED_out,
    Anode_7Seg => Anode_7Seg,
    Cathode_7Seg => Cathode_7Seg);
    
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
    wait for 1500ns;
    wait for 200ns;
    Reset<='1';
    wait for 10ns;
    Reset<='0';
    wait;
end process;
end Behavioral;