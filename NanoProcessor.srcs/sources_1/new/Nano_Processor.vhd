----------------------------------------------------------------------------------
-- Module Name: Nano_Processor - Behavioral
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nano_Processor is
    Port ( Clk : in STD_LOGIC;
    Reset : in STD_LOGIC;
    --ROMSel: in STD_LOGIC;
    Overflow : out STD_LOGIC;
    Zero : out STD_LOGIC;
    R7_out : out STD_LOGIC_VECTOR (3 downto 0));
end Nano_Processor;

architecture Behavioral of Nano_Processor is
component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
    Clk_out : out STD_LOGIC);
end component;

signal SlowClk:std_logic;
signal EN : STD_LOGIC:='1';

component MUX_8_to_1_4
    Port ( R0 : in STD_LOGIC_VECTOR (3 downto 0);
    R1 : in STD_LOGIC_VECTOR (3 downto 0);
    R2 : in STD_LOGIC_VECTOR (3 downto 0);
    R3 : in STD_LOGIC_VECTOR (3 downto 0);
    R4 : in STD_LOGIC_VECTOR (3 downto 0);
    R5 : in STD_LOGIC_VECTOR (3 downto 0);
    R6 : in STD_LOGIC_VECTOR (3 downto 0);
    R7 : in STD_LOGIC_VECTOR (3 downto 0);
    S : in STD_LOGIC_VECTOR (2 downto 0);
    EN : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component RegisterBank
    Port ( Clk : in STD_LOGIC;
    Reset : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR (3 downto 0);
    R0 : out STD_LOGIC_VECTOR (3 downto 0);
    R1 : out STD_LOGIC_VECTOR (3 downto 0);
    R2 : out STD_LOGIC_VECTOR (3 downto 0);
    R3 : out STD_LOGIC_VECTOR (3 downto 0);
    R4 : out STD_LOGIC_VECTOR (3 downto 0);
    R5 : out STD_LOGIC_VECTOR (3 downto 0);
    R6 : out STD_LOGIC_VECTOR (3 downto 0);
    R7 : out STD_LOGIC_VECTOR (3 downto 0);
    I : in STD_LOGIC_VECTOR (2 downto 0));
end component;

component Add_Sub_4bit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
    B : in STD_LOGIC_VECTOR (3 downto 0);
    S : out STD_LOGIC_VECTOR (3 downto 0);
    Overflow : out STD_LOGIC;
    Sub_Sel : in STD_LOGIC;
    Zero : out STD_LOGIC
);
end component;

component RCA_3
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
    S: out STD_LOGIC_VECTOR (2 downto 0);
    C_out : out STD_LOGIC);
end component;
    
component Instruction_Decoder
    Port (
    Ins : in STD_LOGIC_VECTOR (11 downto 0);
    Reg_Che_For_Jump : in STD_LOGIC_VECTOR (3 downto 0);
    Reg_En : out STD_LOGIC_VECTOR(2 downto 0);
    Load_Im : out STD_LOGIC;
    Im_Val : out STD_LOGIC_VECTOR(3 downto 0);
    MuxA_Sel : out STD_LOGIC_VECTOR (2 downto 0);
    MuxB_Sel : out STD_LOGIC_VECTOR (2 downto 0);
    Sub_Sel : out STD_LOGIC;
    Jump : out STD_LOGIC;
    Address_Jump : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component MUX_2_to_1_3
    Port ( D0 : in STD_LOGIC_VECTOR (2 downto 0);
    D1 : in STD_LOGIC_VECTOR (2 downto 0);
    S : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component MUX_2_to_1_4
    Port ( D0 : in STD_LOGIC_VECTOR(3 downto 0);
    D1 : in STD_LOGIC_VECTOR(3 downto 0);
    S : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component ProgramROM
    Port ( MemSel : in STD_LOGIC_VECTOR (2 downto 0);
    Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component Program_Counter
    Port ( Clk : in STD_LOGIC;
    Reset : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR (2 downto 0);
    Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal Ins0:std_logic_vector(11 downto 0);
signal PC_out,J_A,A_3,M0_S,M1_S,R_E:std_logic_vector(2 downto 0);
signal I_V,M3,M1,M0,A_4:std_logic_vector(3 downto 0);
signal R0,R1,R2,R3,R4,R5,R6,R7:std_logic_vector(3 downto 0);
signal J,L_S,Sub:std_logic;
signal M2:std_logic_vector(2 downto 0);

begin
    Slow_Clk_0:Slow_Clk
        port map(
        Clk_in=>Clk,
        Clk_out=>SlowClk);
    Program_Counter_0:Program_Counter
        port map(
        Clk=>SlowClk,
        Reset=>Reset,
        D=>M2,
        Q=>PC_out);
    ProgramROM_0:ProgramROM
        port map(
        MemSel=>PC_out,
        Instruction=>Ins0);
    MUX_2_to_1_4_0:MUX_2_to_1_4
        port map(
        D0=>A_4,
        D1=>I_V,
        S=>L_S,
        Y=>M3);
    MUX_2_to_1_3_0:MUX_2_to_1_3
        port map(
        D0=>A_3,
        D1=>J_A,
        S=>J,
        Y=>M2);
    MUX_8_to_1_4_0:MUX_8_to_1_4
        port map(
        R0=>R0,
        R1=>R1,
        R2=>R2,
        R3=>R3,
        R4=>R4,
        R5=>R5,
        R6=>R6,
        R7=>R7,
        Y=>M0,
        EN => EN,
        S=>M0_S);
    MUX_8_to_1_4_1:MUX_8_to_1_4
        port map(
        R0=>R0,
        R1=>R1,
        R2=>R2,
        R3=>R3,
        R4=>R4,
        R5=>R5,
        R6=>R6,
        R7=>R7,
        Y=>M1,
        EN => EN,
        S=>M1_S);
    RegisterBank_0:RegisterBank
        port map(
        Clk=>SlowClk,
        Reset=>Reset,
        D=>M3,
        R0=>R0,
        R1=>R1,
        R2=>R2,
        R3=>R3,
        R4=>R4,
        R5=>R5,
        R6=>R6,
        R7=>R7,
        I=>R_E);
    Add_Sub_4bit_0:Add_Sub_4bit
        port map(
        A=>M1,
        B=>M0,
        Sub_Sel=>Sub,
        S=>A_4,
        Overflow=>Overflow,
        Zero=>Zero
        );
    RCA_3_0:RCA_3
        port map(
        A=>PC_out,
        S=>A_3);
    Instruction_Decoder_0:Instruction_Decoder
        Port map (
        Ins =>Ins0,
        Reg_Che_For_Jump =>M0,
        Reg_En =>R_E,
        Load_Im =>L_S,
        Im_Val =>I_V,
        MuxA_Sel =>M0_S,
        MuxB_Sel =>M1_S,
        Sub_Sel =>Sub,
        Jump =>J,
        Address_Jump =>J_A);
R7_out<=R7;
end Behavioral;

