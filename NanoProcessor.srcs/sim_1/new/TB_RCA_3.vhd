----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.04.2024 14:15:55
-- Design Name: 
-- Module Name: TB_RCA_3 - Behavioral
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

entity TB_RCA_3 is
-- Port ( );
end TB_RCA_3;
architecture Behavioral of TB_RCA_3 is

component RCA_3
    Port (  A : in STD_LOGIC_VECTOR (2 downto 0);
            --B: in STD_LOGIC_VECTOR (2 downto 0);
            S: out STD_LOGIC_VECTOR (2 downto 0);
            --C_in : in STD_LOGIC;
            C_out : out STD_LOGIC);
end component;

signal C_out:std_logic;
signal A,S :STD_LOGIC_VECTOR (2 downto 0);

begin
UUT:RCA_3
    port map(
        A=>A,
        S=>S,
        C_out=>C_out
    );
--220618A  11 0101 1101 1100 1010
--220623J  11 0101 1101 1100 1111
--220411H  11 0101 1100 1111 1011
--220614H  11 0101 1101 1100 0110
process
begin
    A<="010";
    wait for 100ns;
    A<="001";
    wait for 100ns;
    A<="111";
    wait for 100ns;
    A<="011";
    wait for 100ns;
    A<="011";
    wait for 100ns;
    A<="111";
    wait for 100ns;
end process;
end Behavioral;
