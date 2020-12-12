library ieee;
use ieee.std_logic_1164.all;

--  MEALY MACHINE

entity FSM is 
  port ( clk, reset, load : in std_logic;
         output : out std_logic_vector(1 downto 0));
end entity;

architecture structual of FSM is
  
  component REG2bits is 
    port ( clear , clk , load : in std_logic;
           input2bits : in std_logic_vector (1 downto 0);
           output2bits: out std_logic_vector (1 downto 0));      
  end component;
  
  component LogicFSM is
    port( reset, load: in std_logic;
          stateIN : in std_logic_vector(1 downto 0);
          stateOUT: out std_logic_vector(1 downto 0));
  end component;
  
  
  signal  statePlus, outReg : std_logic_vector(1 downto 0);
  
  begin
    
    U1: LogicFSM port map ( reset => reset, load => load, 
                            stateIN => outReg, stateOUT => statePlus);
                            
    U2: REG2bits port map ( clear => reset, clk => clk, load => load, 
                            input2bits => statePlus, output2bits => outReg);
                            
    output <= statePlus;
                         
end architecture;   
                    
