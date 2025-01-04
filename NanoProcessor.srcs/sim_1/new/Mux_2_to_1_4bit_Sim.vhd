---------------------------------------------------------------------------------- 
-- Create Date: 04/13/2024 07:38:34 PM
-- Module Name: Mux_2_to_1_4bit_Sim - Behavioral
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_2_to_1_4bit_Sim is
--  Port ( );
end Mux_2_to_1_4bit_Sim;

architecture Behavioral of Mux_2_to_1_4bit_Sim is

component MUX_2_TO_1_4bit
    Port ( 
               S : in STD_LOGIC;
               Y : out STD_LOGIC_VECTOR (3 downto 0);
               D0 : in STD_LOGIC_VECTOR (3 downto 0);
               D1 : in STD_LOGIC_VECTOR (3 downto 0));
end component;
SIGNAL D0,D1 : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL S : STD_LOGIC;
SIGNAL EN : STD_LOGIC;
SIGNAL Y : STD_LOGIC_VECTOR (3 downto 0);
begin
UUT : MUX_2_TO_1_4bit
port map (
    D0 => D0,
    D1 => D1,
    S => S,
    Y => Y
    );
process
begin
--220618A  11 0101 1101 1100 1010
--220623J  11 0101 1101 1100 1111
--220411H  11 0101 1100 1111 1011
--220614H  11 0101 1101 1100 0110
EN <= '1';
D0 <= "1010";
D1 <= "1100";
S <= '0';
WAIT FOR 100ns;
D0 <= "1111";
D1 <= "1100";
S <= '1';
WAIT FOR 100ns;
D0 <= "1011";
D1 <= "1111";
S <= '0';
WAIT FOR 100ns;
EN <= '0';
D0 <= "0110";
D1 <= "1100";
WAIT FOR 100ns;
end process;
end Behavioral;