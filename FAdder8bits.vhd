-- 8 bits Full Adder

library ieee;
use ieee.std_logic_1164.all;

entity FAdder8bits is
  port ( A, B: in std_logic_vector(7 downto 0);
         Cin : in std_logic;
         S   : out std_logic_vector(7 downto 0);
         Cout: out std_logic);
end entity;

architecture structural of FAdder8bits is
  
  component FA 
    port (A_Fadd, B_Fadd, C_Fadd: in std_logic;
          S_Fadd, CA_Fadd       : out std_logic);
  end component;
  
  signal c1, c2, c3, c4, c5, c6, c7 : std_logic;
  
  begin 
    
    U1: FA port map (A_Fadd => A(0), B_Fadd =>B(0), C_Fadd => Cin, S_Fadd=> S(0), CA_Fadd => c1);
    U2: FA port map (A_Fadd => A(1), B_Fadd =>B(1), C_Fadd => c1,  S_Fadd=> S(1), CA_Fadd => c2);
    U3: FA port map (A_Fadd => A(2), B_Fadd =>B(2), C_Fadd => c2,  S_Fadd=> S(2), CA_Fadd => c3);
    U4: FA port map (A_Fadd => A(3), B_Fadd =>B(3), C_Fadd => c3,  S_Fadd=> S(3), CA_Fadd => c4);

    U5: FA port map (A_Fadd => A(4), B_Fadd =>B(4), C_Fadd => c4,  S_Fadd=> S(4), CA_Fadd => c5);
    U6: FA port map (A_Fadd => A(5), B_Fadd =>B(5), C_Fadd => c5,  S_Fadd=> S(5), CA_Fadd => c6);
    U7: FA port map (A_Fadd => A(6), B_Fadd =>B(6), C_Fadd => c6,  S_Fadd=> S(6), CA_Fadd => c7);
    U8: FA port map (A_Fadd => A(7), B_Fadd =>B(7), C_Fadd => c7,  S_Fadd=> S(7), CA_Fadd => Cout);      
      
      
end architecture;






