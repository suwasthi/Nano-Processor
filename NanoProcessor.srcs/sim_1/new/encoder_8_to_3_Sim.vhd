----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder_8_to_3_Sim is

end encoder_8_to_3_Sim;

architecture Behavioral of encoder_8_to_3_Sim is
    COMPONENT encoder_8_to_3
        port(S:in std_logic_vector(7 downto 0);
            A:out std_logic_vector(2 downto 0));
     END COMPONENT;
     SIGNAL s:std_logic_vector(7 downto 0);
     signal a:std_logic_vector(2 downto 0);
    --220618A  110 101 110 111 001 010
    --220623J  110 101 110 111 001 111
    --220411H  110 101 110 011 111 011
    --220614H  110 101 110 111 000 110
    begin
    UUT :encoder_8_to_3 PORT MAP(
        S=>s,
        A=>a);
     
     process
     begin
         s<="00000100";
         wait for 100 ns;
         s<="00000010";
         wait for 100ns;
         s<="10000000";
         wait for 100 ns;
         s<="01000000";
         wait for 100ns;
         s<="00100000";
          wait for 100 ns;
          s<="00001000";
          wait for 100ns;
          s<="00000001";
          wait for 100 ns;
         wait;
     end process;

end Behavioral;