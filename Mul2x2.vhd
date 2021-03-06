-- ************************************************************************
-- Author: Phuc Nguyen
-- File : Mul2x2.vhd
-- Design Units:
--    entity Mul2x2  
--          function: Multiplier 2 2-bit inputs
--          input: a,b in 2-bits
--          output: c = a x b out 4 bits
--    architecture Multiplier2x2_arch:
--          truth_table based sum_of_products
--          implementation
-- Library/ package
--    ieee.std_logic_1164: to use std_logic
--
--Synthesis and verification: 
--    Synthesis software: ModelSim SE-64 6.6g
--    Options/scripts:
--    Target technology:
--    Test bench: 
--
--Revision history
--    Version: 1.0:
--    Date: 11/2020
--    Comments: 
--
-- ************************************************************************
library ieee;
use ieee.std_logic_1164.all;

entity Mul2x2 is 
  port ( inputA, inputB  : in  std_logic_vector(1 downto 0);
         output     :      out std_logic_vector(3 downto 0));
end entity;

architecture structural of Mul2x2 is
  signal A0AndB1, A1AndB0, A1AndB1, A0AndB0, notA0AndB0 : std_logic; -- signals
  
  component INV1 -- as entity of Invert
    port ( A     : in  std_logic;
           C     : out std_logic);
  end component;
  
  component AND2 -- as entity of AND2
  port ( A, B  : in  std_logic;
         C     : out std_logic);
  end component;
  
  component XOR2 -- as entity of XOR2
  port ( A, B  : in  std_logic;
         C     : out std_logic);
  end component;
  
  component AND4 -- as entity of AND4
  port ( A, B, D, E  : in  std_logic;
         C     : out std_logic);
  end component;
  
begin 
  
  U1: AND2 port map (A => inputA(0), B => inputB(0), C => output(0));
    
  U2: AND2 port map (A => inputA(0), B => inputB(1), C => A0AndB1);
    
  U3: AND2 port map (A => inputA(1), B => inputB(0), C => A1AndB0);
    
  U4: AND2 port map (A => inputA(1), B => inputB(1), C => A1AndB1);
  
  U5: AND2 port map (A => inputA(0), B => inputB(0), C => A0AndB0);
  
  U6: AND4 port map (A => inputA(1), B => inputB(1), D=> inputA(0) , E => inputB(0),C => output(3));    
 
  U7: INV1 port map (A => A0AndB0, C => notA0AndB0);
  
  U8: XOR2 port map (A => A0AndB1, B=> A1AndB0, C => output(1));
    
  U9: AND2 port map (A => A1AndB1, B=> notA0AndB0, C => output(2));
  
  
end architecture;

