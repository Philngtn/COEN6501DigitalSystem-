-- ************************************************************************
-- Author: Phuc Nguyen
-- File : XOR2.vhd
-- Design Units:
--    entity AND2  
--          function: XOR 2 inputs
--          input: a,b
--          output: c = a xor b
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

entity XOR2 is 
  port ( A, B  : in  std_logic;
         C     : out std_logic);
end entity;

architecture behavior of XOR2 is
begin 
  C <= A xor B;
end architecture;