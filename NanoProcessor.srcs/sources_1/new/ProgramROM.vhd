----------------------------------------------------------------------------------
-- Module Name: ProgramROM - Behavioral
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ProgramROM is
    Port ( MemSel : in STD_LOGIC_VECTOR (2 downto 0);
    Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end ProgramROM;

architecture Behavioral of ProgramROM is

    type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
        signal ProgramROM_0 : rom_type :=(
        "100010000011", -- MOVI R1,3 --line->0
        "100110000001", -- MOVI R3,1
        "010110000000", -- NEG R3
        "001110010000", -- ADD R7,R1 --line->3
        "000010110000", -- ADD R1,R3
        "110010000111", -- JZR R1,7
        "110000000011", -- JZR R0,3
        "110000000111" -- JZR R0,7 --line->7
    );
begin
    Instruction <= ProgramROM_0(to_integer(unsigned(MemSel)));
end Behavioral;
