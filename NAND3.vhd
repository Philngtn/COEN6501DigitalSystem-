
-- ************************************************************************
-- Author: Phuc Nguyen
-- File : NAND3.vhd
-- Design Units:
--    entity NAND3  
--          function: NAND 3 inputs
--          input: a,b,c
--          output: d = not (a and b and c) 
--    architecture XOR_arch:
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

entity NAND3 is 
  port ( A, B, C  : in  std_logic;
         D     : out std_logic);
end entity;

architecture behavior of NAND3 is
begin 
  D <= not (A and B and C);
end architecture;