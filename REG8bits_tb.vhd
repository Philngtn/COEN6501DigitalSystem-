library ieee;
use ieee.std_logic_1164.all;

entity REG8bits_tb is
end entity;

architecture testBench of REG8bits_tb is
  
  component REG8bits is 
    port ( clear , clk , load : in std_logic;
           input8bits : in std_logic_vector (7 downto 0);
           output8bits: out std_logic_vector (7 downto 0));   
  end component;
  
  
  signal clear : std_logic := '1';
  signal clk   : std_logic; 
  signal input8bits : std_logic_vector(7 downto 0) := "01110000";
  signal load  : std_logic;
  signal output8bits: std_logic_vector(7 downto 0);
  
  constant clk_period : time := 20 ns;
  
  begin 
    
    U1: REG8bits port map (clear => clear, clk => clk, load => load, 
                           input8bits => input8bits, output8bits => output8bits);
                           
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
      
      input8bits <= "11110000";
      wait for 20 ns;
      load <= '1';
      wait for 10 ns;
      
      input8bits <= "11110010";
      wait for 10 ns;
      
      input8bits <= "11110001";
      wait for 10 ns;
      
      load <= '0';
      wait;
      
      
      
    end process;
    
end architecture;
      