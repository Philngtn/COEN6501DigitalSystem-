
library ieee;
use ieee.std_logic_1164.all;

entity System is

  port( A, B  : in std_logic_vector(7 downto 0);
        load, clear, clk : in std_logic;
         
         
        END_FLAG : out std_logic;  
        Z, Z_Float : out std_logic_vector(15 downto 0));
        
end entity;


architecture strutural of System is
  
  component FA16bits
    port ( A, B: in std_logic_vector(15 downto 0);
           Cin : in std_logic;
           
           S   : out std_logic_vector(15 downto 0);
           Cout: out std_logic);
  end component;
  
  component MUL8x8 is
    port ( inputA8x8, inputB8x8  : in  std_logic_vector(7 downto 0);
           output8x8        :      out std_logic_vector(15 downto 0));
  end component;
  
  component Controller
     port ( clk, clear, load, Cout: in std_logic;
           load_8bits_cmd, clear_cmd, load_16bits_cmd, END_FLAG: out std_logic);
  end component;
  
  component REG8bits is
          port ( clear , clk , load : in std_logic;
                 input8bits : in std_logic_vector (7 downto 0);
                 output8bits: out std_logic_vector (7 downto 0));   
  end component; 
        
  component REG16bits is
          port ( clear , clk , load : in std_logic;
                input16bits : in std_logic_vector (15 downto 0);
                output16bits: out std_logic_vector (15 downto 0));     
  end component;
  
  signal Cout: std_logic;
  signal RA, RB : std_logic_vector(7 downto 0);
  signal RC ,RZ , RZ_REAL   : std_logic_vector(15 downto 0);
  signal Cfour : std_logic_vector(15 downto 0) := "0000000000000100";
  signal load_8bits_cmd, clear_cmd, load_16bits_cmd, mul_8bits, add_8bits: std_logic;
  
  
  begin 
    
    
    U1: Controller port map( clk => clk, clear => clear, load => load, Cout => Cout,
                            load_8bits_cmd => load_8bits_cmd,  clear_cmd => clear_cmd, load_16bits_cmd => load_16bits_cmd 
                            , END_FLAG => END_FLAG);
                                                                        
        
    U2: REG8bits   port map( clear => clear_cmd, clk => clk, load => load_8bits_cmd, 
                             input8bits => A, output8bits => RA);
    
    
    
    U3: REG8bits   port map( clear => clear_cmd, clk => clk, load => load_8bits_cmd, 
                             input8bits => B, output8bits => RB);
    
  
    U4: MUL8x8    port map ( inputA8x8=> RA, inputB8x8 => RB, output8x8 => RC);
      
    U6: FA16bits  port map ( A => RC, B=> Cfour, Cin => '0', S => RZ, Cout => Cout);
       
    RZ_REAL <= "00" & RZ(15 downto 2);   
       
    U5: REG16bits port map (clear => clear_cmd, clk => clk, load => load_16bits_cmd,
                            input16bits =>  RZ_REAL  , output16bits => Z);
                            
    U7: REG16bits port map (clear => clear_cmd, clk => clk, load => load_16bits_cmd,
                            input16bits =>  RZ, output16bits => Z_Float);              
  
  
  
  end architecture;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  