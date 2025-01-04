----------------------------------------------------------------------------------
-- Create Date: 28.04.2024 14:37:14
-- Module Name: Out_controll_7seg_final - Behavioral
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Out_controll_7seg_final is
    Port ( Clk : in STD_LOGIC;
    R7_out : in STD_LOGIC_VECTOR (3 downto 0);
    Anode_out : out STD_LOGIC_VECTOR (3 downto 0);
    Cathode_out : out STD_LOGIC_VECTOR (6 downto 0));
end Out_controll_7seg_final;

architecture Behavioral of Out_controll_7seg_final is

component SlowClk_7seg
    Generic (count_max:integer:= 15000000); --15 million
    Port ( Clk_in : in STD_LOGIC;
        Clk_out : out STD_LOGIC);
end component;

component LUT_16_7
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
    data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal Clk_out_7seg,MSB_R7out:std_logic;
signal S_7seg:std_logic_vector(6 downto 0);

begin
    SlowClk_7seg_0:SlowClk_7seg
        Generic map(count_max => 5) --for simulation
        port map(
        Clk_in=>Clk,
        Clk_out=>Clk_out_7seg );
    LUT_16_7_0:LUT_16_7
        port map(
        address=>R7_out,
        data=>S_7Seg );

    process(S_7Seg)
    begin
        Anode_out<="1110";
        Cathode_out<=S_7Seg;
    end process;
end Behavioral;
