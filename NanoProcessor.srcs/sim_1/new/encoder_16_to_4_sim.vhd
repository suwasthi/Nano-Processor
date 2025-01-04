----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder_16_to_4_sim is

end encoder_16_to_4_sim;

architecture Behavioral of encoder_16_to_4_sim is
    COMPONENT encoder_16_to_4
        port(S:in std_logic_vector(15 downto 0);
            A:out std_logic_vector(3 downto 0));
     END COMPONENT;
     SIGNAL s:std_logic_vector(15 downto 0);
     signal a:std_logic_vector(3 downto 0);
     --220618A  11 0101 1101 1100 1010
     --220623J  11 0101 1101 1100 1111
     --220411H  11 0101 1100 1111 1011
     --220614H  11 0101 1101 1100 0110
    
    begin
        UUT :encoder_16_to_4 PORT MAP(
            S=>s,
            A=>a);
         process
         begin
         s<="0000001000000000";
         wait for 100 ns;
         s<="0001000000000000";
         wait for 100ns;
         s<="0010000000000000";
         wait for 100 ns;
         s<="0000000000100000";
         wait for 100ns;
         s<="1000000000000000";
         wait for 100 ns;
         s<="0000100000000000";
         wait for 100ns;
         s<="0000000000100000";
         wait;
     end process;

end Behavioral;