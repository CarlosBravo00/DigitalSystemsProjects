library ieee;
use ieee.std_logic_1164.all;

  entity mux_4_1 is
  port(A, B, C, D: in bit;
        S1,S2: in bit;
        z: out bit);
end mux_4_1;

architecture comport of mux_4_1 is

   z <=  A when (S1 = '0') and (S2 = '0') else
         B when (S1 = '1') and (S2 = '0') else
         C when (S1 = '0') and (S2 = '1') else
         D when (S1 = '1') and (S2 = '1') else
         null when OTHERS;
  end comport;
