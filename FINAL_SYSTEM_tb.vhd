library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity FINAL_SYSTEM_tb is
end entity;

architecture testBench of FINAL_SYSTEM_tb is
  
  component FINAL_SYSTEM is
  
    port( clk, clear, load : in std_logic;
          A, B             : in std_logic_vector(7 downto 0);
          
          RA_o, RB_o : out std_logic_vector(7 downto 0);
          clear_CMD, load_CMD : out std_logic;
          
          END_FLAG     : out std_logic;
          Z, Z_FLOAT   : out std_logic_vector(15 downto 0));
  end component;


  -- clear := negative reset
  -- load := 0 runs ( 1 -> 0 )
   
  signal clear : std_logic :='0';
  signal clk : std_logic;
  signal load : std_logic:= '1'; 
  signal END_FLAG : std_logic := '0';
  signal A, B : std_logic_vector(7 downto 0);
  signal Z, Z_FLOAT : std_logic_vector(15 downto 0);
  
  signal RA_o, RB_o : std_logic_vector(7 downto 0);
  signal clear_CMD, load_CMD : std_logic;
  
  
  constant clk_period: time:= 20 ns;
  
  begin 
    
    U1: FINAL_SYSTEM port map (clk => clk, clear => clear, load => load,
                               A => A, B => B, END_FLAG => END_FLAG, Z => Z, Z_FLOAT => Z_FLOAT,
                               RA_o => RA_o, RB_o => RB_o);
    
    clk_process : process
                               
    begin 
         clk <= '0';
         wait for clk_period/2;
         clk <= '1';
         wait for clk_period/2;
    end process;
    
    stim_prc : process
    begin
      
      load <= '0';
      A <= std_logic_vector(to_unsigned(240,8));
      B <= std_logic_vector(to_unsigned(123,8));
      wait for 40 ns;
      
      load <= '1';
      A <= std_logic_vector(to_unsigned(23,8));
      B <= std_logic_vector(to_unsigned(235,8));
      wait for 50 ns;
      
      load <= '0';
      clear <= '0';
      wait for 20 ns;
      
      A <= std_logic_vector(to_unsigned(22,8));
      B <= std_logic_vector(to_unsigned(34,8));
      wait for 20 ns;
      
      load <= '0';
      clear <= '1';
      wait for 20 ns;
      
      A <= std_logic_vector(to_unsigned(23,8));
      B <= std_logic_vector(to_unsigned(66,8));
      wait for 20 ns;
      
            
      A <= std_logic_vector(to_unsigned(124,8));
      B <= std_logic_vector(to_unsigned(34,8));
      wait for 20 ns;
      
      clear <= '1';
      wait;
      
    end process;
    
end architecture;  
    
                     
                                
  
