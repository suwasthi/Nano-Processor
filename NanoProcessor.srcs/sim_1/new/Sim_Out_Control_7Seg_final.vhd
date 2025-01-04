----------------------------------------------------------------------------------
-- Module Name: Sim_Out_Control_7Seg_final - Behavioral
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sim_Out_Control_7Seg_final is
--  Port ( );
end Sim_Out_Control_7Seg_final;

architecture Behavioral of Sim_Out_Control_7Seg_final is
component Out_controll_7seg_final
    Port (  Clk : in STD_LOGIC;
            R7_out : in STD_LOGIC_VECTOR (3 downto 0);
            Anode_out : out STD_LOGIC_VECTOR (3 downto 0);
            Cathode_out : out STD_LOGIC_VECTOR (6 downto 0));
end component ;
signal Clk: std_logic := '1';
signal R7_out,Anode_out :STD_LOGIC_VECTOR (3 downto 0);
signal Cathode_out :STD_LOGIC_VECTOR (6 downto 0);

begin
UUT:Out_controll_7seg_final
    port map(
        Clk=>Clk,
        R7_out=>R7_out,
        Anode_out => Anode_out,
        Cathode_out=>Cathode_out);
        
process
begin
    wait for 1ns;
    Clk<=not(Clk);
end process;

process
begin
--220618A  11 0101 1101 1100 1010
--220623J  11 0101 1101 1100 1111
--220411H  11 0101 1100 1111 1011
--220614H  11 0101 1101 1100 0110
    wait for 100ns;
    R7_out <= "1010";
    wait for 100ns;
    R7_out <= "1100";
    wait for 100ns;
    R7_out <= "1111";
    wait for 100ns;
    R7_out <= "1100";
    wait for 100ns;
    R7_out <= "1011";
    wait for 100ns;
    R7_out <= "0110";
    wait;
end process;
end Behavioral;