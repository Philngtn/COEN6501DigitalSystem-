library ieee;
use ieee.std_logic_1164.all;

entity LogicFSM is 
  port( reset, load: in std_logic;
        stateIN : in std_logic_vector(1 downto 0);
        stateOUT: out std_logic_vector(1 downto 0));
end entity;

architecture strcutual of LogicFSM is 

  component AND4 is
    port ( A, B, D, E  : in  std_logic;
           C     : out std_logic);
  end component;  
   
  component AND3 is 
    port ( A, B, C : in  std_logic;
           D     : out std_logic);
  end component; 
  
  component INV1 is
    port ( A     : in  std_logic;
           C     : out std_logic);
  end component;
  
  component OR2 is
     port ( A, B  : in  std_logic;
            C     : out std_logic);
  end component;
  
  signal a1, a2, a3 : std_logic;
  signal notLOAD, notS0, notS1 :std_logic;
  
  begin
    
    U0: INV1 port map (A => load, C => notLOAD);
  
    U1: INV1 port map (A => stateIN(1), C => notS1);
      
    U2: INV1 port map (A => stateIN(0), C => notS0);
            
    
    U3: AND4 port map (A => reset, B => notLOAD , 
                       D => notS1, E => stateIN(0), C => a1);
                       
    U4: AND4 port map (A => reset, B => notLOAD,
                       D => stateIN(1), E => notS0, C => a2);
                       
    U5: OR2  port map (A => a1, B => a2, C => stateOUT(1));
      
    U6: AND3 port map (A => reset, B => notLOAD, C => notS0, D => stateOUT(0));
      
end architecture;

            
      
