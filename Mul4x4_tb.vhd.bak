
-- ************************************************************************
-- Author: Phuc Nguyen
-- File : Mul4x4_tb.vhd
-- 
-- Mul4x4 testBench
-- 
-- Revision history
--    Version: 1.0:
--    Date: 11/2020
--    Comments: 
--
-- ************************************************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Mul4x4_tb is 
  
end entity;
-- ************************************************************************

architecture TB of Mul4x4_tb is 

  component Mul4x4
    port ( inputA4x4, inputB4x4  : in  std_logic_vector(3 downto 0);
         output4x4     :      out std_logic_vector(7 downto 0));
  end component;
  
  signal inputA_tb, inputB_tb: std_logic_vector(3 downto 0);
  signal output_tb           : std_logic_vector(7 downto 0);

begin

  U1 : Mul4x4 port map (inputA4x4 => inputA_tb, inputB4x4 => inputB_tb, output4x4 => output_tb);

  stim: process 
  begin
    
    test_loop: for k in 0 to 15 loop
      
      test_loop2: for i in 0 to 15 loop
        
        inputA_tb <= std_logic_vector(to_unsigned(k,inputA_tb'length));
        inputB_tb <= std_logic_vector(to_unsigned(i,inputB_tb'length));
        wait for 10 ns;
    
       end loop test_loop2;
       
    end loop test_loop;
    
    
    wait;
  
  end process;
  
  
  
end architecture;
  
  