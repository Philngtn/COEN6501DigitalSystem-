-- OR gate

library ieee;
use ieee.std_logic_1164.all;

entity OR2 is 
  port ( A, B  : in  std_logic;
         C     : out std_logic);
end entity;

architecture behavior of OR2 is
begin 
  C <= A or B;
end architecture;