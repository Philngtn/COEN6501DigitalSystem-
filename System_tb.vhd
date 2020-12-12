library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity System_tb is
end entity;

architecture testBench of System_tb is
  
  component System is
    port( A, B  : in std_logic_vector(7 downto 0);
          load, clear, clk : in std_logic;
          
          END_FLAG : out std_logic; 
          Z, Z_Float : out std_logic_vector(15 downto 0));
          
  end component;
  
  
  -- clear := negative reset
  -- load := 0 runs ( 1 -> 0 )
  
  signal clear : std_logic;
  signal clk : std_logic;
  signal load : std_logic:= '1'; 
  signal A, B : std_logic_vector(7 downto 0);
  signal Z, Z_Float : std_logic_vector(15 downto 0);
  signal END_FLAG_SIG : std_logic;
  
  
  constant clk_period: time:= 25 ns;
  
  
    begin 
      
      U1: System port map (clk => clk, clear => clear, load => load,
                           A => A, B => B, Z => Z, Z_Float => Z_Float,
                           END_FLAG => END_FLAG_SIG);
      
      clk_process : process
                                 
      begin 
           clk <= '0';
           wait for clk_period/2;
           clk <= '1';
           wait for clk_period/2;
      end process;
      
      stim_prc : process
      begin
        
        
        clear <= '0';
        wait for 50 ns;
        
        clear <= '1';
        wait for 50 ns;
        
        load <= '0';
        A <= std_logic_vector(to_unsigned(240,8));
        B <= std_logic_vector(to_unsigned(123,8));
        wait for 150 ns;
        
        load <= '1';
        wait for 50 ns;
        A <= std_logic_vector(to_unsigned(23,8));
        B <= std_logic_vector(to_unsigned(235,8));
        wait for 100 ns;
      
        load <= '0';
        A <= std_logic_vector(to_unsigned(1,8));
        B <= std_logic_vector(to_unsigned(7,8));
        wait for 200 ns;
        
        load <= '1';
        A <= std_logic_vector(to_unsigned(76,8));
        B <= std_logic_vector(to_unsigned(85,8));
        wait for 100 ns;
        
        load <= '0';
        clear <= '0';
        A <= std_logic_vector(to_unsigned(23,8));
        B <= std_logic_vector(to_unsigned(66,8));
        wait for 200 ns;
        
        load <= '1';
        A <= std_logic_vector(to_unsigned(124,8));
        B <= std_logic_vector(to_unsigned(34,8));
        wait for 100 ns;
        
        clear <= '0';
        load <= '0';
        A <= std_logic_vector(to_unsigned(76,8));
        B <= std_logic_vector(to_unsigned(76,8));
        wait for 200 ns;
        
        load <= '0';
        clear <= '1';
        A <= std_logic_vector(to_unsigned(54,8));
        B <= std_logic_vector(to_unsigned(323,8));
        wait for 100 ns;
        
        load <= '1';
        A <= std_logic_vector(to_unsigned(442,8));
        B <= std_logic_vector(to_unsigned(76,8));
        wait for 100 ns;
                
        load <= '1';
        A <= std_logic_vector(to_unsigned(235,8));
        B <= std_logic_vector(to_unsigned(76,8));
        wait for 100 ns;
        
        load <= '0';
        A <= std_logic_vector(to_unsigned(45,8));
        B <= std_logic_vector(to_unsigned(34,8));
        wait;
        
        
        
        
        
      end process;
      
  end architecture; 