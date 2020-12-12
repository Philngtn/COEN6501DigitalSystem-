library ieee;
use ieee.std_logic_1164.all;

entity Reg2bits is 
  port ( clear , clk , load : in std_logic;
         input2bits : in std_logic_vector (1 downto 0);
         output2bits: out std_logic_vector (1 downto 0));         
end entity; 

architecture structual of Reg2bits is
  
  -- LOAD = 0 => get inputs
  -- RESET = 1 => DFF works
  
  
  component REG is
    port( load, input, clk, reset : in std_logic;
          q, q_bar : out std_logic);
  end component;
  
  begin 
    
    U0: REG port map ( load => load, input => input2bits(0), clk => clk, reset => clear, q => output2bits(0));
      
    U1: REG port map ( load => load, input => input2bits(1), clk => clk, reset => clear, q => output2bits(1));

end architecture;   
