-- ************************************************************************
-- Author: Phuc Nguyen
-- File : Mul8x8.vhd
-- Design Units:
--    entity Mul8x8  
--          function: Multiplier 2 8-bit inputs
--          input: a,b in 8-bits
--          output: c = a x b out 16 bits
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

entity Mul8x8 is 
  port ( inputA8x8, inputB8x8  : in  std_logic_vector(7 downto 0);
         output8x8        :      out std_logic_vector(15 downto 0));
end entity;

architecture structural of Mul8x8 is
  
  component Mul4x4 -- as entity of Mul4x4
     port ( inputA4x4, inputB4x4  : in  std_logic_vector(3 downto 0);
            output4x4        :      out std_logic_vector(7 downto 0));
  end component;
  
  component FAdder8bits -- as entity of Full Adder 8 bits
  port ( A, B: in std_logic_vector(7 downto 0);
         Cin : in std_logic;
         S   : out std_logic_vector(7 downto 0);
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
  
  signal B74A74, B30A74, B74A30, B30A30, cvOperant1 : std_logic_vector(7 downto 0);
  signal S1, S2 : std_logic_vector(7 downto 0); -- for Full adder
  signal cY1, cY2, cY3, cY4, cY5, OR_out : std_logic;
  signal S4 : std_logic_vector(3 downto 0);
  
begin 
  
  --
  
  U1: Mul4x4 port map(inputA4x4 => inputA8x8(7 downto 4), inputB4x4 => inputB8x8(7 downto 4), output4x4 => B74A74); 
  U2: Mul4x4 port map(inputA4x4 => inputA8x8(7 downto 4), inputB4x4 => inputB8x8(3 downto 0), output4x4 => B30A74);
  U3: Mul4x4 port map(inputA4x4 => inputA8x8(3 downto 0), inputB4x4 => inputB8x8(7 downto 4), output4x4 => B74A30); 
  U4: Mul4x4 port map(inputA4x4 => inputA8x8(3 downto 0), inputB4x4 => inputB8x8(3 downto 0), output4x4 => B30A30);
  
  -- FAdder8bits in cross product
  
  U5: FAdder8bits port map(A => B30A74, B => B74A30, Cin => '0', S => S1, Cout=> cY1); 
    
  -- FAdder4bits in both cross and vertical
  
  cvOperant1 <=  B74A74(3 downto 0) & B30A30(7 downto 4);
  
  U6: FAdder8bits port map(A => S1, B => cvOperant1, Cin => '0', S => S2, Cout=> cY2);
    
  -- S2 8-bits
  
  U7: OR2 port map(A => cY1, B => cY2, C=> OR_out); 
  
  U8: HA port map(A_hadd => B74A74(4), B_hadd => OR_out, S_hadd =>S4(0), C_hadd => cY3);
    
  U9: HA port map(A_hadd => B74A74(5), B_hadd => cY3, S_hadd => S4(1), C_hadd => cY4);
  
  U10: HA port map(A_hadd => B74A74(6), B_hadd => cY4, S_hadd => S4(2), C_hadd => cY5);
    
  U11: HA port map(A_hadd => B74A74(7), B_hadd => cY5, S_hadd => S4(3)); -- S4 4-bits
    
  output8x8 <= S4 & S2 & B30A30(3 downto 0);
      
end architecture;




