

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Multiplier_2bit is
     Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
            B : in STD_LOGIC_VECTOR (1 downto 0);
            Y : out STD_LOGIC_VECTOR (3 downto 0);
            Zero : out STD_LOGIC);
end Multiplier_2bit;

architecture Behavioral of Multiplier_2bit is

component FA is
    port ( A, B, C_in : in std_logic;
           S, C_out : out std_logic);
end component;

SIGNAL b0a0, b0a1, b1a0, b1a1 :std_logic;
SIGNAL s_0_0, s_0_1, c_0_0, c_0_1 :std_logic;

begin
     FA_0_0: FA port map(
         A => b1a0,
         B => b0a1,
         C_in => '0',
         S => s_0_0,
         C_out => c_0_0 );
 
     FA_0_1: FA port map(
         A => '0',
         B => b1a1,
         C_in => c_0_0,
         S => s_0_1,
         C_out => c_0_1 );
     
b0a0 <= B(0) and A(0);
b0a1 <= B(0) and A(1);
b1a0 <= B(1) and A(0);
b1a1 <= B(1) and A(1);

Y(0) <= b0a0 ;
Y(1) <= s_0_0 ;
Y(2) <= s_0_1 ;
Y(3) <= c_0_1 ;

Zero <= not(b0a0 or s_0_0 or s_0_1 or c_0_1);
end Behavioral;