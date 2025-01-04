----------------------------------------------------------------------------------
-- Create Date: 04/24/2024 08:44:13 PM
-- Module Name: Add_Sub_Mul_Unit - Behavioral
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Add_Sub_Mul_Unit is
    Port (   A : in STD_LOGIC_VECTOR (3 downto 0);
             B : in STD_LOGIC_VECTOR (3 downto 0);
             Math_Sel : in STD_LOGIC;         --select Add_Sub_4bit and Multiplier_2bit
             Sub_Sel_in : in STD_LOGIC;          --only for Add_Sub_4bit
             S : out STD_LOGIC_VECTOR (3 downto 0);
             Zero_out : out std_logic;
             Overflow_out :out STD_LOGIC); 
end Add_Sub_Mul_Unit;

architecture Behavioral of Add_Sub_Mul_Unit is

component Add_Sub_4bit
    port( A : in STD_LOGIC_VECTOR (3 downto 0);
        B : in STD_LOGIC_VECTOR (3 downto 0);
        Sub_Sel : in STD_LOGIC;
        S : out STD_LOGIC_VECTOR (3 downto 0);
        Zero : out std_logic;
        Overflow :out STD_LOGIC);       
end component;

--Since this is a 4 bit processor it can only give 4 bit output 
--Therefore 2x2 multiplier is used
component Multiplier_2bit    
    port( A : in STD_LOGIC_VECTOR (1 downto 0);
          B : in STD_LOGIC_VECTOR (1 downto 0);
          Y : out STD_LOGIC_VECTOR (3 downto 0);
          Zero : out STD_LOGIC);
end component;

component MUX_2_to_1_4 
        port (
            D0, D1 : in STD_LOGIC_VECTOR (3 downto 0);
            S : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR (3 downto 0)
        );
end component;

signal Out_Add_Sub : std_logic_vector(3 downto 0);
signal Out_Multiplier : std_logic_vector(3 downto 0);
signal Mux_Out : std_logic_vector(3 downto 0);
signal Overflow_Add, Zero_Add, Zero_Mul : std_logic;

  
  
begin

  Add_Sub_4bit_0: Add_Sub_4bit
      port map(
        A => A,
        B => B,
        Sub_Sel => Sub_Sel_in,
        S => Out_Add_Sub,
        Zero => Zero_Add,
        Overflow => Overflow_Add
      );

    Multiplier_2bit_0: Multiplier_2bit 
        port map(
        A => A(1 downto 0),
        B => B(1 downto 0),
        Y => Out_Multiplier,
        Zero => Zero_Mul
    );

    MUX_2_to_1_4_0: MUX_2_to_1_4 
          port map (
              D0 => Out_Add_Sub,  
              D1 => Out_Multiplier,
              S => Math_Sel,      -- Select Add/Sub or Multiply
              Y => Mux_Out 
          );
  
      
      S <= Mux_Out;
      Zero_out <= Zero_Add OR Zero_Mul;
      Overflow_out <= Overflow_Add;
  
  end Behavioral;