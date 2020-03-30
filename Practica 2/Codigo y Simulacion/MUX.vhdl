library ieee;
use ieee.std_logic_1164.all;

entity mux is
  port(A, B, C, D: in bit;
        S1,S2: in bit;
        z: out bit);
end mux;

architecture arch of mux is
begin 
   z <=  A when (S1 = '0') and (S2 = '0') else
         B when (S1 = '1') and (S2 = '0') else
         C when (S1 = '0') and (S2 = '1') else
         D when (S1 = '1') and (S2 = '1') else 
         '0';
  end arch;
