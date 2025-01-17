library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA_3 is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
    S: out STD_LOGIC_VECTOR (2 downto 0);
    C_out : out STD_LOGIC);
    end RCA_3;
architecture Behavioral of RCA_3 is
    component FA
    port (
    A: in std_logic;
    B: in std_logic;
    C_in: in std_logic;
    S: out std_logic;
    C_out: out std_logic);
    end component;
    signal FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C: std_logic;
    
    begin
    FA_0 : FA
        port map (
            A => A(0),
            B => '1',
            C_in => '0', -- Set to ground
            S => S(0),
            C_out => FA0_C);
    FA_1 : FA
        port map (
            A => A(1),
            B => '0',
            C_in => FA0_C,
            S => S(1),
            C_out => FA1_C);
    FA_2 : FA
        port map (
            A => A(2),
            B => '0',
            C_in => FA1_C,
            S => S(2),
            C_out => FA2_C);
            C_out <= FA2_C;
end Behavioral;