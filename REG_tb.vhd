-- REG test bench 

library ieee;
use ieee.std_logic_1164.all;

entity REG_tb is
end REG_tb;

architecture testBench of REG_tb is
  
  component REG is
      port( load, input, clk, reset : in std_logic;
            q, q_bar : out std_logic);
  end component;
  
  signal input, load, clk, reset, q , q_bar: std_logic;
  
  constant clk_period : time := 10 ns;
  
  begin
    
    U1: REG port map ( load => load ,input => input, clk => clk, reset => reset, q => q, q_bar => q_bar);
      
    clk_process: process
    
    begin 
      clk <= '0';
      wait for clk_period/2;
      clk <= '1';
      wait for clk_period/2;
    end process;
      
    stim_proc: process
    begin
      
      reset <= '1';
      load <= '1';
      input <= '0';
      wait for 40 ns;
      
      load <= '0';
      wait for 20 ns;
      
      input <= '1';
      wait for 40 ns;
      
      input <= '0';
      wait for 40 ns;
      
      load <= '1';
      input <= '1';
      wait for 40 ns;
      
      reset <= '0';
      load <= '0';
      input <= '1';
      wait for 40 ns;
      
      reset <= '1';
      load <= '0';
      input <= '1';
      wait;
      
      
    end process;
    
  
end architecture;
