library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all;

entity Controller is 
  port ( clk, clear, load, Cout: in std_logic;
         load_8bits_cmd,load_16bits_cmd, clear_cmd: out std_logic;
         end_flag : out std_logic);
         
end entity;

architecture rtl of Controller is
    
   
  
  type state_type is (IDLE, INIT, EXP, ENDF);   
  signal state: state_type;
  
  begin 
  
    process(clk, clear) is
    
      begin
          
          if clear = '0' then
             clear_cmd <= '0';
             state <= IDLE;
          
            
          elsif (clk'event and clk = '1') then
         
            case ( state ) is
                
                when IDLE =>
                   clear_cmd <= '1';
                   
                   if ( load = '0' ) then
                     state <= INIT;
                   else                    
                     state <= IDLE;
                   end if;
              
                when INIT => 
                   
                   state <= EXP;
                   
                when EXP =>
                   state <= ENDF;
                   
                when ENDF =>
                    state <= IDLE;  
                
             end case;
      
      end if;
      
      end process;
      
      load_8bits_cmd <= '0' when (state = INIT and load = '0') else '1';
      END_FLAG <= '1' when (state = ENDF and load = '0') else  '0';
      load_16bits_cmd <= '0' when state = EXP else '1';
      
      
end architecture;        
          
          
          
          
              

