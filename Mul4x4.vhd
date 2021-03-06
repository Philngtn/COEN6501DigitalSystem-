
-- ************************************************************************
-- Author: Phuc Nguyen
-- File : Mul4x4.vhd
-- Design Units:
--    entity Mul4x4  
--          function: Multiplier 2 4-bit inputs
--          input: a,b in 4-bits
--          output: c = a x b out 8 bits
--    architecture Mul4x4_arch:
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

entity Mul4x4 is 
  port ( inputA4x4, inputB4x4  : in  std_logic_vector(3 downto 0);
         output4x4        :      out std_logic_vector(7 downto 0));
end entity;

architecture structural of Mul4x4 is
  
  component Mul2x2 -- as entity of Mul2x2
    port ( inputA, inputB  : in  std_logic_vector(1 downto 0);
           output     :      out std_logic_vector(3 downto 0));
  end component;
  
  component FA4bits -- as entity of Full Adder 4 bits
  port ( A, B: in std_logic_vector(3 downto 0);
         Cin : in std_logic;
         S   : out std_logic_vector(3 downto 0);
         Cout: out std_logic);
  end component;
  
  component HA is 
     port ( A_hadd,B_hadd : in std_logic;
            S_hadd,C_hadd : out std_logic);
   end component;
 
   component OR2 is 
     port ( A, B  : in  std_logic;
            C     : out std_logic);
   end component;
  
  -- v means vectical
  -- c means cross
  -- vc means operation of 2
  
  signal B32A32, B32A10, B10A32, B10A10, cvOperant1, vOperant1 : std_logic_vector(3 downto 0);
  signal S1, S2 : std_logic_vector(3 downto 0); -- for Full adder
  signal cY1, cY2, cY3, OR_out, S3, S4 : std_logic;
  
  
begin 
  
  --
  
  U1: Mul2x2 port map(inputA => inputA4x4(3 downto 2), inputB => inputB4x4(3 downto 2), output=> B32A32); 
  U2: Mul2x2 port map(inputA => inputA4x4(1 downto 0), inputB => inputB4x4(3 downto 2), output=> B32A10);

  U3: Mul2x2 port map(inputA => inputA4x4(3 downto 2), inputB => inputB4x4(1 downto 0), output=> B10A32); 
  U4: Mul2x2 port map(inputA => inputA4x4(1 downto 0), inputB => inputB4x4(1 downto 0), output=> B10A10);
  
   -- FAdder4bits in cross product
  
  U5: FA4bits port map(A => B32A10, B => B10A32, Cin => '0', S => S1, Cout=> cY1);
    
  -- FAdder4bits in both cross and vertical
  
  cvOperant1 <=  B32A32(1 downto 0) & B10A10(3 downto 2);
  
  U6: FA4bits port map(A => S1, B => cvOperant1, Cin => '0', S => S2, Cout=> cY2);
  
  U7: OR2 port map(A => cY1, B => cY2, C=> OR_out); 
  
  U8: HA port map(A_hadd => B32A32(2), B_hadd => OR_out, S_hadd =>S3, C_hadd => cY3);
    
  U9: HA port map(A_hadd => B32A32(3), B_hadd => cY3, S_hadd => S4);
    
  output4x4 <= S4 & S3 & S2 & B10A10(1 downto 0);
      
end architecture;

