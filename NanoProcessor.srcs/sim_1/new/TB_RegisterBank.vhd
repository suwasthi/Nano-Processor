----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.04.2024 14:09:39
-- Design Name: 
-- Module Name: TB_RegisterBank - Behavioral
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

entity TB_RegisterBank is
-- Port ( );
end TB_RegisterBank;
architecture Behavioral of TB_RegisterBank is

component RegisterBank
    Port (  Clk : in STD_LOGIC;
            Reset : in STD_LOGIC;
            D : in STD_LOGIC_VECTOR (3 downto 0);
            R0 : out STD_LOGIC_VECTOR (3 downto 0);
            R1 : out STD_LOGIC_VECTOR (3 downto 0);
            R2 : out STD_LOGIC_VECTOR (3 downto 0);
            R3 : out STD_LOGIC_VECTOR (3 downto 0);
            R4 : out STD_LOGIC_VECTOR (3 downto 0);
            R5 : out STD_LOGIC_VECTOR (3 downto 0);
            R6 : out STD_LOGIC_VECTOR (3 downto 0);
            R7 : out STD_LOGIC_VECTOR (3 downto 0);
            I : in STD_LOGIC_VECTOR (2 downto 0));
end component;

Signal I:STD_LOGIC_VECTOR (2 downto 0):="111";
Signal Clk, Res: std_logic:='0';
Signal D: STD_LOGIC_VECTOR (3 downto 0):="1111";
Signal R0, R1, R2, R3, R4, R5, R6, R7 : STD_LOGIC_VECTOR (3 downto 0);

begin
UUT: RegisterBank
    port map(
        Clk => Clk,
        Reset => Res,
        D => D,
        R0 => R0,
        R1 => R1,
        R2 => R2,
        R3 => R3,
        R4 => R4,
        R5 => R5,
        R6 => R6,
        R7 => R7,
        I => I
    );
process 
begin
    wait for 40ns;
    Clk <= Not(Clk);
    end process;
    process begin
    wait for 10ns;
    Res <= Not(Res);
    wait for 95ns;
    Res <= Not(Res);
    wait for 5ns;
    I <= "111";
    wait;
end process;
--220618A  11 0101 1101 1100 1010
--220623J  11 0101 1101 1100 1111
--220411H  11 0101 1100 1111 1011
--220614H  11 0101 1101 1100 0110
process
begin
    wait for 100ns;
    D <= "1010";
    wait for 100ns;
    D <= "1100";
    wait for 100ns;
    D <= "1111";
    wait for 100ns;
    D <= "1100";
    wait for 100ns;
    D <= "1011";
    wait for 100ns;
    D <= "1111";
    wait for 100ns;
    D <= "0110";
    wait for 100ns;
    D <= "1100";
    wait;
end process;
end Behavioral;
