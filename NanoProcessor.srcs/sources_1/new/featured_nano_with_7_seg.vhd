library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 

entity Featured_Nano_Processor_with_7Seg is
 Port ( Clk : in STD_LOGIC; 
 Reset : in STD_LOGIC; 
 Overflow : out STD_LOGIC; 
 Zero : out STD_LOGIC; 
 LED_out : out STD_LOGIC_VECTOR (3 downto 0);
 Anode_7Seg : out STD_LOGIC_VECTOR (3 downto 0);
 Cathode_7Seg : out STD_LOGIC_VECTOR (6 downto 0));
end Featured_Nano_Processor_with_7Seg;
 
architecture Behavioral of Featured_Nano_Processor_with_7Seg is

 component Featured_Nano_processor 
 Port ( Clk : in STD_LOGIC; 
 Reset : in STD_LOGIC;  
 Overflow : out STD_LOGIC; 
 Zero : out STD_LOGIC; 
 R7_out : out STD_LOGIC_VECTOR (3 downto 0));
 end component; 
 
 component Out_controll_7seg_final 
 Port ( Clk : in STD_LOGIC; 
 R7_out : in STD_LOGIC_VECTOR (3 downto 0);
 Anode_out : out STD_LOGIC_VECTOR (3 downto 0);
 Cathode_out : out STD_LOGIC_VECTOR (6 downto 0));
 end component; 
 
 component ResetController
 Port ( ResIn : in STD_LOGIC; 
 Clk : in STD_Logic; 
 ResOut : out STD_LOGIC);
 end component; 
 
 signal R7_output:std_logic_vector(3 downto 0);
 signal ResINPUT:std_logic; 
begin
ResetController_0:ResetController
 port map( 
 ResIn=>Reset,
 Clk=>Clk,
  ResOut=>ResINPUT );
  
 Featured_Nano_processor_0 : Featured_Nano_processor
  port map( 
  Clk=>Clk,
  Reset=>ResINPUT,
  Overflow=>Overflow,
  Zero=>Zero,
  R7_out=>R7_output );
  
 LED_out<=R7_output;
 
 Out_controll_7seg_final_0:Out_controll_7seg_final
  Port map ( 
  Clk =>Clk,
  R7_out=>R7_output,
  Anode_out=>Anode_7Seg,
  Cathode_out=>Cathode_7Seg);
  
 end Behavioral;