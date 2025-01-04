library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplier_2bit_Sim is
--  Port ( );
end Multiplier_2bit_Sim;

architecture Behavioral of Multiplier_2bit_Sim is

component Multiplier_2bit
    Port( A : in std_logic_vector(1 downto 0);
          B : in std_logic_vector(1 downto 0);
          Y : out std_logic_vector(3 downto 0);
          Zero : out STD_LOGIC);
end component;

signal A : std_logic_vector(1 downto 0);
signal B : std_logic_vector(1 downto 0);
signal Y : std_logic_vector(3 downto 0);
signal Zero : STD_LOGIC;

begin
    UUT: Multiplier_2bit
        Port map(
            A => A,
            B => B,
            Y => Y,
            Zero => Zero);
            
    process
    begin
         --220618A  11 0101 1101 1100 1010
         --220623J  11 0101 1101 1100 1111
         --220411H  11 0101 1100 1111 1011
         --220614H  11 0101 1101 1100 0110
         
        A <= "10";
        B <= "10";
        Wait for 200ns;
        A <= "11";
        B <= "11";
        Wait for 200ns;
        A <= "10";
        B <= "11";
        Wait for 200ns;
        A <= "01";
        B <= "10";
        Wait;
    end process;
end Behavioral;