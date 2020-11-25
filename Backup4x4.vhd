
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
  
  signal vA3B2, vB1A0, cA3B0, cB3A0, cvOperant1, vOperant1 : std_logic_vector(3 downto 0);
  signal cS, vS, cvS : std_logic_vector(3 downto 0); -- for Full adder
  signal cY: std_logic;
  --signal x: std_logic_vector(1 downto 0);
  
begin 
  
  -- Cross product
  
  U1: Mul2x2 port map(inputA => inputA4x4(1 downto 0), inputB => inputB4x4(3 downto 2), output=> cB3A0); 
  U2: Mul2x2 port map(inputA => inputA4x4(3 downto 2), inputB => inputB4x4(1 downto 0), output=> cA3B0);
  
  -- Vertical product
  --x <= ( inputA4x4(1) & inputA4x4(0));
  
  U3: Mul2x2 port map(inputA => inputA4x4(3 downto 2), inputB => inputB4x4(3 downto 2), output=> vA3B2); 
  U4: Mul2x2 port map(inputA => inputA4x4(1 downto 0), inputB => inputB4x4(1 downto 0), output=> vB1A0);
  
   -- FAdder4bits in cross product
  
  U5: FA4bits port map(A => cB3A0, B => cA3B0, Cin => '0', S => cS, Cout=> cY);
    
  -- FAdder4bits in both cross and vertical
  
  cvOperant1 <= "00" & vB1A0(3 downto 2);
  
  U6: FA4bits port map(A => cS, B => cvOperant1, Cin => '0', S => cvS);
  
  -- Fadder4bits in vertical product
  
  vOperant1 <=   '0' & cY & cvS(3 downto 2);
  
  U7: FA4bits port map(A => vOperant1, B => vA3B2 , Cin => '0' , S => vS);
    
  output4x4 <= (vS & cvS(1 downto 0) & vB1A0(1 downto 0));
    
end architecture;


