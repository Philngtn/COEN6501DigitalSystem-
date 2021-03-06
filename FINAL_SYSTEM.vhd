library ieee;
use ieee.std_logic_1164.all;

entity FINAL_SYSTEM is
  port( clk, clear, load : in std_logic;
        A, B: in std_logic_vector(7 downto 0);
        
        RA_o, RB_o : out std_logic_vector(7 downto 0);
        clear_CMD, load_CMD : out std_logic;
        
        END_FLAG: out std_logic;
        RZ_o, Z, Z_FLOAT   : out std_logic_vector(15 downto 0));
end entity;


architecture rtl of FINAL_SYSTEM is
  
      component MUL2ADD is
        port ( A , B : in std_logic_vector( 7 downto 0);
               C , C_FLOAT  : out std_logic_vector (15 downto 0);
             
               END_FLAG : out std_logic);
      end component;

      component Controller is
        port ( clk, clear, load, END_FLAG : in std_logic;
               load_cmd, reset_cmd : out std_logic);
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
      
      signal loadCMD, resetCMD : std_logic;
      signal RA, RB : std_logic_vector(7 downto 0);
      signal RZ, RZ_F : std_logic_vector(15 downto 0);
      signal outMUL2ADD : std_logic_vector(15 downto 0);
      signal END_FLAG_SIGNAL : std_logic := '0';
       
      
      begin
       
        U1: Controller port map( clk => clk, clear => clear, load => load, END_FLAG => END_FLAG_SIGNAL,
                                 load_cmd => loadCMD, reset_cmd => resetCMD);
        
        U2: REG8bits port map( clear => resetCMD, clk => clk, load => loadCMD, 
                               input8bits => A, output8bits => RA);
                  
        U3: REG8bits port map( clear => resetCMD, clk => clk, load => loadCMD, 
                               input8bits => B, output8bits => RB);
                               
        U4: MUL2ADD port map( A => RA, B => RB, C => RZ, C_FLOAT => RZ_F, END_FLAG => END_FLAG_SIGNAL);
          
          
        U5: REG16bits port map( clear => resetCMD, clk => clk, load => loadCMD,
                                input16bits => RZ, output16bits => Z);
        
        U6: REG16bits port map( clear => resetCMD, clk => clk, load => loadCMD,
                                input16bits => RZ_F, output16bits => Z_FLOAT);
        
        RA_o <= RA;
        RB_o <= RB;
        RZ_o <= RZ;
        load_CMD <= loadCMD;
        clear_CMD <= resetCMD;
        
end architecture;
                                       
                               
                               
                               
                               
                               
                               
                               
                               
        
        