library ieee; 
use ieee.std_logic_1164.all;

entity NAND_tb is
end entity;

architecture testBench of NAND_tb is
  
  component NAND2 is
    port ( A, B  : in  std_logic;
         C     : out std_logic);
  end component;
   
  component NAND3 is
    port ( A, B, C  : in  std_logic;
           D     : out std_logic);    
  end component;
  
  signal inputA, inputB, inputC, outputC, outputD :std_logic;
  
  begin
    
    U1: NAND2 port map(A => inputA, B=>inputB, C=> outputC);
    U2: NAND3 port map(A => inputA, B=>inputB, C=> inputC, D=> outputD);
      
  stim: process
  begin
    
    inputA <= '0';
    inputB <= '0';
    inputC <= '0';
    wait for 10 ns;
    
    inputA <= '1';
    inputB <= '1';
    wait for 10 ns;
    
    inputC <= '1';
    wait for 10 ns;
    
    inputA <= '0';
    wait;
  end process;
end;
    