library ieee;
use ieee.std_logic_1164.all;

entity Reg8bits is 
  port ( clear , clk , load : in std_logic;
         input8bits : in std_logic_vector (7 downto 0);
         output8bits: out std_logic_vector (7 downto 0));         
end entity; 

architecture structual of Reg8bits is
  
  -- LOAD = 0 => get inputs
  -- RESET = 1 => DFF works
  
  
  component REG is
    port( load, input, clk, reset : in std_logic;
          q, q_bar : out std_logic);
  end component;
  
  begin 
    
    U0: REG port map ( load => load, input => input8bits(0), clk => clk, reset => clear, q => output8bits(0));
      
    U1: REG port map ( load => load, input => input8bits(1), clk => clk, reset => clear, q => output8bits(1));
      
    U2: REG port map ( load => load, input => input8bits(2), clk => clk, reset => clear, q => output8bits(2));
      
    U3: REG port map ( load => load, input => input8bits(3), clk => clk, reset => clear, q => output8bits(3));
      
    U4: REG port map ( load => load, input => input8bits(4), clk => clk, reset => clear, q => output8bits(4));
      
    U5: REG port map ( load => load, input => input8bits(5), clk => clk, reset => clear, q => output8bits(5));
      
    U6: REG port map ( load => load, input => input8bits(6), clk => clk, reset => clear, q => output8bits(6));
      
    U7: REG port map ( load => load, input => input8bits(7), clk => clk, reset => clear, q => output8bits(7));

end architecture;   