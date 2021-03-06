-- Structual model for HALF ADDER in Structural

library ieee;
use ieee.std_logic_1164.all;

entity HA is 
  port ( A_hadd,B_hadd : in std_logic;
         S_hadd,C_hadd : out std_logic);
end entity;

architecture structural of HA is
  
  component AND2 -- as entity of AND2
  port ( A, B  : in  std_logic;
         C     : out std_logic);
  end component;
  
  component XOR2 -- as entity of XOR2
  port ( A, B  : in  std_logic;
         C     : out std_logic);
  end component;
  
  begin
    
    U1: XOR2 port map ( A => A_hadd,B => B_hadd, C => S_hadd); 
    U2: AND2 port map ( A => A_hadd,B => B_hadd, C => C_hadd);
      
end architecture;
