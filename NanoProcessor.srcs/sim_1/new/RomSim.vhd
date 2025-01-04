----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.04.2024 13:57:03
-- Design Name: 
-- Module Name: RomSim - Behavioral
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

entity RomSim is
-- Port ( );
end RomSim;
architecture Behavioral of RomSim is
component ProgramROM
    port(
        MemSel : in STD_LOGIC_VECTOR (2 downto 0);
        Instruction : out STD_LOGIC_VECTOR (11 downto 0)
    );
end component;
Signal MemSel : STD_LOGIC_VECTOR(2 downto 0);
Signal Instruction : STD_LOGIC_VECTOR(11 downto 0);

begin
UUT : ProgramROM 
    port map(
        MemSel => MemSel,
        Instruction => Instruction
    );
process
--220618A  11 0101 1101 1100 1010
--220623J  11 0101 1101 1100 1111
--220411H  11 0101 1100 1111 1011
--220614H  11 0101 1101 1100 0110
begin
    wait for 10ns;
    MemSel <= "010";
    wait for 100ns;
    MemSel <= "001";
    wait for 100ns;
    MemSel <= "111";
    wait for 100ns;
    MemSel <= "001";
    wait for 100ns;
    MemSel <= "011";
    wait for 100ns;
    MemSel<="111";
    Wait for 100ns;
    MemSel<="110";
    Wait for 100ns;
    MemSel<="000";
    wait;
end process;
end Behavioral;
