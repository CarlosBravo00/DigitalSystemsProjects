library ieee;
use ieee.std_logic_1164.all;

ENTITY FullAdder IS
   PORT (
    A,B,Cin : in BIT;
    Cout, S : out BIT
   );
END ENTITY;
  
  architecture arch of FullAdder is
      begin
        S <= (A xor B) xor Cin;
        Cout <= (A and B) or (A and Cin) or (B and Cin);
  end arch;