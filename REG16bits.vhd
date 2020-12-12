
library ieee;
use ieee.std_logic_1164.all;

entity Reg16bits is 
  port ( clear , clk , load : in std_logic;
         input16bits : in std_logic_vector (15 downto 0);
         output16bits: out std_logic_vector (15 downto 0));         
end entity; 

architecture structual of Reg16bits is
  
  -- LOAD = 0 => get inputs
  -- RESET = 1 => DFF works
  
  
  component REG is
    port( load, input, clk, reset : in std_logic;
          q, q_bar : out std_logic);
  end component;
  
  begin 
    
    U0: REG port map ( load => load, input => input16bits(0), clk => clk, reset => clear, q => output16bits(0));
      
    U1: REG port map ( load => load, input => input16bits(1), clk => clk, reset => clear, q => output16bits(1));
      
    U2: REG port map ( load => load, input => input16bits(2), clk => clk, reset => clear, q => output16bits(2));
      
    U3: REG port map ( load => load, input => input16bits(3), clk => clk, reset => clear, q => output16bits(3));
      
    U4: REG port map ( load => load, input => input16bits(4), clk => clk, reset => clear, q => output16bits(4));
      
    U5: REG port map ( load => load, input => input16bits(5), clk => clk, reset => clear, q => output16bits(5));
      
    U6: REG port map ( load => load, input => input16bits(6), clk => clk, reset => clear, q => output16bits(6));
      
    U7: REG port map ( load => load, input => input16bits(7), clk => clk, reset => clear, q => output16bits(7));
      
    U8: REG port map ( load => load, input => input16bits(8), clk => clk, reset => clear, q => output16bits(8));

    U9: REG port map ( load => load, input => input16bits(9), clk => clk, reset => clear, q => output16bits(9));  

    U10: REG port map ( load => load, input => input16bits(10), clk => clk, reset => clear, q => output16bits(10));

    U11: REG port map ( load => load, input => input16bits(11), clk => clk, reset => clear, q => output16bits(11));
    
    U12: REG port map ( load => load, input => input16bits(12), clk => clk, reset => clear, q => output16bits(12));
    
    U13: REG port map ( load => load, input => input16bits(13), clk => clk, reset => clear, q => output16bits(13));
    
    U14: REG port map ( load => load, input => input16bits(14), clk => clk, reset => clear, q => output16bits(14));
    
    U15: REG port map ( load => load, input => input16bits(15), clk => clk, reset => clear, q => output16bits(15));


end architecture;   