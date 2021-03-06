library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FA16bits_tb is
end entity;

architecture tb of FA16bits_tb is
  
  component FA16bits is
    port ( A, B: in std_logic_vector(15 downto 0);
           Cin : in std_logic;
           S   : out std_logic_vector(15 downto 0);
           Cout: out std_logic);
  end component;

  signal A_tb, B_tb, S_tb : std_logic_vector(15 downto 0);
  signal Cout_tb, Cin_tb : std_logic;
  
  
  begin
    
    U1: FA16bits port map(A => A_tb, B=> B_tb, Cin => Cin_tb, S=>S_tb, Cout => Cout_tb);
      
  stim: process
  begin
    
    A_tb <= std_logic_vector(to_unsigned(50000,A_tb'length));
    B_tb <= std_logic_vector(to_unsigned(53,B_tb'length));
    Cin_tb <= '0';
    wait for 10 ns;
    
    A_tb <= std_logic_vector(to_unsigned(10000,A_tb'length));
    B_tb <= std_logic_vector(to_unsigned(14,B_tb'length));
    Cin_tb <= '1';
    wait for 10 ns;
    
    A_tb <= std_logic_vector(to_unsigned(50,A_tb'length));
    B_tb <= std_logic_vector(to_unsigned(90,B_tb'length));
    Cin_tb <= '0';
    wait for 10 ns;
    
    A_tb <= std_logic_vector(to_unsigned(20000,A_tb'length));
    B_tb <= std_logic_vector(to_unsigned(91,B_tb'length));
    Cin_tb <= '1';
    wait for 10 ns;
    
    A_tb <= std_logic_vector(to_unsigned(24,A_tb'length));
    B_tb <= std_logic_vector(to_unsigned(45,B_tb'length));
    Cin_tb <= '0';
    wait for 10 ns;
    
    A_tb <= std_logic_vector(to_unsigned(5,A_tb'length));
    B_tb <= std_logic_vector(to_unsigned(9,B_tb'length));
    Cin_tb <= '1';
    wait for 10 ns;
    
    A_tb <= std_logic_vector(to_unsigned(3,A_tb'length));
    B_tb <= std_logic_vector(to_unsigned(7,B_tb'length));
    Cin_tb <= '0';
    wait for 10 ns;
    
    A_tb <= std_logic_vector(to_unsigned(2,A_tb'length));
    B_tb <= std_logic_vector(to_unsigned(1,B_tb'length));
    Cin_tb <= '1';
    wait;
    
    
  end process;
  
end tb;




