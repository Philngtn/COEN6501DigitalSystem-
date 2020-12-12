library ieee;
use ieee.std_logic_1164.all;

entity REG16bits_tb is
end entity;

architecture testBench of REG16bits_tb is
  
  component REG16bits is 
    port ( clear , clk , load : in std_logic;
           input16bits : in std_logic_vector (15 downto 0);
           output16bits: out std_logic_vector (15 downto 0));   
  end component;
  
  
  signal clear : std_logic := '1';
  signal clk   : std_logic; 
  signal input16bits : std_logic_vector(15 downto 0) := "1111000001110000";
  signal load  : std_logic;
  signal output16bits: std_logic_vector(15 downto 0);
  
  constant clk_period : time := 20 ns;
  
  begin 
    
    U1: REG16bits port map (clear => clear, clk => clk, load => load, 
                           input16bits => input16bits, output16bits => output16bits);
                           
    clk_process: process
    
    begin 
         clk <= '0';
         wait for clk_period/2;
         clk <= '1';
         wait for clk_period/2;
    end process;
      
      
    stim_proc : process
    begin
      load <= '1';
      wait for 20 ns;
      load <= '0';
      wait for 20 ns;
    
      clear <= '0';
      wait for 20 ns;
      clear <= '1';
      wait for 20 ns;
      
      input16bits <= "1111000011110011";
      wait for 20 ns;
      load <= '1';
      wait for 10 ns;
      
      input16bits <= "1111001000001010";
      wait for 10 ns;
      
      input16bits <= "1111000111100000";
      wait for 10 ns;
      
      load <= '0';
      wait;
      
      
      
    end process;
    
end architecture;
      

