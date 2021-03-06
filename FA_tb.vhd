
library IEEE;
use IEEE.std_logic_1164.all;

entity FA_tb is
end entity;

architecture tb of FA_tb is
  
component FA is
  port (A_Fadd, B_Fadd, C_Fadd: in std_logic;
        S_Fadd, CA_Fadd       : out std_logic);
end component;

signal FA1, FB, FC, FS, FCA : STD_LOGIC;

begin

uut : FA port map( A_Fadd =>FA1, B_Fadd  =>FB, C_Fadd => FC, S_Fadd  => FS, CA_Fadd => FCA);

stim : process 
begin

FA1 <= '0';
FB <= '0';
FC <= '0';
wait for 10 ns;
assert ((FS = '0') and (FCA = '0'))
report "test failed for input combination 000" severity error;

FA1 <= '0';
FB <= '0';
FC <= '1';
wait for 10 ns;
assert ((FS = '1') and (FCA = '0'))
report "test failed for input combination 001" severity error;

FA1 <= '0';
FB <= '1';
FC <= '0';
wait for 10 ns;
assert ((FS = '1') and (FCA = '0'))
report "test failed for input combination 010" severity error;

FA1 <= '0';
FB <= '1';
FC <= '1';
wait for 10 ns;
assert ((FS = '0') and (FCA = '1'))
report "test failed for input combination 011" severity error;

FA1 <= '1';
FB <= '0';
FC <= '0';
wait for 10 ns;
assert ((FS = '1') and (FCA = '0'))
report "test failed for input combination 100" severity error;

FA1 <= '1';
FB <= '0';
FC <= '1';
wait for 10 ns;
assert ((FS = '0') and (FCA = '1'))
report "test failed for input combination 101" severity error;

FA1 <= '1';
FB <= '1';
FC <= '0';
wait for 10 ns;
assert ((FS = '0') and (FCA = '1'))
report "test failed for input combination 110" severity error;

FA1 <= '1';
FB <= '1';
FC <= '1';
wait for 10 ns;
assert ((FS = '1') and (FCA = '1'))
report "test failed for input combination 111" severity error;
wait;

end process;

end tb;