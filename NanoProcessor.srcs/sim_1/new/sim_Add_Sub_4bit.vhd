----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.04.2024 14:12:36
-- Design Name: 
-- Module Name: sim_Add_Sub_4bit - Behavioral
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

entity sim_Add_Sub_4bit is
-- Port ( );
end sim_Add_Sub_4bit;
architecture Behavioral of sim_Add_Sub_4bit is

component Add_Sub_4bit
    Port (  A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            Sub_Sel : in STD_LOGIC;
            Zero:out std_logic;
            S : out STD_LOGIC_VECTOR (3 downto 0);
            Overflow : out STD_LOGIC;
            Negative: out std_logic);
end component;

signal A,B,S_out: std_logic_vector (3 downto 0);
signal Overflow,Sub,Zero,Negative:std_logic;

begin
UUT: Add_Sub_4bit
    PORT MAP(
        A=>A(3 downto 0),
        B=>B(3 downto 0),
        Sub_Sel=>Sub,
        zero=>Zero,
        S=>S_out(3 downto 0),
        Overflow=>Overflow,
        Negative=>Negative 
    );

process
begin
--220618A  11 0101 1101 1100 1010
--220623J  11 0101 1101 1100 1111
--220411H  11 0101 1100 1111 1011
--220614H  11 0101 1101 1100 0110
    Sub<='0'; 
    A<="1010"; 
    B<="1100"; 
    wait for 100ns;
    A<="1101"; 
    B<="0101"; 
    wait for 100ns;
    A<="1111"; 
    B<="1100"; 
    wait for 100ns;
    A<="1101"; 
    B<="0101"; 
    wait for 100ns;
    A<="1011"; 
    B<="1111";
    wait for 100ns;
    Sub<='1'; 
    A<="1100"; 
    B<="0101"; 
    wait for 100ns;
    A<="0110"; 
    B<="1100"; 
    wait for 100ns;
    A<="1101"; 
    B<="0101"; 
    wait for 100ns;
    A<="1010"; 
    B<="1100"; 
    wait for 100ns;
    A<="1101"; 
    B<="0101"; 
    wait for 100ns;
end process;
end Behavioral;
