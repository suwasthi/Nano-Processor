----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.04.2024 13:50:39
-- Design Name: 
-- Module Name: TB_Program_Counter - Behavioral
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


entity TB_Program_Counter is
-- Port ( );
end TB_Program_Counter;
architecture Behavioral of TB_Program_Counter is

component Program_Counter
    Port (  Clk : in STD_LOGIC;
            Reset : in STD_LOGIC;
            D : in STD_LOGIC_VECTOR (2 downto 0);
            Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal Q,D :STD_LOGIC_VECTOR (2 downto 0);
signal Res,Clk:std_logic:='0';

begin
UUT:Program_Counter
    port map(
        Clk=>Clk,
        Reset=>Res,
        D=>D,
        Q=>Q);

process
begin
--220618A  11 0101 1101 1100 1010
--220623J  11 0101 1101 1100 1111
--220411H  11 0101 1100 1111 1011
--220614H  11 0101 1101 1100 0110
    wait for 40ns;
    Clk<=not(Clk);
end process;

process
begin
    Res<='1';
    wait for 50ns;
    D<="010";
    wait for 50ns;
    D<="001";
    wait for 50ns;
    D<="111";
    wait for 50ns;
    Res<='0';
    wait for 100ns;
    D<="001";
    wait for 100ns;
    D<="011";
    wait for 100ns;
    D<="111";
    wait for 100ns;
    D<="110";
    wait for 100ns;
    D<="001";
    wait;
end process;
end Behavioral;