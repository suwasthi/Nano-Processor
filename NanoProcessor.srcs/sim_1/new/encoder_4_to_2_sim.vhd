----------------------------------------------------------------------------------
-- Create Date: 11.04.2024 19:34:53
-- Module Name: encoder_4_to_2_Sim
-- Description: Simulation Source File
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder_4_to_2_sim is
end encoder_4_to_2_sim;

architecture Behavioral of encoder_4_to_2_sim is
    COMPONENT encoder_4_to_2
        port(S:in std_logic_vector(3 downto 0);
            A:out std_logic_vector(1 downto 0));
     END COMPONENT;
     SIGNAL s:std_logic_vector(3 downto 0);
     signal a:std_logic_vector(1 downto 0);
          --220618A  11 01 01 11 01 11 00 10 10
          --220623J  11 01 01 11 01 11 00 11 11
          --220411H  11 01 01 11 00 11 11 10 11
          --220614H  11 01 01 11 01 11 00 01 10
         
    begin
        UUT :encoder_4_to_2 PORT MAP(
            S=>s,
            A=>a);
      process
             begin
             s<="0010";
             wait for 100 ns;
             s<="0100";
             wait for 100ns;
             s<="0001";
             wait for 100 ns;
             s<="1000";
             wait;
         end process;

end Behavioral;