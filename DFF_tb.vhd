-- DFF test bench 

library ieee;
use ieee.std_logic_1164.all;

entity DFF_tb is
end DFF_tb;

architecture testBench of DFF_tb is
  
  component DFF is
      port (d, clk, reset: in std_logic;
            q, q_bar : out std_logic);
  end component;
  
  signal din, clock, rst, q , q_bar: std_logic;
  
  constant clk_period : time := 10 ns;
  
  begin
    
    U1: DFF port map ( d => din, clk => clock, reset => rst, q => q, q_bar => q_bar);
      
    clk_process: process
    
    begin 
      clock <= '0';
      wait for clk_period/2;
      clock <= '1';
      wait for clk_period/2;
    end process;
      
    stim_proc: process
    begin
      
      rst <= '1';
      din <= '0';
      wait for 40 ns;
      
      din <= '1';
      wait for 40 ns;
      
      din <= '0';
      wait for 40 ns;
      
      rst <= '0';
      din <= '1';
      wait for 40 ns;
      
      rst <= '1';
      wait;
      
    end process;
    
  
end architecture;