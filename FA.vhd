-- Full Adder

library ieee;
use ieee.std_logic_1164.all;

entity FA is
  port (A_Fadd, B_Fadd, C_Fadd: in std_logic;
        S_Fadd, CA_Fadd       : out std_logic);
end entity;

architecture structural of FA is
  
  component HA is 
    port ( A_hadd,B_hadd : in std_logic;
           S_hadd,C_hadd : out std_logic);
  end component;

  component OR2 is 
    port ( A, B  : in  std_logic;
           C     : out std_logic);
  end component;
  
  signal s0, s1, s2 : std_logic;
  
  begin 
    
  U1: HA  port map (A_hadd => A_Fadd, B_hadd => B_Fadd, S_hadd => s0,    C_hadd => s1);
  U2: HA  port map (A_hadd => s0,     B_hadd => C_Fadd, S_hadd => S_Fadd,C_hadd => s2);
    
  U3: OR2 port map(A => s2, B=>s1, C=>CA_Fadd);
    
end architecture;