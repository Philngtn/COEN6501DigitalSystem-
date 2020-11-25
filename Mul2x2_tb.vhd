-- ************************************************************************
-- Author: Phuc Nguyen
-- File : Mul2x2_tb.vhd
-- 
-- Mul2x2 testBench
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


entity Mul2x2_tb is 
  
end entity;
-- ************************************************************************

architecture TB of Mul2x2_tb is 

  component Mul2x2
    port ( inputA, inputB  : in  std_logic_vector(1 downto 0);
           output     :      out std_logic_vector(3 downto 0));
  end component;
  
  signal inputA_tb, inputB_tb: std_logic_vector(1 downto 0);
  signal output_tb           : std_logic_vector(3 downto 0);

begin

  vector: process 
  begin
    inputA_tb <= std_logic_vector(to_unsigned(0,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(0,inputB_tb'length));
    wait for 10 ns;
    
    inputA_tb <= std_logic_vector(to_unsigned(0,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(1,inputB_tb'length));
    wait for 10 ns;
       
    inputA_tb <= std_logic_vector(to_unsigned(0,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(2,inputB_tb'length));
    wait for 10 ns;
    
    inputA_tb <= std_logic_vector(to_unsigned(0,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(3,inputB_tb'length));
    wait for 10 ns;
            
    inputA_tb <= std_logic_vector(to_unsigned(1,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(0,inputB_tb'length));
    wait for 10 ns;
    
    
    inputA_tb <= std_logic_vector(to_unsigned(1,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(1,inputB_tb'length));
    wait for 10 ns;
    
    
    inputA_tb <= std_logic_vector(to_unsigned(1,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(2,inputB_tb'length));
    wait for 10 ns;
    
    
    inputA_tb <= std_logic_vector(to_unsigned(1,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(3,inputB_tb'length));
    wait for 10 ns;
    
    
    inputA_tb <= std_logic_vector(to_unsigned(2,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(0,inputB_tb'length));
    wait for 10 ns;
    
    
    inputA_tb <= std_logic_vector(to_unsigned(2,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(1,inputB_tb'length));
    wait for 10 ns;
    
    
    inputA_tb <= std_logic_vector(to_unsigned(2,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(2,inputB_tb'length));
    wait for 10 ns;
    
    inputA_tb <= std_logic_vector(to_unsigned(2,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(3,inputB_tb'length));
    wait for 10 ns;
    
    
    inputA_tb <= std_logic_vector(to_unsigned(3,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(1,inputB_tb'length));
    wait for 10 ns;
    
    
    inputA_tb <= std_logic_vector(to_unsigned(3,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(2,inputB_tb'length));
    wait for 10 ns;
    
    
    inputA_tb <= std_logic_vector(to_unsigned(3,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(3,inputB_tb'length));
    wait for 10 ns;
  
  inputA_tb <= std_logic_vector(to_unsigned(1,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(0,inputB_tb'length));
    wait for 10 ns;
       
    inputA_tb <= std_logic_vector(to_unsigned(2,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(0,inputB_tb'length));
    wait for 10 ns;
    
    inputA_tb <= std_logic_vector(to_unsigned(3,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(0,inputB_tb'length));
    wait for 10 ns;
            
    inputA_tb <= std_logic_vector(to_unsigned(0,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(1,inputB_tb'length));
    wait for 10 ns;
    
    inputA_tb <= std_logic_vector(to_unsigned(2,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(1,inputB_tb'length));
    wait for 10 ns;
    
    
    inputA_tb <= std_logic_vector(to_unsigned(3,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(1,inputB_tb'length));
    wait for 10 ns;
    
    
    inputA_tb <= std_logic_vector(to_unsigned(0,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(2,inputB_tb'length));
    wait for 10 ns;
    
    
    inputA_tb <= std_logic_vector(to_unsigned(1,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(2,inputB_tb'length));
    wait for 10 ns;
    
    
    inputA_tb <= std_logic_vector(to_unsigned(3,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(2,inputB_tb'length));
    wait for 10 ns;
    
    
    inputA_tb <= std_logic_vector(to_unsigned(1,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(3,inputB_tb'length));
    wait for 10 ns;
    
    
    inputA_tb <= std_logic_vector(to_unsigned(2,inputA_tb'length));
    inputB_tb <= std_logic_vector(to_unsigned(3,inputB_tb'length));
    wait for 10 ns;
  
  
  
    wait;
    
  end process;
  
  U1 : Mul2x2 port map (inputA => inputA_tb, inputB => inputB_tb, output => output_tb);
  
end architecture;
  
  