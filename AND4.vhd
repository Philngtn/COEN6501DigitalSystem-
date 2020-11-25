
-- ************************************************************************
-- Author: Phuc Nguyen
-- File : AND4.vhd
-- Design Units:
--    entity AND2  
--          function: AND 4 inputs
--          input: a,b,d,e
--          output: c = a and b and d and e
--    architecture AND2_arch:
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

entity AND4 is 
  port ( A, B, D, E  : in  std_logic;
         C     : out std_logic);
end entity;

architecture behavior of AND4 is
begin 
  C <= A and B and D and E;
end architecture;
