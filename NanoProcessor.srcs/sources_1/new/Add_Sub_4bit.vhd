----------------------------------------------------------------------------------
-- Create Date: 30.04.2024 14:11:00
-- Module Name: Add_Sub_4bit - Behavioral
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Add_Sub_4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
    B : in STD_LOGIC_VECTOR (3 downto 0);
    Sub_Sel : in STD_LOGIC;
    Zero:out std_logic;
    S : out STD_LOGIC_VECTOR (3 downto 0);
    Overflow : out STD_LOGIC;
    Negative:out std_logic);
end Add_Sub_4bit;

architecture Behavioral of Add_Sub_4bit is
component FA port(
    A:in std_logic;
    B:in std_logic;
    C_in:in std_logic;
    S:out std_logic;
    C_out:out std_logic );
end component;

signal FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C:std_logic;
signal B0, B1, B2, B3:std_logic;
signal S1 : std_LOGIC_VECTOR (3 downto 0);
signal Overflow0, Zero0:std_logic;

begin
    B0 <= B(0) xor Sub_Sel;
    B1 <= B(1) xor Sub_Sel;
    B2 <= B(2) xor Sub_Sel;
    B3 <= B(3) xor Sub_Sel;
    
    FA_0 : FA
        port map (
        A => A(0),
        B => B0,
        C_in => Sub_Sel,
        S => S1(0),
        C_Out => FA0_C);
    FA_1 : FA
        port map (
        A => A(1),
        B => B1,
        C_in => FA0_C,
        S => S1(1),
        C_Out => FA1_C);
    FA_2 : FA
        port map (
        A => A(2),
        B => B2,
        C_in => FA1_C,
        S => S1(2),
        C_Out => FA2_C);
    FA_3 : FA
        port map (
        A => A(3),
        B => B3,
        C_in => FA2_C,
        S => S1(3),
        C_Out => FA3_C);
        
    Overflow0 <= FA2_C xor FA3_C;
    Negative <= Overflow0 xor S1(3);
    Overflow <= Overflow0;
    Zero <= not(S1(0) or S1(1) or S1(2) or S1(3) or Overflow0) ;
    S <= S1;
end Behavioral;
