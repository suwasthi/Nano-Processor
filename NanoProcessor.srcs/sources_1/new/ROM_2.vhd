---------------------------------------------------------------------------------- 
-- Create Date: 04/23/2024 11:22:29 AM
-- Module Name: ROM_2 - Behavioral
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------

library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.NUMERIC_STD.ALL; 

entity ROM_2 is
    Port ( MemSel : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end ROM_2; 

architecture Behavioral of ROM_2 is
    
type rom_type is array (0 to 3) of std_logic_vector(11 downto 0);
    
signal ROM_2 : rom_type :=(
         --Using new instruction MUL Ra, Rb  =  Ra <- Ra*Rb
         -- Formatting instruction as 00RaRaRaRbRbRb0001
         --Since this is a 4 bit processor it can only give 4 bit output 
         --Therefore 2x2 multiplier is used
         
         --Another program to multiply 2 and 3        
             "101110000011", -- MOVI R7,3 --line->0
             "100100000010", -- MOVI R2,2
             "001110100001", -- MUL R7,R2
             "110000000011" -- JZR R0,3  --line->3  --End instructions
            );

begin
    Instruction <= ROM_2(to_integer(unsigned(MemSel)));

end Behavioral;