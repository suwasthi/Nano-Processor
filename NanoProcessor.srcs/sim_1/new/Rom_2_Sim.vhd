----------------------------------------------------------------------------------
-- Create Date: 04/23/2024 11:52:07 AM
-- Module Name: ROM_2_Sim - Behavioral
-- Revision 0.01 - File Created 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROM_2_Sim is
--  Port ( );
end ROM_2_Sim;

architecture Behavioral of ROM_2_Sim is

component ROM_2 
     port( 
        MemSel : in STD_LOGIC_VECTOR (2 downto 0);
        Instruction : out STD_LOGIC_VECTOR (11 downto 0) 
        );
    end component; 

Signal MemSel : STD_LOGIC_VECTOR(2 downto 0);
Signal Instruction : STD_LOGIC_VECTOR(11 downto 0);

begin
    UUT : ROM_2 port map( 
    MemSel => MemSel,
    Instruction => Instruction
    );
    
    process 
    begin
        wait for 10ns;
        MemSel <= "000"; 
        wait for 100ns; 
        MemSel <= "001"; 
        wait for 100ns; 
        MemSel <= "010"; 
        wait for 100ns; 
        MemSel <= "011"; 

        wait; 
    end process; 

end Behavioral;