-- ************************************************************************
-- Author: Phuc Nguyen
-- File : DFF.vhd
-- Design Units:
--    entity DFF  
--          function: DFF 
--          input: d, clk
--          output: q

--    architecture DFF:
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

entity DFF is 
  port ( d, clk, reset: in std_logic;
         q, q_bar : out std_logic);
end DFF;

-- RST = 1, DFF runs.
-- RST = 0, DFF always reset

architecture structual of DFF is
  
    component NAND2 is
      port ( A, B  : in  std_logic;
             C     : out std_logic);
    end component;
    
    component NAND3 is
      port ( A, B, C  : in  std_logic;
             D     : out std_logic);
    end component;
  
    signal a1, a2, a3, a4, b1, b2 : std_logic;
  
    begin
       
      U1: NAND2 port map(A => a4, B => a2, C => a1);
      U2: NAND3 port map(A => a1, B => clk, C =>reset, D => a2);
      U3: NAND3 port map(A => a2, B => clk, C => a4, D => a3);
      U4: NAND3 port map(A => a3, B => d, C => reset, D => a4);
        
      U5: NAND2 port map(A => a2, B => b2, C => b1);
      U6: NAND3 port map(A => b1, B => a3, C => reset, D => b2);
        
      q <= b1;
      q_bar <= b2;
    
  
end architecture;

  
   
  