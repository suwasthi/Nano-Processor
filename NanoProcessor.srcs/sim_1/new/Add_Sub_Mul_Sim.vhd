

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Add_Sub_Mul_Sim is
--  Port ( );
end Add_Sub_Mul_Sim;

architecture Behavioral of Add_Sub_Mul_Sim is

component Add_Sub_Mul_Unit
    Port (   A : in STD_LOGIC_VECTOR (3 downto 0);
             B : in STD_LOGIC_VECTOR (3 downto 0);
             Math_Sel : in STD_LOGIC; 
             Sub_Sel_in : in STD_LOGIC; 
             S : out STD_LOGIC_VECTOR (3 downto 0);
             Zero_out : out std_logic;
             Overflow_out :out STD_LOGIC); 
end component;

signal A, B, S : std_logic_vector (3 downto 0);
signal Math_Sel, Sub_Sel, Zero, Overflow : std_logic;

begin
    UUT: Add_Sub_Mul_Unit
        Port map( A => A(3 downto 0),
                  B => B(3 downto 0),
                  S => S(3 downto 0),
                  Math_Sel => Math_Sel,
                  Sub_Sel_in => Sub_sel,
                  Zero_out => Zero,
                  Overflow_out => Overflow);
    
    process
    begin
         --220618A  0011 0101 1101 1100 1010
         --220623J  0011 0101 1101 1100 1111
         --220411H  0011 0101 1100 1111 1011
         --220614H  0011 0101 1101 1100 0110
         
          Math_Sel <= '0'; -- Select addition/subtraction initially
          Sub_Sel <= '0';  -- Set for addition
          A <= "1010";
          B <= "1100";
          wait for 100ns;
          A <= "1111";
          B <= "1100";
          wait for 100ns;
          A <= "1011";
          B <= "1111";
          wait for 100ns;
                  
          Math_Sel <= '1'; -- Select multiplication
          Sub_Sel <= '1';  -- Set for subtraction
          A <= "0101";
          B <= "0011";
          wait for 100ns;
          A <= "1100";
          B <= "1100";
          wait for 100ns;
          A <= "1111";
          B <= "0110";
          wait;
     end process;
end behavioral;